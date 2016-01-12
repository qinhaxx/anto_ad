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
	$(".datepicker").datetimepicker({format:'yyyy-mm-dd',weekStart:1,todayBtn:1,autoclose:1,startView:2,forceParse:0,showMeridian:1,minView:2,language:'zh-CN'});
});
</script>
{/literal}
</head>

<body>
<div class="container-fluid">
  	<div class="row">
	    <nav class="navbar navbar-default">
			<div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
			      	<a class="navbar-brand" href="#">ANTO-广告排期系统</a>
			    </div>
			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      	<ul class="nav navbar-nav">
			        	<li class="active"><a href="#">即将到期<span class="sr-only">(current)</span></a></li>
					    <li class="dropdown">
				          	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
				               站点
				               <b class="caret"></b>
				            </a>
				            <ul class="dropdown-menu">
								<li><a href="#">YAHOO GTX</a></li>
								<li><a href="#">EJB</a></li>
								<li><a href="#">Jasper Report</a></li>         
				            </ul>
				        </li>
				        <li style="margin-top:7px;width:170px;">
							<div class="input-group">
								<input type="text" readonly class="form-control datepicker" placeholder="点击选择日期">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">检 索</button>
								</span>
						    </div>
				        </li>
			      	</ul>
			      
					<ul class="nav navbar-nav navbar-right">
						<li><a>欢迎你：{$u_name}</a></li>
						<li style="border-left:1px solid #eee;border-right:1px solid #eee;" class="hover_bg"><a href="/show.php?logout">退出</a></li>
					</ul>
			    </div><!-- /.navbar-collapse -->
		  	</div><!-- /.container-fluid -->
		</nav>
  	</div>
</div>
</body>
</html>
