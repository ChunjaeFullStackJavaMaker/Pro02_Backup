<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>장바구니 결제</title>
    <c:set var="path" value="<%=request.getContextPath() %>" />
    <%@include file="/setting/head.jsp"%>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Humberger Begin -->
<%@ include file="/layout/header_top.jsp"%>
<!-- Humberger End -->

<!-- Header Section Begin -->
<%@include file="/layout/header.jsp"%>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<%@include file="/layout/sideMenu.jsp"%>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Checkout</h2>
                    <div class="breadcrumb__option">
                        <a href="${path }">Home</a>
                        <span>Checkout</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h6><span class="icon_tag_alt"></span> Have a coupon? <a href="#">Click here</a> to enter your code
                </h6>
            </div>
        </div>
        <div class="checkout__form">
            <h4>Billing Details</h4>
            <form action="${path }/checkoutPro.do" onsubmit="return payCheck(this)">
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <div class="checkout__input">
                            <p>받는 사람 연락처<span>*</span></p>
                            <input type="hidden" name="cid" id="cid" value="${mem.id }">
                            <input type="hidden" name="name" id="name" value="${mem.name }">
                            <input type="hidden" name="email" id="email" value="${mem.email }">
                            <input type="hidden" name="tel" id="tel" value="${mem.tel }">
                            <input type="hidden" name="addr" id="addr" value="${mem.addr }">
                            <input type="tel" name="custel" id="custel" required>
                        </div>
                        <div class="checkout__input">
                            <p>배송지 주소<span>*</span></p>
                            <input type="text" name="address1" id="address1" placeholder="기본 주소 입력" class="checkout__input__add" required /><br>
                            <input type="text" name="address2" id="address2" placeholder="상세 주소 입력" required /><br>
                            <input type="text" name="postcode" id="postcode" style="width:160px;float:left;margin-right:20px;" placeholder="우편번호" required>
                            <button type="button" id="post_btn" onclick="findAddr()" style="margin-bottom:36px;">우편번호 검색</button>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>결제수단<span>*</span></p>
                                    <select name="pay_method" id="pay_method">
                                        <option value="신용카드">신용카드</option>
                                        <option value="체크카드">체크카드</option>
                                        <option value="계좌이체">계좌이체</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>결제사<span>*</span></p>
                                    <select name="pay_com" id="pay_com">
                                        <option value="선택안함">선택안함</option>
                                    </select>
                                    <input type="hidden" name="pay_com2" id="pay_com2" value="">
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>결제 번호<span>*</span></p>
                                <input type="text" name="cus_num" id="cus_num" required>
                                <input type="hidden" name="Paymount" id="payAmount">
                                <input type="hidden" name="payCk" id="payCk" value="no">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>결제</h4>
                            <div class="checkout__order__products">Products <span>Total</span></div>
                            <ul>
                                <c:forEach var="cartVO" items="${cartList}">
                                <li>${cartVO.title } <span class="total">${cartVO.price*cartVO.amount}</span>
                                    <input type="hidden" name="title" id="proName" value="${cartVO.title }">
                                </li>
                                </c:forEach>
                            </ul>
                            <div class="checkout__order__subtotal">Subtotal <span id="subprice"></span></div>
                            <div class="checkout__order__total">Total<span id="totalprice"></span>
                            </div>
                            <button type="submit" id="pay" class="site-btn">PLACE ORDER</button>
                        </div>
                    </div>
                </div>
            </form>
            <script>
                $(document).ready(function(){
                    var cardArr1 = ["현대카드","농협카드","BC카드","KB카드"];
                    var cardArr2 = ["하나카드","농협카드","BC카드","신한카드"];
                    var bankArr = ["카카오뱅크","농협은행","신한은행","기업은행","국민은행"];
                    $("#pay_method").change(function(){
                        var th = $(this).val();
                        if(th==="신용카드"){
                            for(var i=0;i<cardArr1.length;i++) {
                                $("#pay_com").append("<option value='" + cardArr1[i] + "'>" + cardArr1[i] + "</option>");
                            }
                        } else if(th==="체크카드"){
                            for(var i=0;i<cardArr2.length;i++) {
                                $("#pay_com").append("<option value='"+cardArr2[i]+"'>"+cardArr2[i]+"</option>");
                            }
                        } else {
                            for(var i=0;i<bankArr.length;i++) {
                                $("#pay_com").append("<option value='"+bankArr[i]+"'>"+bankArr[i]+"</option>");
                            }
                        }
                    }).change();
                    $("#pay_com").change(function(){
                        $("#pay_com2").val($(this).val());
                    });
                });
            </script>
            <script>
                //주소 연동 API
                function findAddr() {
                    new daum.Postcode({
                        oncomplete: function(data) {
                            console.log(data);
                            var roadAddr = data.roadAddress;
                            var jibunAddr = data.jibunAddress;
                            document.getElementById("postcode").value = data.zonecode;
                            if(roadAddr !== '') {
                                document.getElementById("address1").value = roadAddr;
                            } else if(jibunAddr !== ''){
                                document.getElementById("address1").value = jibunAddr;
                            }
                            document.getElementById("address2").focus();
                        }
                    }).open();
                }
            </script>
            <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
                //결제모듈 API 연동
                $(document).ready(function(){
                    var totalPay=0;
                    var proName;

                    $(".total").each(function(){
                        totalPay = totalPay + parseInt($(this).text());
                    });

                    //합계를 출력
                    $("#subprice").html("<span>"+totalPay+"</span>");
                    $("#totalprice").html("<span>"+totalPay+"</span>");

                    $("#pay").click(function(){
                        var cname = $("#name").val();
                        var email = $("#email").val();
                        var tel = $("#tel").val();
                        var addr = $("#addr").val();
                        var postcode = $("#postcode").val();
                        proName = $("#proName").val();


                        alert("결제할 금액 : "+totalPay);

                        //상품명_현재시간
                        var d = new Date();
                        var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
                        IMP.init('imp11164187'); // 결제 API를 사용하기 위한 코드 입력!
                        IMP.request_pay({	      //결제 요청
                            pg :"pgT5102001",         //상점 거래 ID
                            merchant_uid : '상품명_' + date, //
                            name : proName,				// 결제 명
                            amount : totalPay,					// 결제금액
                            buyer_email : email, // 구매자 email
                            buyer_name : cname,				// 구매자 이름
                            buyer_tel : tel,		// 구매자 전화번호
                            buyer_addr : addr,		// 구매자 주소
                            buyer_postcode : postcode			// 구매자 우편번호
                        }, function(rsp){
                            if(rsp.success){
                                console.log(rsp);
                                var msg = '결제가 완료 되었습니다.';
                                var r1 = '고유 아이디 : ' +rsp.imp_uid;
                                var r2 = '상점 거래 아이디 : ' +rsp.merchant_uid;
                                var r3 = '결제 금액 : ' +rsp.paid_amount;
                                var r4 = '카드 승인 번호 : '+rsp.apply_num;

                                //$("#payCk").val("yes");
                                //$("#payAmount").val(rsp.paid_amount);
                                //$("#pmethod").val(rsp.pay_method);
                                //$("#pcom").val(rsp.pg_provider);
                                //$("#cnum").val(rsp.apply_num);
                                //alert(msg);
                                //$("#paymentResult").html(r1+"<br>"+r2+"<br>"+r3+"<br>"+r4);
                            } else{
                                //$("#paymentResult").html('결제실패<br>'+'에러내용 : ' +rsp.error_msg);
                            }
                            //테스트용이므로 실패시에도 그냥 통과시킴
                            $("#payCk").val("yes");
                            $("#payAmount").val(totalPay);
                            $("#pay_method").val("신용카드");
                            $("#pay_com").val("삼성카드");
                            $("#cus_num").val("123-1234-1234-1278");
                            $("#paymentResult").text("결제 완료 : "+totalPay);
                        });
                    });
                });
            </script>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

<!-- Footer Section Begin -->
<%@include file="/layout/footer.jsp"%>
<!-- Footer Section End -->
</body>
</html>