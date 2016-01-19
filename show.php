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
	$db = new DB();

//退出系统
	if(isset($_GET['logout'])){
		echo "<script>window.location='index.php';</script>";
		session_destroy();
		return false;
	}

//广告展示
	if(isset($_POST['show_list'])){
		$now_site = $_POST['show_list'];
		if($now_site == 1){ //全部站点
			$sql = "select * from ad_table order by end_time;";
		}else{
			$sql = "select * from ad_table where site_name='{$now_site}' order by end_time;";
		}
		$res = $db->execute($sql);
		echo json_encode($res);
		return false;
	}

//总数统计
	if(isset($_POST['all_count'])){
		$all_count = $_POST['all_count'];
		if($all_count == 1){ //全部站点
			$sql = "select count(1) as count from ad_table;";
		}else{
			$sql = "select count(1) as count from ad_table where site_name='{$all_count}';";
		}
		$res = $db->execute($sql);
		foreach ($res as $value);
		foreach ($value as $value);
		echo $value;
		return false;
	}

//添加广告
	if(isset($_POST['ad_name'])){
		$site_name = $_POST['site_name'];
		$ad_name = $_POST['ad_name'];
		$start_time = $_POST['start_time'];
		$end_time = $_POST['end_time'];
		$url = $_POST['url'];
		$pic = $_POST['pic'];
		$desc = $_POST['desc'];
		$others = $_POST['others'];
		$sql = "insert into ad_table(site_name,ad_name,start_time,end_time,url,pic,desc_info,others)values('{$site_name}','{$ad_name}','{$start_time}','{$end_time}','{$url}','{$pic}','{$desc}','{$others}');";
		$res = $db->execute($sql);
		echo "ok";
		return false;
	}

//删除广告
	if(isset($_POST['remove_ad'])){
		$remove_ad = $_POST['remove_ad'];
		$sql = "delete from ad_table where id='{$remove_ad}';";
		$res = $db->execute($sql);
		echo "ok";
		return false;
	}

//查询站点
	if(isset($_POST['show_sitemanage'])){
		$sql = "select * from ad_store;";
		$res = $db->execute($sql);
		echo json_encode($res);
		return false;
	}

//新建站点
	if(isset($_POST['new_site'])){
		$new_site = $_POST['new_site'];
		//由于没必要，此处不作验证
		//插入数据
		$sql = "insert into ad_store(ad_site) values('{$new_site}');";
		$res = $db->execute($sql);
		echo "ok";
		return false;
	}

//删除站点
	if(isset($_POST['remove_site'])){
		$remove_site = $_POST['remove_site'];
		//删除数据
		$sql = "delete from ad_store where ad_site='{$remove_site}';";
		$res = $db->execute($sql);
		echo "ok";
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