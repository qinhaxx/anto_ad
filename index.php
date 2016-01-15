<?php
//开启session
	session_start();
	require_once("tpl.class.php");
	require_once("db.php");
//登录验证
if(isset($_POST['u_name'])){
	$u_name = $_POST['u_name'];
	$u_pwd = $_POST['u_pwd'];
	//查询user数据库
	$db = new DB();
	$sql = "select * from user where u_name='{$u_name}' and u_pwd='{$u_pwd}';";
	$res = $db->execute($sql);
	if(empty($res)){
		echo 0;
		return false;
	}else{
		$_SESSION['u_name'] = $u_name;
		echo "go";
		return false;
	}
}
//展示
	$smarty->display("index.tpl");
?>