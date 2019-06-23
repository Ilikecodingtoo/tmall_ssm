<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<script>
$(function(){
    <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.registerErrorMessageDiv").css("visibility", "visible");
    </c:if>
    $(".registerForm").submit(function(){
        if (0 == $("#userName").val().length){
            $("span.errorMessage").html("User Name cannot be empty");
            $("div.registerErrorMessageDiv").css("visibility", "visible");
            return false;
        }
        if (0 == $("#userPassword").val().length){
             $("span.errorMessage").html("Password cannot be empty");
             $("div.registerErrorMessageDiv").css("visibility", "visible");
             return false;
        }
        if (0 == $("#repeatPassword").val().length){
             $("span.errorMessage").html("Repeate Password cannot be empty");
             $("div.registerErrorMessageDiv").css("visibility", "visible");
             return false;
        }
        if ($("#userPassword").val() != $("#repeatPassword").val()){
             console.log($("#userPassword").val());
             console.log($("#repeatPassword").val());
             $("span.errorMessage").html("Passwords do not match");
             $("div.registerErrorMessageDiv").css("visibility", "visible");
             return false;
        }
        return true;
    });
})
</script>

<form action="foreRegister" method="post" class="registerForm">

    <div class="registerDiv">
        <div class="registerErrorMessageDiv">
            <div class="alert alert-danger" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                <span class="errorMessage"></span>
            </div>
        </div>
        <table class="registerTable" align="center">
            <tr>
                <td class="registerTip registerTableLeftTD">下面请输入您的账号</td>
            </tr>
            <tr>
                <td class="registerTableLeftTD">账号</td>
                <td class="registerTableRightTD"><input id="userName" name="name"
                        placeholder="仔细填写，错了将不能更改哦"></td>
            </tr>
            <tr>
                <td  class="registerTip registerTableLeftTD">设置密码</td>
                <td  class="registerTableRightTD">平台会保证用户个人隐私</td>
            </tr>
            <tr>
                <td class="registerTableLeftTD">您的密码</td>
                <td class="registerTableRightTD"><input id="userPassword" name="password" type="password"  placeholder="您的密码"> </td>
            </tr>
            <tr>
                <td class="registerTableLeftTD">再次确认密码
                </td>
                <td class="registerTableRightTD"><input id="repeatPassword" type="password"   placeholder="" > </td>
            </tr>
            <tr>
                <td colspan="2" class="registerButtonTD">
                    <a href="registerSuccess.jsp"><button>注册</button></a>
                </td>
            </tr>
        </table>
    </div>
</form>