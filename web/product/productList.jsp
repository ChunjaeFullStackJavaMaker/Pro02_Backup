<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>상품 목록</title>


    <%@ include file="/setting/head.jsp"%>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<%@include file="/layout/header_top.jsp"%>
<!-- Humberger End -->

<!-- Header Section Begin -->
<%@include file="/layout/header.jsp"%>
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
                            <input type="text" placeholder="What do yo u need?">
                            <button type="submit" class="site-btn">SEARCH</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" style="background-image: url("${path}/img/breadcrumb.jpg")>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Organi Shop</h2>
                    <div class="breadcrumb__option">
                        <a href="${path}">Home</a>
                        <span>상품 목록</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar">
                    <div class="sidebar__item">
                        <h4>Department</h4>
                        <ul>
                            <c:if test="${param.cate eq 'Q&R&S' || param.cate eq 'Q' || param.cate eq 'R' || param.cate eq 'S'}">
                                <li><a href="${path}/ProList.do?cate=Q">유아 콘텐츠</a></li>
                                <li><a href="${path}/ProList.do?cate=R">유아 놀이</a></li>
                                <li><a href="${path}/ProList.do?cate=S">유아 기타</a></li>
                            </c:if>
                            <c:if test="${param.cate eq 'A&B&C&D' || param.cate eq 'A' || param.cate eq 'B' || param.cate eq 'C' || param.cate eq 'D'}">
                                <li><a href="${path}/ProList.do?cate=A">초등 교과서</a></li>
                                <li><a href="${path}/ProList.do?cate=B">초등 참고서</a></li>
                                <li><a href="${path}/ProList.do?cate=C">초등 문제집</a></li>
                                <li><a href="${path}/ProList.do?cate=D">초등 기타</a></li>
                            </c:if>
                            <c:if test="${param.cate eq 'E&F&G&H' || param.cate eq 'E' || param.cate eq 'F' || param.cate eq 'G' || param.cate eq 'H'}">
                                <li><a href="${path}/ProList.do?cate=E">중등 교과서</a></li>
                                <li><a href="${path}/ProList.do?cate=F">중등 참고서</a></li>
                                <li><a href="${path}/ProList.do?cate=G">중등 문제집</a></li>
                                <li><a href="${path}/ProList.do?cate=H">중등 기타</a></li>
                            </c:if>
                            <c:if test="${param.cate eq 'I&J&K&L' || param.cate eq 'I' || param.cate eq 'J' || param.cate eq 'K' || param.cate eq 'L'}">
                                <li><a href="${path}/ProList.do?cate=I">고등 교과서</a></li>
                                <li><a href="${path}/ProList.do?cate=J">고등 참고서</a></li>
                                <li><a href="${path}/ProList.do?cate=K">고등 문제집</a></li>
                                <li><a href="${path}/ProList.do?cate=L">고등 기타</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="row">
                    <!--유아 전체 상품 출력-->
                    <c:if test="${param.cate eq 'Q&R&S'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('Q') and pro.cate_id.contains('R') and pro.cate_id.contains('S')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--유아 콘텐츠 상품 출력-->
                    <c:if test="${param.cate eq 'Q'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('Q')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--유아 놀이 상품 출력-->
                    <c:if test="${param.cate eq 'R'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('R')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--유아 기타 상품 출력-->
                    <c:if test="${param.cate eq 'S'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('S')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--초등 전체 상품-->
                    <c:if test="${param.cate eq 'A&B&C&D'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('A') and pro.cate_id.contains('B') and pro.cate_id.contains('C') and pro.cate_id.contains('D')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--초등 교과서 상품-->
                    <c:if test="${param.cate eq 'A'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('A')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--초등 참고서 상품-->
                    <c:if test="${param.cate eq 'B'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('B')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--초등 문제집 상품-->
                    <c:if test="${param.cate eq 'C'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('C')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--초등 기타 상품-->
                    <c:if test="${param.cate eq 'D'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('D')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--중등 전체 상품 출력-->
                    <c:if test="${param.cate eq 'E&F&G&H'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('E') and pro.cate_id.contains('F') and pro.cate_id.contains('G') and pro.cate_id.contains('H')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--중등 교과서 상품 출력-->
                    <c:if test="${param.cate eq 'E'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('E')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--중등 참고서 상품 출력-->
                    <c:if test="${param.cate eq 'F'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('F')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--중등 문제집 상품 출력-->
                    <c:if test="${param.cate eq 'G'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('G')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--중등 기타 상품 출력-->
                    <c:if test="${param.cate eq 'H'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('H')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--고등 전체 상품 출력-->
                    <c:if test="${param.cate eq 'I&J&K&L'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('I') and pro.cate_id.contains('J') and pro.cate_id.contains('K') and pro.cate_id.contains('L')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--고등 교과서 상품 출력-->
                    <c:if test="${param.cate eq 'I'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('I')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--고등 참고서 상품 출력-->
                    <c:if test="${param.cate eq 'J'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('J')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--고등 문제집 상품 출력-->
                    <c:if test="${param.cate eq 'K'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('K')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>

                    <!--고등 기타 상품 출력-->
                    <c:if test="${param.cate eq 'L'}">
                        <c:forEach var="pro" items="${proList}">
                            <c:if test="${pro.cate_id ne null and pro.cate_id.contains('L')}">
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                    <div class="product__item">
                                        <div class="product__item__pic set-bg" data-setbg="${path }/storage/${pro.img_src}">
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="${path}/getProduct.do?pro_no=${pro.pro_no }">${pro.title}</a></h6>
                                            <h5>${pro.price}</h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${empty proList}">
                            <li class="col-12">해당 상품이 존재하지 않습니다.</li>
                        </c:if>
                    </c:if>
                </div>
                <div class="product__pagination">
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->

<!-- Footer Section Begin -->
<%@include file="/layout/footer.jsp"%>
<!-- Footer Section End -->

</body>

</html>