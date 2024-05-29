package controlador;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.productoDao;
import beans.producto;

public class adminProducto extends HttpServlet {
    productoDao obj = new productoDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int opc = Integer.parseInt(request.getParameter("opc"));
        if (opc == 1) listProd(request, response);
    }

    protected void listProd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<producto> listaProductos = obj.listProd();
        request.setAttribute("listaProductos", listaProductos);
        String pag = "/product.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
