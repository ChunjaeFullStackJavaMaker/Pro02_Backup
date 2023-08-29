<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<%@include file="../setting/head.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>제품 등록하기</title>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<%@include file="../layout/header_top.jsp"%>
<!-- Humberger End -->

<!-- Header Section Begin -->
<%@include file="../layout/header.jsp"%>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>All departments</span>
                    </div>
                    <ul>
                        <li><a href="${path}/ProList.do?cate=child">유아</a></li>
                        <li><a href="${path}/ProList.do?cate=elementary">초등</a></li>
                        <li><a href="${path}/ProList.do?cate=middle">중등</a></li>
                        <li><a href="${path}/ProList.do?cate=high">고등</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <div class="hero__search__categories">
                                All Categories
                                <span class="arrow_carrot-down"></span>
                            </div>
                            <input type="text" placeholder="어떤 책이 필요하신가요?">
                            <button type="submit" class="site-btn">검색</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="${path}/img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>상품 등록</h2>
                    <div class="breadcrumb__option">
                        <a href="${path}/">Home</a>
                        <a href="${path}/">상품 등록</a>
                        <span>상품 등록</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<section>
    <div class="container">
        <form action="${path }/AddProductPro.do" method="post" enctype="multipart/form-data">
            <table class="table">
                <tbody>
                <tr>
                    <th><label for="cate_id">상품 카테고리</label></th>
                    <td><input type="text" name="cate_id" id="cate_id" class="form-control"></td>
                </tr>
                <tr>
                    <th><label for="title">상품명</label></th>
                    <td><input type="text" name="title" id="title" class="form-control"></td>
                </tr>
                <tr>
                    <th><label for="price">가격</label></th>
                    <td><input type="text" name="price" id="price" class="form-control"></td>
                </tr>
                <tr>
                    <th><label for="description">요약 설명</label></th>
                    <td><textarea name="content" id="description" class="form-control"></textarea></td>
                </tr>
                <tr>
                    <th><label for="pro_content">상세 설명</label></th>
                    <td><textarea name="content" id="pro_content" class="form-control"></textarea></td>
                </tr>
                <tr>
                    <th><label for="thumb">썸네일 이미지 첨부 파일</label></th>
                    <td><input type="file" name="thumb" id="thumb" class="form-control"></td>
                </tr>
                <tr>
                    <th><label for="img_src">상세 이미지 첨부 파일</label></th>
                    <td><input type="file" name="img_src" id="img_src" class="form-control"></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="등록" class="btn btn-primary"></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</section>

<!-- Footer Section Begin -->
<%@ include file="../layout/footer.jsp"%>
<!-- Footer Section End -->

</body>

</html>