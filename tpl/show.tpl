<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>ANTO - 广告排期系统</title>
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="./css/style.css">
	<link href="./css/datetimepicker.css" rel="stylesheet">
	<script src="./js/jquery.js"></script>
	<script src="./js/bootstrap.js"></script>
	<script src="./js/bootstrap-datetimepicker.min.js"></script>
	<script  type="text/javascript" src="./js/datepicker_language/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	{literal}
	<script>
$(document).ready(function(){
	//默认展示第一页
	show_list(1)
	//格式化日期
	$(".datepicker").datetimepicker({format:'yyyy-mm-dd',weekStart:1,todayBtn:1,autoclose:1,startView:2,forceParse:0,showMeridian:1,minView:2,language:'zh-CN'});
});

//日期报警
function day_warning(){
	//结束日期报警
	$(".end_time").each(function(){
		var ss = $(this).text();
		ss=new Date(ss.replace("-", "/").replace("-", "/")); 
		var today = new Date();
		if(ss<today){  
        	$(this).css({color:"red"})  
    	}  
	})
}

//选择赋值
function site_select(){
	$("#site_select a").each(function(){
		$(this).click(function(){
			var msg = $(this).text();
			$("#site_select_txt").text(msg)
			$("#add_site_name").val(msg);
		})
	})
}

//展示列表
function show_list(e){
	$.ajax({
        type:"POST",
        url:"show.php",
        data:"show_list="+e,
        dataType:"json",
        success:function(data){
			$("#list_table").empty();
			var html = "";
			$.each(data,function(index,json){
				html += '<tr class="my_hover"><td>'+json.site_name+'</td><td>'+json.ad_name+'</td><td>'+json.start_time+'</td><td class="end_time">'+json.end_time+'</td><td>'+json.url+'</td><td>'+json.pic+'</td><td>'+json.desc_info+'</td><td>'+json.others+'</td><td><a class="btn btn-xs btn-primary" onclick="change_ad(\''+json.id+'\')">修 改</a> &nbsp;<a class="btn btn-xs btn-danger" onclick="remove_ad(\''+json.id+'\')">删 除</a></td></tr>';
			})
			html = '<tr class="my_bar"><td>站点名称</td><td>广告名称</td><td>开始时间</td><td>结束时间</td><td>产品链接</td><td>图片链接</td><td>详情描述</td><td>备注其他</td><td>操作</td></tr>'+html;
			$("#list_table").html(html);
			day_warning();
			all_count(e);
		}
    })
}

//总数统计
function all_count(e){
	$.ajax({
        type:"POST",
        url:"show.php",
        data:"all_count="+e,
        success:function(data){
			$('#all_count').text(data);
		}
    })
}

//添加广告
function add_ad(){
	var add_info = $("#add_box input").serialize();
	var site_select_txt = $("#site_select_txt").text();
	if(site_select_txt=="选择站点" || site_select_txt=="全部站点"){
		site_select_txt=1;
	}
	$.ajax({
        type:"POST",
        url:"show.php",
        data:add_info,
        success:function(data){
			if(data=="ok"){
				$('#error_info').text('广告添加成功！');
				$('#errorModal').modal('show');
			    setTimeout(function(){
			    	$('#errorModal').modal('hide');
			    },2000)
			    $('.bs-example-modal-lg2').modal('hide');
			    show_list(site_select_txt)
			}
		}
    })
}

//删除广告
function remove_ad(e){
	var site_select_txt = $("#site_select_txt").text();
	if(site_select_txt=="选择站点" || site_select_txt=="全部站点"){
		site_select_txt=1;
	}
	$.ajax({
        type:"POST",
        url:"show.php",
        data:"remove_ad="+e,
        success:function(data){
			if(data=="ok"){
				$('#error_info').text('广告删除成功！');
				$('#errorModal').modal('show');
			    setTimeout(function(){
			    	$('#errorModal').modal('hide');
			    },2000)
			    show_list(site_select_txt)
			}
		}
    })
}

