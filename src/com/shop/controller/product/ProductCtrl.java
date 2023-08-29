package com.shop.controller.product;

import com.shop.dto.Product;
import com.shop.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/getProduct.do")
public class ProductCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setAttribute("msg","상품리스트를 출력합니다.");

    int pro_no = Integer.parseInt(request.getParameter("pro_no"));

    ProductDAO dao = new ProductDAO();
    Product pro = dao.getProduct(pro_no);
    int amount = dao.getAmount(pro_no);

    request.setAttribute("pro_no",pro_no);
    request.setAttribute("amount",amount);
    RequestDispatcher view = request.getRequestDispatcher("/product/getProduct.jsp");
    view.forward(request,response);
    }
}
