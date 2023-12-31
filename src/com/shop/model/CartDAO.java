package com.shop.model;

import com.shop.dto.CartVO;
import com.shop.dto.Member;
import com.shop.dto.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    String sql = "";

    public int delCart(int cart_no){
        int cnt = 0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.CART_DELETE);
            pstmt.setInt(1, cart_no);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    public List<CartVO> getByIdCartList(String cid){
        List<CartVO> cartList = new ArrayList<>();
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.CART_SELECT_CID);
            pstmt.setString(1, cid);
            rs = pstmt.executeQuery();
            while(rs.next()){
                CartVO cart = new CartVO();
                cart.setCart_no(rs.getInt("cart_no"));
                cart.setCus_id(rs.getString("cus_id"));
                cart.setNAME(getNAME(cart.getCus_id()));
                cart.setPro_no(rs.getInt("pro_no"));
                cart.setTitle(getTitle(cart.getPro_no()));
                cart.setPrice(getPrice(cart.getPro_no()));
                cart.setAmount(rs.getInt("amount"));
                cartList.add(cart);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cartList;
    }


    public String getNAME(String id){
        MemberDAO dao = new MemberDAO();
        Member mem = dao.getMember(id);
        return mem.getNAME();
    }

    public String getTitle(int pro_no){
        ProductDAO dao = new ProductDAO();
        Product pro = dao.getProduct(pro_no);
        return pro.getTitle();
    }

    public int getPrice(int pro_no){
        ProductDAO dao = new ProductDAO();
        Product pro = dao.getProduct(pro_no);
        return pro.getPrice();
    }
}
