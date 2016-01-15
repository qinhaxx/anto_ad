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
		      		<li class="ml10" data-toggle="modal" data-target=".bs-example-modal-lg2">
		      			<a>
		      				新增任务
		      			</a>
		      		</li>
		      		<!--/任务添加-->	
			        <!--站点选择-->
			        <li class="dropdown" id="site_select" style="margin-left:20px;">
			          <a class="dropdown-toggle"  data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span id="site_select_txt" >全部站点</span><span class="caret"></span></a>
			          <ul class="dropdown-menu">
			            <li><a>全部站点</a></li>
			            <li><a>YAHOO GTX</a></li>
			            <li><a>RAKUTEN IGTX</a></li>
			            <li role="separator" class="divider"></li>
			            <li  data-toggle="modal" data-target=".bs-example-modal-lg" style="margin-left:20px;">站点管理</li>
			          </ul>
			        </li>
			        <!--/站点选择-->			        
		      	</ul>	     
				<ul class="nav navbar-nav navbar-right">
					<!--检索-->		   		
			        <li class="ml10 " style="margin-top:7px;width:170px;">
						<div class="input-group">
							<input type="text" readonly class="form-control datepicker" placeholder="点击选择日期">
							<span class="input-group-btn">
								<button class="btn btn-default" type="button">检 索</button>
							</span>
					    </div>
			        </li>
			        <!--/检索-->	 
					<li><a>欢迎你：{$u_name}</a></li>
					<li style="border-left:1px solid #eee;border-right:1px solid #eee;" class="hover_bg"><a href="/show.php?logout">退出</a></li>
				</ul>
		    </div><!-- /.navbar-collapse -->
		</nav>
	</div><!-- /.container-fluid -->
</div>
<!--站点管理弹框-->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      &nbsp;
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      <div>站点管理</div>
      <div style="height:500px;overflow-y:auto;">
		<div class="input-group mt10" style="width:300px">
			<input type="text"  class="form-control" placeholder="添加站点" >
			<span class="input-group-btn">
				<button class="btn btn-default" type="button">添 加</button>
			</span>
		</div>      	
		<table class="table" style="margin-top:30px;">
  			<tr>
  				<td>店名</td><td>操作</td>
  			</tr>
  			<tr>
  				<td>yahoo gtx</td><td class="">删除</td>
  			</tr>
  			<tr>
  				<td>yahoo gtx</td><td class="">删除</td>
  			</tr>
  			<tr>
  				<td>yahoo gtx</td><td class="">删除</td>
  			</tr>
  			<tr>
  				<td>yahoo gtx</td><td class="">删除</td>
  			</tr>
  			<tr>
  				<td>yahoo gtx</td><td class="">删除</td>
  			</tr>
  			<tr>
  				<td>yahoo gtx</td><td class="">删除</td>
  			</tr>
  			<tr>
  				<td>yahoo gtx</td><td class="">删除</td>
  			</tr>
  			<tr>
  				<td>yahoo gtx</td><td class="">删除</td>
  			</tr>
  			<tr>
  				<td>yahoo gtx</td><td class="">删除</td>
  			</tr>
  			<tr>
  				<td>yahoo gtx</td><td class="">删除</td>
  			</tr>
  			<tr>
  				<td>yahoo gtx</td><td class="">删除</td>
  			</tr>
  			<tr>
  				<td>yahoo gtx</td><td class="">删除</td>
  			</tr>
		</table>
      </div>
    </div>
  </div>
</div>
<!--/站点管理弹框-->
<!--添加任务弹框-->
<div class="modal fade bs-example-modal-lg2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      &nbsp;
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
      <div>任务添加</div>
      <div style="height:500px;overflow-y:auto;overflow-x:hidden;">
			<form class="form-horizontal">
			  <div class="form-group mt10">
			    <label for="site_name" class="col-sm-2 control-label col-sm-offset-1">站点名称</label>
			    <div class="col-sm-10 new_project_txt">
			      <input type="email" class="form-control" id="site_name" >
			    </div>
			  </div>
			  <div class="form-group mt10">
			    <label for="xxx" class="col-sm-2 control-label col-sm-offset-1">xxx</label>
			    <div class="col-sm-10 new_project_txt">
			      <input type="email" class="form-control" id="xxx" >
			    </div>
			  </div>
			  <div class="form-group mt10">
			    <label for="xxx" class="col-sm-2 control-label col-sm-offset-1">xxx</label>
			    <div class="col-sm-10 new_project_txt">
			      <input type="email" class="form-control" id="xxx" >
			    </div>
			  </div>
			  <div class="form-group mt10">
			    <label for="xxx" class="col-sm-2 control-label col-sm-offset-1">xxx</label>
			    <div class="col-sm-10 new_project_txt">
			      <input type="email" class="form-control" id="xxx" >
			    </div>
			  </div>
			  <div class="form-group mt10">
			    <label for="xxx" class="col-sm-2 control-label col-sm-offset-1">备 注</label>
			    <div class="col-sm-10 new_project_txt">
			      <textarea class="form-control" rows="3"></textarea>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <div class="col-sm-offset-1 col-sm-10">
			      <button type="submit" class="btn btn-default">确定</button>
			    </div>
			  </div>
			</form>
      </div>
    </div>
  </div>
</div>
<!--/添加任务弹框-->




</body>
</html>
