package com.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface DBConnect {
    final static String NOTICE_SELECT_ALL = "select * from notice order by nno desc";
    final static String NOTICE_SELECT_ONE = "select * from notice where nno=?";
    final static String NOTICE_INSERT = "insert into notice values (title, content);";
    final static String NOTICE_SELECT_RANGE = "select * from notice order by nno desc limit 5 offset ?";
    final static String NOTICE_UPDATE = "update notice set title=?, content=? where nno=?";
    final static String NOTICE_DELETE = "delete from notice where nno=?";
    final static String NOTICE_COUNT = "select count(*) as cnt from notice";
    final static String NOTICE_COUNT_TITLE = "select count(*) as cnt from notice where title like ?";
    final static String NOTICE_COUNT_CONTENT = "select count(*) as cnt from notice where content like ?";
    final static String NOTICE_COUNT_ALL = "select count(*) as cnt from notice where title like ? or content like ?";
    final static String NOTICE_SELECT_TITLE_RANGE = "select * from notice where title like ? order by resdate desc limit 5 offset ?";
    final static String NOTICE_SELECT_CONTENT_RANGE = "select * from notice where content like ? order by resdate desc limit 5 offset ?";
    final static String NOTICE_SELECT_ALL_RANGE = "select * from notice where title like ? or content like ? order by resdate desc limit 5 offset ?";
    
    //카테고리별 목록
    final static String PRODUCT_SELECT_CATE = "select * from product where cate_id=? order by pro_no";

    //신상품
    final static String PRODUCT_SELECT_NEW = "select * from product order by pro_no desc limit 5";

    //베스트 상품
    final static String PRODUCT_SELECT_BEST = "select * from product where pro_no in (select pro_no from payment group by pro_no order by sum(amount) desc limit 5)";

    //상품 입고
    final static String PRODUCT_INSERT = "insert into product values(default, ?, '', ?, ?, ?, ?, ?, ?, default)";
    final static String CATEGORY_LOAD = "select * from category";

    //상품번호+상품카테고리 pro_cate_no
    final static String PRODUCT_INSERT_UPDATE = "update product set pro_cate_no = concat(cate_id,'-',pro_no) where pro_no in (select pro_no from product order by regdate desc limit 1)";

    //상품 추가 정보
    final static String PRODUCT_INFO = "insert into addinfo values(default, ?, ?, ?, default)";

    //상품 수정
    final static String PRODUCT_UPDATE = "update product set price=?, title=?, description=?, pro_content=?, thumb=?, img_src=? where pro_no=?";

    //상품 삭제
    final static String PRODUCT_DELETE = "delete from product where pro_no=?";

    //재고 조회
    final static String INVENTORY_SELECT_ALL = "select * from inventory order by pro_no desc";
    final static String INVENTORY_SELECT_ONE = "select * from inventory where pro_no=?";

    // 결제 테이블 sql문
    final static String PAYMENT_SELECT_ONE = "select * from payment where pay_no=?";
    final static String PAYMENT_SELECT_LIST = "select * from payment where cus_id=? and resdate between ? and ?";
    final static String GET_PAY_NO = "select pay_no from payment order by pay_no desc limit 1";
    final static String PAYMENT_SELECT_CID ="select * from payment where custom_id=?";
    
    //출고 관리 sql문
    final static String SERVE_PAYMENT =  "insert into payment values (default, ?, ?, ?, ?, ?, ?, ?, '')";
    final static String SERVE_INSERT = "insert into serve values(default, ?, ?, ?, default)";

    // 반품 처리 sql문
    final static String SELECT_MY_ORDER_LIST = "select pay.pay_no, resdate, thumb, description, title, amount, pay_price, del_state from payment pay, delivery del, product pro where pay.pay_no = del.pay_no and pro.pro_no=pay.pro_no and cus_id=? order by resdate desc";
    final static String RETURN_PAYMENT = "delete from payment where pay_no=?";
    final static String RETURN_PAYMENTS = "delete from payment where cus_id=? and resdate between ? and ?";
    final static String RETURN_RECEIVE = "insert into receive values (default, ?, ?, ?, default)";
    final static String RETURN_SERVE = "delete from serve where se_no=?";
    final static String RETURN_SERVES = "delete from serve where se_no in (select pay_no from payment where resdate between ? and ? and cus_id=?)";
    final static String RETURN_CART = "insert into cart values (default, ?, ?, ?)";
    final static String RETURN_DELIVERY = "delete from delivery where pay_no=?";
    final static String RETURN_DELIVERIES = "delete from delivery where pay_no in (select pay_no from payment where resdate between ? and ? and cus_id=?)";

    //회원 관리 sql문
    final static String Member_SELECT_ONE = "select * from member where id=?";
    final static String Member_UPDATE = "update member set pw=?, address=?,tel=?, email=?, birth=? where id=?";

    //상품 관리 sql문
    final static String PRODUCT_SELECT_ALL = "select * from product order by pro_no";
    final static String PRODUCT_SELECT_ONE = "select * from product where pro_no=?";

    //배송 관리 sql문
    final static String DELIVERY_INSERT = "insert into delivery values (default, ?, ?, ?, ?, '','',default,default,'','')";
    final static String DELIVERY_SELECT_PAYNO = "select * from delivery where pay_no=?";

    //장바구니 관리 sql문
    final static String CART_DELETE = "delete from cart where cart_no=?";
    final static String CART_SELECT_CID = "select * from cart where cid=?";

    //리뷰 관리 sql문
    final static String REVIEW_SELECT_CID ="select * from review where mem_id=?";
    final static String REVIEW_DELETE = "delete from review where rev_no=?";

    public Connection connect();
    public void close(PreparedStatement pstmt, Connection conn);
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn);

}