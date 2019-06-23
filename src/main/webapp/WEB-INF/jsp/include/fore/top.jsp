<%@ page language="java" contentType="text/html; charset=utf-8"
        pageEncoding="utf-8" isELIgnored="false"%>
<nav class="top" >
    <a href="${base_url}/home">
        <span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-home redColor"></span>
        首页
    </a>

    <span>欢迎来到淘米优购商城！</span>
    <c:if test="${!empty user}">
        <a href="#" >${user.name}</a>
        <a href="${base_url}/foreLogout">注销</a>
    </c:if>
    <c:if test="${empty user}">
        <a href="${base_url}/loginPage">登录</a>
        <a href="${base_url}/registerPage">注册</a>
    </c:if>
    <span class="pull-right">
        <a href="${base_url}/foreBought">我的订单</a>
        <a href="${base_url}/foreCart"> <span style="color:#C40000;margin:0px" class="glyphicon glyphicon-shopping-cart redColor">
                            </span>Cart <strong id = "cartNum">${cartTotalItemNumber}</strong> 购物车</a>
    </span>
</nav>