package com.shop.controller.custom;

import com.shop.dto.member;
import com.shop.model.MemberDAO;
import com.shop.util.AES256;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MyInfoUpdatePro.do")
public class MyInfoUpdateProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");

        boolean result = false;
        int suc = 0;

        String key = "%02x";
        String encrypted = "";
        try {
            encrypted = AES256.encryptAES256(pw, key);
            System.out.println("비밀번호 암호화 : "+encrypted);
        } catch (Exception e) {
            e.printStackTrace();
        }

        MemberDAO dao = new MemberDAO();
        member user = new member();

        user.setId(id);
        user.setPw(encrypted);
        user.setTel(tel);
        user.setEmail(email);
        suc = dao.updateCustom(user);

        if(suc>0){
            response.sendRedirect(request.getContextPath()+"Mypage.do?id="+id);
        } else {
            response.sendRedirect("/MyInfoUpdate.do?id="+id);
        }
    }
}
