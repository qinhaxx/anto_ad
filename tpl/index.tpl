<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>ANTO-广告排期系统</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/bootstrap-theme.min.css">
<link rel="stylesheet" href="./css/style.css">
<script src="./js/jquery.js"></script>
<script src="./js/bootstrap.js"></script>
{literal}
<script>
$(document).ready(function(){

	
});
function login_ok(){
	var msg = $("#login_box input").serialize();
	
	$.ajax({
        type:"POST",
        url:"index.php",
        data:msg,
        success:function(data){
          if(data=="go"){
            window.location="/show.php";
          }else{     
            $('#myModal').modal('show');
            setTimeout(function(){
            	$('#myModal').modal('hide');
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
  		<div style="line-height:50px;font-size:21px;" class="ml10">ANTO-广告排期系统</div>
    </nav>
  </div>
  <div class="row" style="margin-top:200px;" id="login_box">
	<div class="panel panel-default auto" style="width:350px;text-align:center;">
	  <div class="panel-body">
		<div class="input-group input-group auto" style="margin-top:10px;">
		  <span class="input-group-addon login_txt" >用户名</span>
		  <input name="u_name" type="text" class="form-control login_input" placeholder="Username" aria-describedby="sizing-addon1">
		</div>
		<div class="input-group input-group auto" style="margin-top:20px;">
		  <span class="input-group-addon login_txt" >密&nbsp;&nbsp;&nbsp;码</span>
		  <input name="u_pwd" type="password" class="form-control login_input" placeholder="Password" aria-describedby="sizing-addon1">
		</div>		    
	  </div>
		 <div class=" btn btn-default mt10 btn-info" style="width:100%;border-top-left-radius:0;border-top-right-radius:0;border:none;font-size:18px;" onclick="login_ok()">登&nbsp;&nbsp;&nbsp;录</div>
	</div>
  </div>
  <div class="row">
    <nav class="navbar navbar-default navbar-fixed-bottom" style="background:#eee;">
  		<div style="line-height:50px;font-size:12px;" class="mr10 pull-right">Powered by ycmbcd & pd</div>
    </nav>
  </div>
</div>

<!-- Small modal -->

<div id="myModal" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      用户名 / 密码输入错误！
    </div>
  </div>
</div>
</body>
</html>
