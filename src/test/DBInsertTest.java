package test;

import com.shop.model.DBConnect;
import com.shop.model.PostgreCon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBInsertTest {

    public static void main(String[] args) throws SQLException {

        Connection conn = null;
        PreparedStatement pstmt = null;
        int cnt = 0;
        String sql;

        DBConnect con = new PostgreCon();
        conn = con.connect();
        for(int i=0; i<10; i++) {
            sql = "insert into test1 values(default, ?, default)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "내용" + i);
            cnt += pstmt.executeUpdate();
        }
        System.out.println(cnt);

    }

}
