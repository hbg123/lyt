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
     * @Author:
     * @Return:
     */
    public function getIndex()
    {
        return $this->fetch("login/login");
    }
    /**
     * @Method Name: 执行登录
     * @describe: 执行登录并缓存
     * @Author:
     * @Return:
     */
    public function postDologin(){
        $request = request();
        $paNum = $request->param('paNum');
        $paPW = $request->param('paPW');
        $res_phone = db('phone_activation')->where("paNum = $paNum")->select();
        if($res_phone){
            return 1;
        }else{
            return 2;
        }
        return $res_phone;
//        if($res){
//            //设置用户登录信息写入到session
//            session('uname',$name);
//            return 1;
//        }else{
//            return 2;
//        }
    }
}