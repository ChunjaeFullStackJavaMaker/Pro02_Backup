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

@WebServlet("/JoinPro.do")
public class JoinProCtrl extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String addr1 = request.getParameter("address1");
        String addr2 = request.getParameter("address2");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String birth = request.getParameter("birth");

        boolean result = false;
        int suc = 0;

        MemberDAO dao = new MemberDAO();
        boolean pass = dao.idCheck(id);

        member user = new member();
        String key = "%02x";
        String encrypted = "";
        try {
            encrypted = AES256.encryptAES256(pw, key);
            System.out.println("비밀번호 암호화 : "+encrypted);
        } catch (Exception e) {
            e.printStackTrace();
        }

        user.setId(id);
        user.setPw(encrypted);
        user.setName(name);
        user.setAddress(addr1 + "<br>" +addr2);
        user.setTel(tel);
        user.setEmail(email);
        user.setBirth(birth);
        suc = dao.addCustom(user);

        if(suc>0){
            response.sendRedirect(request.getContextPath() + "/Login.do");
        } else {
            //response.sendRedirect("/custom/join.jsp?qid="+id);
            response.sendRedirect(request.getContextPath() + "/Join.do");
        }
    }
}
