<?php
//开启session
	session_start();
	require_once("tpl.class.php");
	require_once("db.php");
	@$u_name=$_SESSION['u_name'];
	if($u_name==""){
		echo "<script>alert('您还没有登陆，请登陆！');window.location='index.php';</script>";die;
	}else{
		$smarty->assign("u_name",$u_name);
	}
	$smarty->assign("u_name",$u_name);

//退出系统
	if(isset($_GET['logout'])){
		echo "<script>window.location='index.php';</script>";
		session_destroy();
		return false;
	}

//登录验证
	if(isset($_POST['old_pwd'])){
		$old_pwd = $_POST['old_pwd'];
		$new_pwd = $_POST['new_pwd'];
		$re_pwd = $_POST['re_pwd'];
		if($old_pwd == ""){
			echo "empty_old";
			return false;
		}
		if($new_pwd == ""){
			echo "empty_new";
			return false;
		}
		if($new_pwd !== $re_pwd){
			echo "pwd";
			return false;
		}
		
		//查询user数据库
		$db = new DB();
		$sql = "select u_pwd from user where u_name='{$u_name}';";
		$res = $db->execute($sql);
		foreach ($res as $key => $value) {
			$u_pwd = $value['u_pwd'];
		}
		if ($u_pwd!==$old_pwd) {
			echo "error_pwd";
			return false;
		}else{
			$sql = "update user set u_pwd='{$new_pwd}' where u_name='{$u_name}';";
			$res = $db->execute($sql);
			echo "ok";
			return false;
		}
	}
//展示
	$smarty->display("show.tpl");
?>