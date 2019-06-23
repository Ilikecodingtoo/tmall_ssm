<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--<base href="<%=request.getContextPath()+"/"%>">--%>
    <title>Insert title here</title>
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/H-ui.login.css" rel="stylesheet" type="text/css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="js/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">


        function login() {
            //debugger
            <%--debugger--%>
            var code = $("#code").val();
            <%--// var id=$("#codeid").val();--%>
            <%--var id = "${code}";--%>
            <%--// console.log(id);--%>
            <%--console.log(code);--%>
            $.ajax({
                url:'Login',
                type:'POST',
                data:{code:code},
                dataType:'json',
                success:function(data){
                    //alert(data);
                    if(data.fasle==0){
                        alert(data.msg);
                    }
                    else{
                        document.form1.submit();
                    }   //form表单name.submit();
                }
            });




        }
    </script>
</head>
<body>

<input type="hidden" id="TenantId" name="TenantId" value=""/>
<div class="header"></div>
<div class="loginWraper">/
    <div id="loginform" class="loginBox">
        <form class="form form-horizontal" action="Login" method="POST" name="form1">

            <div class="row cl">
                <label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                <div class="formControls col-8">
                    <input id="userName" name="name" type="text" placeholder="账户" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                <div class="formControls col-8">
                    <input id="userPassword" name="password" type="password" placeholder="密码" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-8 col-offset-3">
                    <%-- <input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
                     <img src="img/VerifyCode.aspx.png"> <a id="kanbuq" href="javascript:;">看不清，换一张</a> --%>

                    验证码:<input type="text" name="code" id="code" class="input-text size-L" value=""
                               style="width: 100px" ;/>

                    <img alt="验证码出错" src="CheckCode" onclick="btn(this)">
                    <a href="#" onclick="btn2()">看不清</a><br/><span style="color: red">${msg}</span>
                    <%--<input type="hidden" value="${sessionScope.code}" id="codeid" />--%>
                </div>
            </div>
            <div class="row">
                <%--<div class="formControls col-8 col-offset-3">
                  <label for="online">
                    <input type="checkbox" name="online" id="online" value="">
                    使我保持登录状态</label>
                </div>--%>
            </div>
            <div class="row">
                <div class="formControls col-8 col-offset-3">
                    <%--<input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">--%>
                    <%--<input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">--%>
                    <input name="" type="submit"  class="btn btn-success radius size-L"
                           value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                    <input name="" type="reset" class="btn btn-default radius size-L"
                           value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="footer">Copyright 你的公司名称 by H-ui.admin.v2.3</div>
<script type="text/javascript" src="js/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>

<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>

<script type="text/javascript">
    function btn(obj) {
        // debugger
        obj.src = "CheckCode?date=" + new Date();
    }

    function btn2() {
        //通过标签名获得对应的对象（获得的是数组对象）
        var img = document.getElementsByTagName("img")[0];

        img.src = "CheckCode?date=" + new Date();


    }

</script>


</body>
</html>