<?php
/**
 * @Class: Index
 * @Describe: 加载总后台
 * @Author: cgq
 * @CreateTime: 2018/9/21
 */
namespace app\admin\controller;
use think\Controller;
use think\Db;
class Index extends Controller
{
    /**
     * @Method Name: 总后台首页
     * @describe: 进入总后台得首页
     * @Author:
     * @Return:
     */
    public function index()
    {
        return $this->fetch('/welcome/index');
    }
    /**
     * @Method Name: 欢迎页
     * @describe：总后台首页右边部分
     * @Author:
     * @Return:
     */
    public function getIndex()
    {
        return $this->fetch('/welcome/welcome');
    }
    /**
     * @Method Name: 管理员列表
     * @describe：展示管理员信息
     * @Author:
     * @Return:
     */
    public function getList()
    {
        $list = Db::field('m.mName,m.mRegdate,m.mDel,p.paNum,r.rName,a.amID')
            ->table(['lyt_member'=> 'm','lyt_phone_activation'=> 'p','lyt_admin_member'=> 'a','lyt_roll'=> 'r'])->where('a.amID = m.mID AND a.rID=r.rID')
            ->select();
        var_dump($list);die;
        return $this->fetch('/admin/list',['list'=>$list]);
    }
    /**
     * @Method Name: 管理员添加页
     * @describe：管理员添加
     * @Author:
     * @Return:
     */
    public function getAdd()
    {
        $list = db('roll')->order('rID asc')->select();
        return $this->fetch('/admin/add',['list'=>$list]);
    }
    /**
     * @Method Name: 执行管理员添加
     * @describe：先插入用户表，再把插入成功得id当作用户id插入手机登录信息表和总后台管理员表
     * @Author:
     * @Return:
     */
    public function postAdd()
    {
        $data = array(
            'mName'=>$_POST['mName'],
            'mValidPhone'=>1,
            'mRegdate'=>date('YmdHis',time())
        );
        $mID = db('member')->insertGetId($data);
        //获取4位随机数作为盐码
        $paSalt = $this->paSalt();
        $data_phone = array(
            'mID'=>$mID,
            'paNum'=>$_POST['paNum'],
            'paSalt'=>$paSalt,
            'paRegdate'=>date('YmdHis',time()),
            'paPW'=>md5($_POST['paPW'].$paSalt)
        );
        $res_phone = db('phone_activation')->insert($data_phone);
        $data_mem = array(
            'amID'=>$mID,
            'rID'=>$_POST['rID']
        );
        $res_mem = db('admin_member')->insert($data_mem);
        if($res_phone && $res_mem){
            return 1;
        }else{
            return 2;
        }
    }
    /**
     * @Method Name: 管理员修改页
     * @describe：管理员修改
     * @Author:
     * @Return:
     */
    public function getEdit()
    {
        $list = db('roll')->order('rID asc')->select();
        $data = Db::field('m.mName,p.paNum,r.rID,m.mID')
            ->table(['lyt_member'=> 'm','lyt_phone_activation'=> 'p','lyt_admin_member'=> 'a','lyt_roll'=> 'r'])->where('a.amID = '.$_GET['id'].' AND a.rID=r.rID')->find();
        return $this->fetch('/admin/edit',['list'=>$list,'data'=>$data]);
    }
    /**
     * @Method Name: 执行管理员修改
     * @describe：管理员修改1 成功 2 原密码错误 3 与原密码一致 4 修改失败
     * @Author:
     * @Return:
     */
    public function postEdit()
    {
        $pass = db('phone_activation')->field('paPW,paSalt')->where('mID',$_POST['mID'])->find();
        if($pass['paPW'] == md5($_POST['paPW'].$pass['paSalt'])){
            if($pass['paPW'] == md5($_POST['paPW2'].$pass['paSalt'])){
                return 3;
            }else{
                $res_mem = db('member')->where('mID',$_POST['mID'])->update(['mName'=>$_POST['mName']]);
                $res_phone = db('phone_activation')->where('mID',$_POST['mID'])->update(['paNum'=>$_POST['paNum'],'paPW'=>md5($_POST['paPW2'].$pass['paSalt'])]);
                if($res_phone){
                    return 1;
                }else{
                    return 4;
                }
            }
        }else{
            return 2;
        }
    }
    /**
     * @Method Name: 管理员状态修改
     * @describe：管理员状态修改
     * @Author:
     * @Return:
     */
    public function postMem_status()
    {
        $status = db('member')->field('mDel')->where('mID',$_POST['id'])->find();
        $data = array();
        if($status['mDel'] == 0){
            $data['mDel'] = 1;
        }else{
            $data['mDel'] = 0;
        }
        $result = db('member')->where('mID',$_POST['id'])->update($data);
        if($result){
            return 1;
        }else{
            return 2;
        }
    }
    /**
     * @Method Name: 管理员删除
     * @describe：管理员删除
     * @Author:
     * @Return:
     */
    public function postDel()
    {
        $res_mem = db('member')->where('mID',$_POST['id'])->delete();
        $res_phone = db('phone_activation')->where('mID',$_POST['id'])->delete();
        $res_admin_mem = db('admin_member')->where('amID',$_POST['id'])->delete();
        if($res_mem && $res_phone && $res_admin_mem){
            return 1;
        }else{
            return 2;
        }
    }
    /**
     * @Method Name: 角色列表页
     * @describe：角色展示
     * @Author:
     * @Return:
     */
    public function getRole()
    {
        $list = db('roll')->order('rID asc')->select();
        return $this->fetch('/admin_role/list',['list'=>$list]);
    }
    /**
     * @Method Name: 角色添加页
     * @describe：角色添加页面
     * @Author:
     * @Return:
     */
    public function getRole_add()
    {
        return $this->fetch('/admin_role/add');
    }
    /**
     * @Method Name: 角色添加
     * @describe：角色添加
     * @Author:
     * @Return:
     */
    public function postRole_add()
    {
        $_POST['rAddTime'] = date('YmdHis',time());
        $result = db('roll')->insert($_POST);
        if($result){
            return 1;
        }else{
            return 2;
        }
    }
    /**
     * @Method Name: 角色修改页
     * @describe：角色修改页面
     * @Author:
     * @Return:
     */
    public function getRole_edit()
    {
        $data = db('roll')->field('rID,rName')->where('rID',$_GET['id'])->find();
        return $this->fetch('/admin_role/edit',['data'=>$data]);
    }
    /**
     * @Method Name: 角色修改
     * @describe：角色修改
     * @Author:
     * @Return:
     */
    public function postRole_edit()
    {
        $_POST['rAddTime'] = date('YmdHis',time());
        $result = db('roll')->where('rID',$_POST['rID'])->update($_POST);
        if($result){
            return 1;
        }else{
            return 2;
        }
    }
    /**
     * @Method Name: 角色删除
     * @describe：角色删除
     * @Author:
     * @Return:
     */
    public function postRole_del()
    {
        $result = db('roll')->where('rID',$_POST['id'])->delete();
        if($result){
            return 1;
        }else{
            return 2;
        }
    }
    /**
     * @Method Name: 角色状态修改
     * @describe：角色状态修改
     * @Author:
     * @Return:
     */
    public function postRole_status()
    {
        $status = db('roll')->field('rDel')->where('rID',$_POST['id'])->find();
        $data = array();
        if($status['rDel'] == 0){
            $data['rDel'] = 1;
        }else{
            $data['rDel'] = 0;
        }
        $result = db('roll')->where('rID',$_POST['id'])->update($data);
        if($result){
            return 1;
        }else{
            return 2;
        }
    }
    /**
     * @Method Name: 权限管理页
     * @describe
     * @Author:
     * @Return:
     */
    public function getAuth()
    {
        return $this->fetch('/admin_auth/list');
    }
    /**
     * @Method Name: 随机获取字符串
     * @describe
     * @Author:
     * @Return:
     */
    function paSalt( $length = 4 )
    {
        $str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        $str = str_shuffle($str);
        return substr($str,0,$length);
    }
}