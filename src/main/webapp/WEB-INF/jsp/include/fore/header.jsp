<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="base_url" value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}" />
<html>
<head>
    <script src="${base_url}/js/jquery/2.0.0/jquery.min.js"></script>
    <link href="${base_url}/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="${base_url}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="${base_url}/css/fore/style.css" rel="stylesheet">
<script>
function formatMoney(num){
    num = num.toString().replace(/\$|\, /g, '');
    if (isNaN(num))
        num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num * 100 + 0.5000001);
    var cents = num % 100;
    num = Math.floor(num/100).toString();
    if (cents < 10)
        cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++){
        num = num.substring(0, num.length - (4 * i + 3)) + ',' + num.substring(num.length - (4 * i + 3));
    }
    return (((sign) ? '' : '-') + num + '.' + cents);
}

function checkEmpty(id, name){
    var value = $("#" + id).val();
    if (value.length == 0){
        $("#" + id)[0].focus();
        return false;
    }
    return true;
}

$(function(){
    $("a.productDetailTopReviewLink").click(function(){
        $("div.productReviewDiv").show();
        $("div.productDetailDiv").hide();
    });
    $("a.productReviewTopPartSelectedLink").click(function(){
       $("div.productReviewDiv").hide();
       $("div.productDetailDiv").show();
    });

    $("span.leaveMessageTextareaSpan").hide();

    $("img.leaveMessageImg").click(function(){
       $(this).hide();
       $("span.leaveMessageTextareaSpan").show();
       $("div.orderItemSumDiv").css("height","100px");
    });

    $("div#footer a[href$=#nowhere]").click(function(){
       alert("模仿淘米的连接，并没有跳转到实际的页面");
    });

    $("a.wangwanglink").click(function(){
       alert("模仿旺旺的图标，并不会打开旺旺");
    });
    $("a.notImplementLink").click(function(){
       alert("这个功能没做，蛤蛤~");
    });
});

</script>
</head>
<body>