//站点展示
function show_site(){
	$.ajax({
        type:"POST",
        url:"show.php",
        data:"show_sitemanage=1",
        dataType:"json",
        success:function(data){
			$("#show_site").empty();
			var html = "";
			$.each(data,function(index,json){
				html += '<li class="pointer" onclick="show_list(\''+json.ad_site+'\')"><a>'+json.ad_site+'</a></li>';
			})
			html = '<li class="pointer" onclick="show_list(1)"><a>全部站点</a></li>'+html;
			$("#show_site").html(html);
			site_select();
		}
    })
}

//站点调用
function show_sitemanage(){
	$.ajax({
        type:"POST",
        url:"show.php",
        data:"show_sitemanage=1",
        dataType:"json",
        success:function(data){
			$("#site_manage").empty();
			var html = "";
			$.each(data,function(index,json){
				html += '<tr><td width="70%" style="font-size:14px;">'+json.ad_site+'</td><td><a class="btn btn-xs btn-danger" onclick="remove_site(\''+json.ad_site+'\')">删 除</a></td></tr>';
			})
			html = '<tr class="danger"><td width="70%">店名</td><td>操作</td></tr>'+html;
			$("#site_manage").html(html);
		}
    })
}

//新建站点
function add_site(){
	var new_site = $("#new_site").val();
	$.ajax({
        type:"POST",
        url:"show.php",
        data:"new_site="+new_site,
        success:function(data){
			if(data=="ok"){
				$('#error_info').text('新建成功！');
				$('#errorModal').modal('show');
			    setTimeout(function(){
			    	$('#errorModal').modal('hide');
			    },2000)
			    $('#pwd_modal').modal('hide');
			    show_sitemanage();
			}
        },
        error: function(){
            //请求出错处理
            alert("Error!");
        }
    })
}

//删除站点
function remove_site(e){
	$.ajax({
        type:"POST",
        url:"show.php",
        data:"remove_site="+e,
        success:function(data){
			if(data=="ok"){
				$('#error_info').text('删除成功！');
				$('#errorModal').modal('show');
			    setTimeout(function(){
			    	$('#errorModal').modal('hide');
			    },2000)
			    $('#pwd_modal').modal('hide');
			    show_sitemanage();
			}
        },
        error: function(){
            //请求出错处理
            alert("Error!");
        }
    })
}

