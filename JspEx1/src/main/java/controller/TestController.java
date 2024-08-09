package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TestDao;
import model.User;

@WebServlet("/qqq")
public class TestController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
//    	request.setAttribute("name", "홍길동");
    	TestDao dao=new TestDao();
    	String name=dao.userName();
    	request.setAttribute("name",name);
        request.getRequestDispatcher("/0809/zzz.jsp").forward(request, response);
    }
}
