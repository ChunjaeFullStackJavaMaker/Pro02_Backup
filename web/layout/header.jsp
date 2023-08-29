<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="<%=request.getContextPath() %>" />
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                <div class="col-lg-12 col-md-12">
                    <div class="header__top__right">
                        <div class="header__top__right__auth">
                            <c:if test="${sid eq null}">
                                <a href="/Login.do"><i class="fa fa-user"></i> Login</a>
                                <a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i> Join </a>
                            </c:if>
                            <c:if test="${sid ne null and sid ne 'admin'}">
                                <a href="#"><i class="fa fa-user"></i> Logout </a>
                                <a href="${path}/mypageInfo.do"><i class="fa fa-sign-in" aria-hidden="true"></i> MyPage </a>
                            </c:if>
                            <c:if test="${sid eq 'admin'}">
                                <a href="#"><i class="fa fa-user"></i> Logout </a>
                                <a href="#"><i class="fa fa-sign-in" aria-hidden="true"></i> Admin Page </a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="${path}/"><img src="${path}/img/logo/corn_book_85-55.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li><a href="${path}/ProList.do?cate=Q&R&S"> 유아 </a>
                            <ul class="header__menu__dropdown">
                                <li><a href="${path}/ProList.do?cate=Q">유아 콘텐츠</a></li>
                                <li><a href="${path}/ProList.do?cate=R">유아 놀이</a></li>
                                <li><a href="${path}/ProList.do?cate=S">유아 기타</a></li>
                            </ul>
                        </li>
                        <li><a href="${path}/ProList.do?cate=A&B&C&D"> 초등 </a>
                            <ul class="header__menu__dropdown">
                                <li><a href="${path}/ProList.do?cate=A">초등 교과서</a></li>
                                <li><a href="${path}/ProList.do?cate=B">초등 참고서</a></li>
                                <li><a href="${path}/ProList.do?cate=C">초등 문제집</a></li>
                                <li><a href="${path}/ProList.do?cate=D">초등 기타</a></li>
                            </ul>
                        </li>
                        <li><a href="${path}/ProList.do?cate=E&F&G&H"> 중등 </a>
                            <ul class="header__menu__dropdown">
                                <li><a href="${path}/ProList.do?cate=E">중등 교과서</a></li>
                                <li><a href="${path}/ProList.do?cate=F">중등 참고서</a></li>
                                <li><a href="${path}/ProList.do?cate=G">중등 문제집</a></li>
                                <li><a href="${path}/ProList.do?cate=H">중등 기타</a></li>
                            </ul>
                        </li>
                        <li><a href="${path}/ProList.do?cate=I&J&K&L"> 고등 </a>
                            <ul class="header__menu__dropdown">
                                <li><a href="${path}/ProList.do?cate=I">고등 교과서</a></li>
                                <li><a href="${path}/ProList.do?cate=J">고등 참고서</a></li>
                                <li><a href="${path}/ProList.do?cate=K">고등 문제집</a></li>
                                <li><a href="${path}/ProList.do?cate=L">고등 기타</a></li>
                            </ul>
                        </li>
                        <li><a href="#"> 고객지원 </a>
                            <ul class="header__menu__dropdown">
                                <li><a href="${path}/product/getProduct.jsp"> 공지사항 </a></li>
                                <li><a href=""> QnA </a></li>
                                <li><a href=""> FAQ </a></li>
                                <li><a href=""> 1:1 상담 </a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                        <li><a href="${path}/cartList.do"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                    </ul>
                    <div class="header__cart__price">item: <span>$150.00</span></div>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