//修改密码
function change_pwd(){
	var input_info = $("#change_pwd input").serialize();

	$.ajax({
        type:"POST",
        url:"show.php",
        data:input_info,
        success:function(data){
			if(data=="ok"){
				$('#error_info').text('修改成功！');
				$('#errorModal').modal('show');
			    setTimeout(function(){
			    	$('#errorModal').modal('hide');
			    },2000)
			    $('#pwd_modal').modal('hide');
			}else if(data=='pwd'){     
				$('#error_info').text('两次密码不匹配！');
				$('#errorModal').modal('show');
			    setTimeout(function(){
			    	$('#errorModal').modal('hide');
			    },2000)
			}else if(data=='empty_new'){     
				$('#error_info').text('新密码不能为空！');
				$('#errorModal').modal('show');
			    setTimeout(function(){
			    	$('#errorModal').modal('hide');
			    },2000)
			}else if(data=='empty_old'){     
				$('#error_info').text('原密码不能为空！');
				$('#errorModal').modal('show');
			    setTimeout(function(){
			    	$('#errorModal').modal('hide');
			    },2000)
			}else if(data=='error_pwd'){     
				$('#error_info').text('原密码错误！');
				$('#errorModal').modal('show');
			    setTimeout(function(){
			    	$('#errorModal').modal('hide');
			    },2000)
			}
        },
        error: function(){
            //请求出错处理
            alert("Error!");
        }
    })
}
</script>
	{/literal}
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<nav class="navbar navbar-default">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" href="#">ANTO - 广告排期系统</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<!--任务添加-->
						<li onclick="show_sitemanage()" class="pointer hover_bg" data-toggle="modal" data-target=".bs-example-modal-lg">
							<a>站点管理</a>
						</li>
						<li class="ml10 pointer hover_bg" data-toggle="modal" data-target=".bs-example-modal-lg2">
							<a>添加广告</a>
						</li>
						<!--/任务添加-->
						<!--站点选择-->
						<li class="dropdown hover_bg" onclick="show_site()" id="site_select">
							<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								<span id="site_select_txt">选择站点</span>
								<span class="caret"></span>
							</a>
							<ul id="show_site" class="dropdown-menu" >
								<li role="separator" class="divider"></li>
							</ul>
						</li>
						<!--/站点选择-->
						<li class="pointer">
							<a>共计：<span id="all_count"></span></a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<!--检索-->
						<li class="ml10 " style="margin-top:7px;width:210px;">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="输入广告名称关键字">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">检 索</button>
								</span>
							</div>
						</li>
						<!--/检索-->
						<li>
							<a class="pointer" data-toggle="modal" data-target=".bs-example-modal-lg3">欢迎你：{$u_name}</a>
						</li>
						<li style="border-left:1px solid #eee;border-right:1px solid #eee;" class="hover_bg">
							<a href="/show.php?logout">退出</a>
						</li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</nav>
			<table id="list_table" class="table table-bordered table-striped table-condensed" style="width:94%;margin:40px 0 40px 40px;"></table>
		</div>
		<!-- /.container-fluid -->
	</div>
	<!--站点管理弹框-->
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<div class="page-header">
					<small>站点管理</small>
				</div>
				<div class="input-group pull-right" style="width:240px;margin-right:10px;">
					<input id="new_site" type="text" class="form-control" placeholder="添加站点" >
					<span class="input-group-btn">
						<button class="btn btn-default" onclick="add_site()" type="button">添 加</button>
					</span>
				</div>
				<div class="clearfix"></div>
				<table id="site_manage" class="table table-bordered table-striped mt20 table-condensed" style="margin-right:10px;">
				</table>
			</div>
		</div>
	</div>
	<!--/站点管理弹框-->
	<!--添加广告弹框-->
	<div class="modal fade bs-example-modal-lg2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<div class="page-header">
					<small>添加广告</small>
				</div>
				<div id="add_box" class="auto" style="width:370px;margin-bottom:30px;">
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">站点名称</span>
						<input name="site_name" id="add_site_name" readonly type="text" class="form-control" placeholder="Site" aria-describedby="basic-addon1" value="全部站点"></div>
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">广告名称</span>
						<input name="ad_name" type="text" class="form-control" placeholder="Ad Name" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">开始时间</span>
						<input name="start_time" type="text" readonly class="form-control datepicker" placeholder="Start Time" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">结束时间</span>
						<input name="end_time" type="text" readonly class="form-control datepicker" placeholder="End Time" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">产品链接</span>
						<input name="url" type="text" class="form-control" placeholder="Product URL" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">图片链接</span>
						<input name="pic" type="text" class="form-control" placeholder="Picture URL" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">详情描述</span>
						<input name="desc" type="text" class="form-control" placeholder="To Describe" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">备注其他</span>
						<input name="others" type="text" class="form-control" placeholder="Others" aria-describedby="basic-addon1"></div>
					<div style="margin-top:30px;">
						<a onclick="add_ad()" class="btn btn-primary" href="#" role="button">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/添加任务弹框-->
	<!--修改密码弹框-->
	<div id="pwd_modal" class="modal fade bs-example-modal-lg3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<div class="page-header">
					<small>修改密码</small>
				</div>
				<div id="change_pwd" class="auto" style="width:370px;margin-bottom:30px;">
					<div class="input-group mt10">
						<span class="input-group-addon">原 &nbsp;密 &nbsp;码&nbsp;</span>
						<input name="old_pwd" type="password" class="form-control" placeholder="Old Password" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon">新 &nbsp;密 &nbsp;码&nbsp;</span>
						<input name="new_pwd" type="password" class="form-control" placeholder="New Password" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon">确认密码&nbsp;</span>
						<input name="re_pwd" type="password" class="form-control" placeholder="Repeat Password" aria-describedby="basic-addon1"></div>
					<div style="margin-top:30px;">
						<a class="btn btn-danger" href="#" role="button" onclick="change_pwd()">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;改&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/修改密码弹框-->
<!--错误提示框-->
<div id="errorModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
	<div class="modal-dialog modal-sm">
		<div id="error_info" class="modal-content">用户名 / 密码输入错误！</div>
	</div>
</div>
<!--/错误提示框-->
</body>
</html>