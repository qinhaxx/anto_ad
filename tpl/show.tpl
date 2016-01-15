<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>ANTO-广告排期系统</title>
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
	site_select()
	$(".datepicker").datetimepicker({format:'yyyy-mm-dd',weekStart:1,todayBtn:1,autoclose:1,startView:2,forceParse:0,showMeridian:1,minView:2,language:'zh-CN'});
});
function site_select(){
	$("#site_select a").each(function(){
		$(this).click(function(){
			var msg = $(this).text();
			$("#site_select_txt").html(msg)
		})
	})
}
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
					<a class="navbar-brand" href="#">ANTO-广告排期系统</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<!--任务添加-->
						<li class="ml10 pointer hover_bg" data-toggle="modal" data-target=".bs-example-modal-lg2">
							<a>新增任务</a>
						</li>
						<!--/任务添加-->
						<!--站点选择-->
						<li class="dropdown hover_bg" id="site_select" style="margin-left:20px;">
							<a class="dropdown-toggle"  data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
								<span id="site_select_txt" >全部站点</span>
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li class="pointer">
									<a>全部站点</a>
								</li>
								<li class="pointer">
									<a>YAHOO GTX</a>
								</li>
								<li class="pointer">
									<a>RAKUTEN IGTX</a>
								</li>
								<li role="separator" class="divider"></li>
								<li class="pointer" data-toggle="modal" data-target=".bs-example-modal-lg" style="padding-left:20px;">站点管理</li>
							</ul>
						</li>
						<!--/站点选择-->
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
					<input type="text" class="form-control" placeholder="添加站点" >
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">添 加</button>
					</span>
				</div>
				<div class="clearfix"></div>
				<table class="table table-bordered table-striped mt20 table-condensed" style="margin-right:10px;">
					<tr class="danger">
						<td>店名</td>
						<td>操作</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
					<tr>
						<td>yahoo gtx</td>
						<td class="">
							<a class="btn btn-xs btn-danger">删 除</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!--/站点管理弹框-->
	<!--添加任务弹框-->
	<div class="modal fade bs-example-modal-lg2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
				<div class="page-header">
					<small>添加广告</small>
				</div>
				<div class="auto" style="width:370px;margin-bottom:30px;">
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">站点名称</span>
						<input type="text" class="form-control" placeholder="Site" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">广告名称</span>
						<input type="text" class="form-control" placeholder="Ad Name" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">开始时间</span>
						<input type="text" readonly class="form-control datepicker" placeholder="Start Time" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">结束时间</span>
						<input type="text" readonly class="form-control datepicker" placeholder="End Time" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">详情描述</span>
						<input type="text" class="form-control" placeholder="To Describe" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon" id="basic-addon1">备注其他</span>
						<input type="text" class="form-control" placeholder="Others" aria-describedby="basic-addon1"></div>
					<div style="margin-top:30px;">
						<a class="btn btn-primary" href="#" role="button">
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
						<input name="old_pwd" type="text" class="form-control" placeholder="Old Password" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon">新 &nbsp;密 &nbsp;码&nbsp;</span>
						<input name="new_pwd" type="text" class="form-control" placeholder="New Password" aria-describedby="basic-addon1"></div>
					<div class="input-group mt10">
						<span class="input-group-addon">确认密码&nbsp;</span>
						<input name="re_pwd" type="text" class="form-control" placeholder="Repeat Password" aria-describedby="basic-addon1"></div>
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