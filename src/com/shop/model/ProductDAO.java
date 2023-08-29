package com.shop.model;

import com.shop.dto.AddInfo;
import com.shop.dto.Category;
import com.shop.dto.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    String sql = "";

    //상품 목록
    public List<Product> getProductList(){
        List<Product> proList = new ArrayList<>();
        DBConnect con = new PostgreCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_SELECT_ALL);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Product pro = new Product();
                pro.setPro_no(rs.getInt("pro_no"));
                pro.setCate_id(rs.getString("cate_id"));
                pro.setPro_cate_no(rs.getString("pro_cate_no"));
                pro.setPrice(rs.getInt("price"));
                pro.setTitle(rs.getString("title"));
                pro.setDescription(rs.getString("description"));
                pro.setPro_content(rs.getString("pro_content"));
                pro.setThumb(rs.getString("thumb"));
                pro.setImg_src(rs.getString("img_src"));
                pro.setRegdate(rs.getString("regdate"));
                proList.add(pro);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return proList;
    }
    //카테고리
    public List<Product> getCateProductList(String cate){
        List<Product> proList = new ArrayList<>();
        DBConnect con = new PostgreCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_SELECT_CATE);
            pstmt.setString(1, cate);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Product pro = new Product();
                pro.setPro_no(rs.getInt("pro_no"));
                pro.setCate_id(rs.getString("cate_id"));
                pro.setPro_cate_no(rs.getString("pro_cate_no"));
                pro.setPrice(rs.getInt("price"));
                pro.setTitle(rs.getString("title"));
                pro.setDescription(rs.getString("description"));
                pro.setPro_content(rs.getString("pro_content"));
                pro.setThumb(rs.getString("thumb"));
                pro.setImg_src(rs.getString("img_src"));
                pro.setRegdate(rs.getString("regdate"));
                proList.add(pro);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return proList;
    }

    public Product getProduct(int pro_no){
        Product pro = new Product();
        DBConnect con = new PostgreCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_SELECT_ONE);
            pstmt.setInt(1, pro_no);
            rs = pstmt.executeQuery();
            if(rs.next()){
                pro.setPro_no(rs.getInt("pro_no"));
                pro.setPro_cate_no(rs.getString("pro_cate_no"));
                pro.setCate_id(rs.getString("cate_id"));
                pro.setPrice(rs.getInt("price"));
                pro.setTitle(rs.getString("title"));
                pro.setDescription(rs.getString("description"));
                pro.setPro_content(rs.getString("pro_content"));
                pro.setThumb(rs.getString("thumb"));
                pro.setImg_src(rs.getString("img_src"));
                pro.setRegdate(rs.getString("resdate"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return pro;
    }

    //상품 추가정보
    public int addInfo(AddInfo info){
        int cnt =0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_INFO);
            pstmt.setInt(1, info.getPro_no());
            pstmt.setString(2, info.getTitle());
            pstmt.setString(3, info.getMovie());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    //상품 등록
    public int addProduct(Product add){
        int cnt = 0;
        DBConnect con = new PostgreCon();

        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_INSERT);
            pstmt.setString(1,add.getCate_id());
            pstmt.setInt(2, add.getPrice());
            pstmt.setString(3, add.getTitle());
            pstmt.setString(4, add.getDescription());
            pstmt.setString(5, add.getPro_content());
            pstmt.setString(6, add.getThumb());
            pstmt.setString(7, add.getImg_src());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }



    public List<Category> getCategoryList(){
        List<Category> cateList = new ArrayList<Category>();
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.CATEGORY_LOAD);
            rs = pstmt.executeQuery();
            while(rs.next()){
                Category cate = new Category();
                cate.setCate_no(rs.getInt("cate_no"));
                cate.setCate_name(rs.getString("cate_name"));
                cateList.add(cate);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cateList;
    }

    //상품 정보 수정
    public int updateProduct(Product pro){
        int cnt =0;
        DBConnect con = new PostgreCon();
        conn = con.connect();

        try {
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_UPDATE);
            pstmt.setInt(1, pro.getPrice());
            pstmt.setString(2, pro.getTitle());
            pstmt.setString(3, pro.getDescription());
            pstmt.setString(4, pro.getPro_content());
            pstmt.setString(5, pro.getThumb());
            pstmt.setString(6, pro.getImg_src());
            pstmt.setInt(7, pro.getPro_no());
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    //상품 삭제
    public int delProduct(int pro_no){
        int cnt =0;
        DBConnect con = new PostgreCon();
        conn = con.connect();
        try {
            pstmt = conn.prepareStatement(DBConnect.PRODUCT_DELETE);
            pstmt.setInt(1, pro_no);
            cnt = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(pstmt, conn);
        }
        return cnt;
    }

    //재고
    public int getAmount(int pro_no){
        int amount = 0;
        DBConnect con = new PostgreCon();
        try {
            conn = con.connect();
            pstmt = conn.prepareStatement(DBConnect.INVENTORY_SELECT_ONE);
            pstmt.setInt(1, pro_no);
            rs = pstmt.executeQuery();
            if(rs.next()){
                amount = rs.getInt("amount");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            con.close(rs, pstmt, conn);
        }
        return amount;
    }
}
