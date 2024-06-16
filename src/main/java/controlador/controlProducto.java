package controlador;

import dao.productoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;

public class controlProducto extends HttpServlet {

    productoDao obj = new productoDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op = Integer.parseInt(request.getParameter("opc"));
        if (op == 3) {
            añadirproducto(request, response);
        }
        if (op == 4) {
            getProd(request, response);
        }
        if (op == 5) {
            adiProd(request, response);
        }
        if (op == 6) {
            ediProd(request, response);
        }
        if (op == 7) {
            eliProd(request, response);
        }
    }

    //listado total
    protected void getProd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("dato", obj.getProd());
        request.setAttribute("titulo", "Adicion de productos");
        request.setAttribute("nro", 3);//para grabar
        request.setAttribute("prod", new producto());
        String pag = "/pagProductoCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    //grabar
    protected void adiProd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        producto b = new producto();
        int sw = 0;
        if (request.getParameter("codu") != null) {
            sw = 1;
            b.setIdproducto(request.getParameter("codu"));
        }
        
        b.setIdCategoria(request.getParameter("codcat"));
        b.setNompro(request.getParameter("nompro"));
        b.setStock(Integer.parseInt(request.getParameter("stock")));
        b.setPrecio(Double.parseDouble(request.getParameter("precio")));

        if (sw == 0) {
            obj.adiProd(b);
        } else {
            obj.cambiaProd(b);
        }

        request.setAttribute("dato", obj.getProd());
        request.setAttribute("titulo", "Adicion de productos");
        request.setAttribute("nro", 5);//para grabar
        request.setAttribute("prod", new producto());
        String pag = "/pagProductoCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    
    //grabar o actualizar
    protected void añadirproducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        producto b = new producto();
        
        b.setIdCategoria(request.getParameter("codcat"));
        b.setNompro(request.getParameter("nompro"));
        b.setStock(Integer.parseInt(request.getParameter("stock")));
        b.setPrecio(Double.parseDouble(request.getParameter("precio")));
        b.setImg(request.getParameter("img"));

            obj.adiProd(b);
        
        request.setAttribute("dato", obj.getProd());
        request.setAttribute("titulo", "Adicion de usuarios");
        request.setAttribute("nro", 3);//para grabar
        request.setAttribute("prod", new producto());
        String pag = "/pagProductoCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);

    }

    //editar alumno
    protected void ediProd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("cod");

        request.setAttribute("dato", obj.getProd());
        request.setAttribute("titulo", "Actualizar datos");
        request.setAttribute("nro", 5);//para grabar
        request.setAttribute("prod", obj.busProducto(cod));
        String pag = "/pagProductoCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    //eliminar alumno
    protected void eliProd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("cod");
        
        obj.delProd(cod);
        request.setAttribute("dato", obj.getProd());
        request.setAttribute("titulo", "Borrar datos");
        request.setAttribute("nro", 5);//para grabar
        request.setAttribute("prod", obj.busProducto(cod));
        String pag = "/pagProductoCrud.jsp";
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
