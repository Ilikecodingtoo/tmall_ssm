<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<script>
    $(function(){
        <c:if test="${!empty msg}">
            $("span.errorMessage").html("${msg}");
            $("div.loginErrorMessageDiv").show();
        </c:if>

        $("form.loginForm").submit(function(){
            if (0 == $("#userName").val().length || 0 == $("#userPassword").val().length){
                $("span.errorMessage").html("用户名或密码不能为空");
                $("div.loginErrorMessageDiv").show();
                return false;
            }
            return true;
        });

        $("form.loginForm input").keyup(function(){
            $("div.loginErrorMessageDiv").hide();
        });

        var left = window.innerWidth / 2 + 162;
        $("div.loginSmallDiv").css("left", left);
    })
</script>

<div id="loginDiv" style="position: relative">
    <div class="simpleLogo">
        <a href="${contextPath}"><img src=""></a>
    </div>

    <!-- Back Ground Image -->
    <img id = "loginBackgroundImg" class="loginBackgroundImg" src="img/site/loginBackground.png" style="height: 700px" width="1500px">

    <!--Login Form-->
    <form class="loginForm" action="foreLogin" method="post">
        <div id ="loginSmallDiv" class="loginSmallDiv">
            <!--Error Message-->
            <div class="loginErrorMessageDiv">
                <div class="alert alert-danger"
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                    <span class="errorMessage"></span>
                </div>
            </div>

            <!-- Account Number -->
            <div class="login_account_text">用户登录</div>
            <div class="loginInput ">
                <span class="loginInputIcon" >
                    <span class="glyphicon glyphicon-user"></span>
                </span>
                <input id="userName" name="name" placeholder="您之前注册的账号" type="text">
            </div>

            <!-- Password -->

            <div class="loginInput ">
                <span class="loginInputIcon ">
                    <span class="glyphicon glyphicon-lock"></span>
                </span>
                <input id="userPassword"  name="password" placeholder="请输入您的密码" type="password">
            </div>
            <span class="text-danger"></span><br><br>

            <div>
                <a class="notImplementLink" href="#nowhere">忘记密码</a>
                <a href="registerPage" class="pull-right">没有账号，点击注册</a>
            </div>
            <div style="margin-top:20px">
                <button class="btn btn-block redButton" type="submit">登录</button>
            </div>
        </div>
    </form>
</div>