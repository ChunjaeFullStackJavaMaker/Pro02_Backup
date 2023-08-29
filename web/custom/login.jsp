<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <%@ include file="/setting/head.jsp"%>
    <%@ include file="/layout/Chat.jsp"%>
    <%@include file="/setting/encoding.jsp"%>
</head>
<body>
<!-- Page Preloder -->
<%--<div id="preloder">--%>
<%--    <div class="loader"></div>--%>
<%--</div>--%>
<%--항상 따라다니는 사이드 메뉴--%>
<%@include file="/layout/AllAround_SideMenu.jsp"%>


<!-- Humberger Begin -->
<%@include file="/layout/header_top.jsp"%>
<!-- Humberger End -->

<!-- Header Section Begin -->
<%@include file="/layout/header.jsp"%>
<!-- Header Section End -->

<div class="contents" style="min-height:100vh">
    <nav aria-label="breadcrumb container-fluid" style="padding-top:28px; border-bottom:2px solid #666;">
        <div class="container">
            <ol class="breadcrumb justify-content-end">
                <li class="breadcrumb-item"><a href="${path }">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Custom</a></li>
                <li class="breadcrumb-item active" aria-current="page">Login</li>
            </ol>
        </div>
    </nav>
    <h2 class="title">로그인</h2>
    <div class="container">
        <form action="${path }/LoginPro.do" method="post">
            <table class="table">
                <tbody>
                <tr>
                    <td><input type="text" name="id" id="id" class="form-control" placeholder="아이디 입력"></td>
                </tr>
                <tr>
                    <td><input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호 입력"></td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="로그인" class="btn btn-primary">
                        <a href="" class="btn btn-secondary">회원가입</a>
                        <a href="${path }/custom/naverLogin.jsp" class="btn btn-primary">네이버 로그인</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
</body>
</html>