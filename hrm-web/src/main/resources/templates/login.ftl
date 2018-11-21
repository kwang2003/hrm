<!DOCTYPE html>
<html>
<head>
  <title>AdminLTE 2 | 登录</title>
  <#include "/include/header_js_and_css.ftl">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="../../index.html"><b>Admin</b>LTE</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">用户名密码登录</p>

    <form action="/login" method="post">
    <#if RequestParameters.error??>
    	<div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                       用户名或密码错误
              </div>
     </#if>
     <#if RequestParameters.logout??>
    	<div class="alert alert-warning alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                       您已经退出登录
              </div>
     </#if>
      <div class="form-group has-feedback">
        <input class="form-control" placeholder="用户名/邮箱/手机号" name="username">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="密码" name="password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox"> 下次自动登录
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> 用Facebook帐号登录</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> 用Google+帐号登录</a>
    </div>
    <!-- /.social-auth-links -->

    <a href="#">忘记密码?</a><br>
    <a href="register.html" class="text-center">立即注册</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<#include "/include/footer_js.ftl">
<!-- iCheck -->
<script src="../../plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
</body>
</html>
