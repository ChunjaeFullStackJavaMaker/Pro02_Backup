package com.shop.model;

import com.shop.dto.Cart;
import com.shop.dto.Delivery;
import com.shop.dto.Payment;
import com.shop.dto.Serve;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MultiPattern {
    static DBConnect con = new PostgreCon();
     Connection conn = null;
     PreparedStatement pstmt = null;
     ResultSet rs = null;

    public MultiPattern(){

    }
    public int pay(Payment payment, Serve serve, Delivery delivery, Cart cart){
        int pay_no=0;
        conn = con.connect();
        String sql = "";

        try{
            conn.setAutoCommit(false);
            int cnt =0;

            //결제 처리
            sql = "insert into payment values (default, ?, ?, ?, ?, ?, ?, ?, '')";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, payment.getCus_id());
            pstmt.setInt(2, payment.getPro_no());
            pstmt.setInt(3, payment.getAmount());
            pstmt.setString(4, payment.getPay_method());
            pstmt.setString(5, payment.getPay_com());
            pstmt.setString(6, payment.getCus_num());
            pstmt.setInt(7, payment.getPay_price());
            cnt += pstmt.executeUpdate();

            //출고 처리
            sql = "insert into serve values(default, ?, ?, ?, default)";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, payment.getPro_no());
            pstmt.setInt(2, payment.getAmount());
            pstmt.setInt(3, payment.getPay_price());
            cnt += pstmt.executeUpdate();


            //출고 처리후 번호 반환
            sql = "select pay_no from payment order by pay_no desc limit 1";
            pstmt=conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()){
                pay_no = rs.getInt("pay_no");
            }

            //배송 처리
            sql ="insert into delivery values (default, ?, ?, ?, ?, '','',default,default,'','')";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, delivery.getPay_no());
            pstmt.setString(2, delivery.getCustom_id());
            pstmt.setString(3, delivery.getDel_addr());
            pstmt.setString(4, delivery.getCus_tel());
            cnt += pstmt.executeUpdate();

            //카트 삭제 처리
            sql = "delete from cart where cart_no=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, cart.getCart_no());
            cnt += pstmt.executeUpdate();

            conn.commit();
            conn.setAutoCommit(true);

            } catch (SQLException e) {
                try{
                    conn.rollback();
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
        throw new RuntimeException(e);
        }
        return pay_no;
    }
}
