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
        return $this->fetch('/admin/list');
    }
    /**
     * @Method Name: 管理员添加页
     * @describe：管理员添加
     * @Author:
     * @Return:
     */
    public function getAdd()
    {
        return $this->fetch('/admin/add');
    }
    /**
     * @Method Name: 角色列表页
     * @describe：角色展示
     * @Author:
     * @Return:
     */
    public function getRole()
    {
        $list = db('roll')->select();
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
     * @Method Name: 角色删除
     * @describe：角色删除
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
}