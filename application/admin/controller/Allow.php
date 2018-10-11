<?php
namespace app\admin\controller;
use think\Controller;
class Allow extends Controller
{
    //初始化方法
    public function _initialize(){
        //检测是否具有用户的登录session信息
        if(!session('uname')){
            $this->error("请先登录","/login/Index");
        }
        //创建请求对象
        $request=request();
        //获取当前管理员访问模块 控制器和方法
        $controller = strtolower($request->controller());
        $action = $request->action();
        // 获取session信息
        $nodelist=session('nodelist');
        // 对比访问的数据是否的在session里
        if(empty($nodelist[$controller]) || !in_array($action,$nodelist[$controller])){
            $this->error('没有权限，请访问超级管理员');
        }
    }
}
