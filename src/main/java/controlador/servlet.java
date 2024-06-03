/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import dao.Negocio;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Patrick
 */
public class servlet extends HttpServlet {

    Negocio obj = new Negocio();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int opc = Integer.parseInt(request.getParameter("opc"));
        if (opc == 1)pagJuguetes(request, response);
        if (opc == 2)pagConsola(request, response);
        if (opc == 3)pagVideojuegos(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void pagConsola(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idcat = request.getParameter("idcat");
        request.setAttribute("procon", obj.CatPro(idcat));
        String pag = "/PagConsola.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    private void pagJuguetes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idcat = request.getParameter("idcat");
        request.setAttribute("projug", obj.CatPro(idcat));
        String pag = "/PagJueguetes.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    private void pagVideojuegos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idcat = request.getParameter("idcat");
        request.setAttribute("provid", obj.CatPro(idcat));
        String pag = "/PagVideojuegos.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

}
