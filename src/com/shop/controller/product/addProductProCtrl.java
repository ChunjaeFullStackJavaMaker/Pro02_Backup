package com.shop.controller.product;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shop.dto.Product;
import com.shop.model.ProductDAO;

import javax.mail.Multipart;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

@WebServlet("/AddProductPro.do")
public class addProductProCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String msg = "";
        ServletContext application = request.getServletContext();
        try {
            String saveDirectory = application.getRealPath("/storage"); //실제 저장 경로
            int maxSize = 1024*1024*10;     //10MB
            String encoding = "UTF-8";

            MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());

            Product add = new Product();
            add.setCate_id(mr.getParameter("cate_id"));
            add.setTitle(mr.getParameter("title"));
            add.setPrice(Integer.parseInt(mr.getParameter("price")));
            add.setDescription(mr.getParameter("description"));
            add.setPro_content(mr.getParameter("pro_content"));

            String fileName = mr.getFilesystemName("thumb");
            String fileName2 = mr.getFilesystemName("img_src");
            if (fileName != null && fileName2 != null ){
                String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
                String ext = fileName.substring(fileName.lastIndexOf("."));
                String ext2 = fileName2.substring(fileName.lastIndexOf("."));
                String newFileName = now + ext;
                String newFileName2 = now + ext2;
                add.setThumb(newFileName);
                add.setImg_src(newFileName2);
            }

            Enumeration files = mr.getFileNames();
            while (files.hasMoreElements()) {
                String item = (String) files.nextElement();


                File upfile = mr.getFile(item); //실제 업로드
                if (upfile.exists()) {
                    msg = "파일 업로드 성공";
                } else {
                    msg = "파일 업로드 실패";
                }

                add.setThumb(upfile.getName());
                add.setImg_src(upfile.getName());
            }
            ProductDAO dao = new ProductDAO();
            int cnt = dao.addProduct(add);

            if(cnt>0){
                response.sendRedirect(request.getContextPath()+"/ProList.do");
            } else {
                response.sendRedirect(request.getContextPath()+"/AddProduct.do");
            }
        } catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
