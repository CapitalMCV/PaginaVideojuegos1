package controlador;

import dao.usuarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class controlCliente extends HttpServlet {

    usuarioDao obj = new usuarioDao();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op = Integer.parseInt(request.getParameter("opc"));
        if (op == 1) {
            
        }
        if (op == 2) {
            
        } 
        if (op == 3) {
            
        } 
        if (op == 4) {
            getUsu(request, response);
        } 
        if (op == 5) {
            adiAlu(request, response);
        } 
        if (op == 6) {
            ediUsu(request, response);
        }
        if (op == 7) {
            ediUsu(request, response);
        }
        
    }
    
    //listado total
    protected void getUsu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("dato", obj.getUsuAdmin());
        request.setAttribute("titulo", "Adicion de usuarios");
        request.setAttribute("nro", 5);//para grabar
        request.setAttribute("usu", new usuario());
        String pag = "/pagUsuarioCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    //grabar
    protected void adiAlu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        usuario a = new usuario();

        a.setUsername(request.getParameter("user"));
        a.setApellidos(request.getParameter("ape"));
        a.setNombres(request.getParameter("nombre"));
        a.setDni(Integer.parseInt(request.getParameter("dni")));
        a.setRol(request.getParameter("rol"));
        a.setPassword(request.getParameter("pass"));

        obj.adiUsuAdmin(a);

        request.setAttribute("dato", obj.getUsuAdmin());
        request.setAttribute("titulo", "Adicion de usuarios");
        request.setAttribute("nro", 5);//para grabar
        request.setAttribute("usu", new usuario());
        String pag = "/pagUsuarioCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);

    }
    
    
    //editar alumno
    protected void ediUsu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("cod");

        request.setAttribute("dato", obj.getUsuAdmin());
        request.setAttribute("titulo", "Actualizar datos");
        request.setAttribute("nro", 5);//para grabar
        request.setAttribute("usu", obj.busUsuario(cod));
        String pag = "/pagUsuarioCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    //eliminar alumno
    protected void eliUsu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("cod");

        request.setAttribute("dato", obj.getUsuAdmin());
        request.setAttribute("titulo", "Actualizar datos");
        request.setAttribute("nro", 5);//para grabar
        request.setAttribute("usu", obj.busUsuario(cod));
        String pag = "/pagUsuarioCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
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

}