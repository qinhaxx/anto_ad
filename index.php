<?php
//开启session
	session_start();
	require_once("tpl.class.php");
	require_once("db.php");
//登录验证
if(isset($_POST['u_num'])){
	$u_num = $_POST['u_num'];
	$u_pwd = $_POST['u_pwd'];
	//查询user数据库
	$db = new DB();
	$sql = "select * from anto_ad where u_num='{$u_num}' and u_pwd='{$u_pwd}';";
	$res = $db->execute($sql);
	if(empty($res)){
		echo 0;
		return false;
	}else{
		//查询员工姓名和工号
		$db = new DB();
		$sql = "select * from anto_ad where u_num='$u_num';";
		$res = $db->execute($sql);
		foreach($res as $value);
		$u_name = $value['u_name'];
		$_SESSION['u_num'] = $u_num;
		$_SESSION['u_name'] = $u_name;
		echo "go";
		return false;
		//写入日志！！！
	}
}
//防止登录信息溢出
	$smarty->assign('u_group',"");
	$smarty->assign('u_name',"");
	$smarty->assign('u_num',"");
//展示
	$smarty->display("index.tpl");
?>