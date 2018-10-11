<?php
/**
 * @Class: Index
 * @Describe: 加载总后台登录页
 * @Author: cgq
 * @CreateTime: 2018/9/21
 */
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Login extends Controller
{
    /**
     * @Method Name: 总后台登录页
     * @describe: 进入总后台登录页
     * @Author:如梦一场
     * @Return:
     */
    public function getIndex()
    {
        return $this->fetch("login/login");
    }
    /**
     * @Method Name: 执行登录
     * @describe: 执行登录把角色名和用户名还有权限数组缓存
     * @param: $mID 用户ID,$rID 角色ID,$nodelist 权限数组
     * @Author: 如梦一场
     * @Return: 1代表正确，2代表错误
     */
    public function postDologin(){
        $request = request();
        $paNum = $request->param('paNum');
        $paPW = $request->param('paPW');
        $res_phone = db('phone_activation')->field('mID,paPW,paSalt')->where("paNum = $paNum")->find();
        if($res_phone){
            $mID = $res_phone['mID'];
            $res_member = db('member')->field('mName')->where("mID = $mID and mDel = 0")->find();
            if($res_member){
                if($res_phone['paPW'] == md5($paPW.$res_phone['paSalt'])){
                    $res_role = Db::field('r.rName,r.rID')->table('lyt_admin_member a,lyt_roll r')->where("a.amID = $mID and a.rID = r.rID")->find();
                    $data = array(
                        'mName'=>$res_member['mName'],
                        'rName'=>$res_role['rName']
                    );
                    session('uname',$data);
                    $rID = $res_role['rID'];
                    $res_auth = Db::field('m.amUrl')->table('lyt_auth_roll r,lyt_auth_menu m')->where("r.rID = $rID and r.amID = m.amID")->select();
                    $nodelist['index'][] = "getindex";
                    $nodelist['index'][] = "getwelcome";
                    foreach($res_auth as $key=>$value){
                        $auth = explode('/',$value['amUrl']);
                        $nodelist[$auth[1]][] = 'get'.$auth[2];
                    }
                    session('nodelist',$nodelist);
                    return 1;
                }else{
                    return 2;
                }
            }else{
                return 2;
            }
        }else{
            return 2;
        }
    }
    /**
     * @Method Name: 退出登录
     * @describe: 退出登录清除缓存
     * @Author:如梦一场
     * @Return:
     */
    public function getOutlogin()
    {
        session('uname',null);
        session('nodelist',null);
        $this->redirect('/login/index');
    }
}