package controlador;

import beans.Compra;
import beans.Productos;
import beans.usuario;
import dao.Negocio;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class servlet extends HttpServlet {

    Negocio obj = new Negocio();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int opc = Integer.parseInt(request.getParameter("opc"));
        if (opc == 1) {
            pagJuguetes(request, response);
        }
        if (opc == 2) {
            pagConsola(request, response);
        }
        if (opc == 3) {
            pagVideojuegos(request, response);
        }
        if (opc == 4) {
            busProducto(request, response);
        }
        if (opc == 5) {
            detProducto(request, response);
        }
        if (opc == 6) {
            delItem(request, response);
        }
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

    protected void busProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession(false);

        if (ses == null || ses.getAttribute("username") == null) {
            // No hay sesión activa, redirigir al login
            response.sendRedirect("LoginPrincipal.jsp");
        } else {
            // Hay una sesión activa, continuar con la lógica de busProducto
            String cod = request.getParameter("cod");
            request.setAttribute("dato", obj.busProducto(cod));
            String pag = "/pagDetalle.jsp";
            request.getRequestDispatcher(pag).forward(request, response);
        }
    }

    protected void detProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();//crear una sesion
        String coda = request.getParameter("coda");
        int can = Integer.parseInt(request.getParameter("cantidad"));
        Productos ar = obj.busProducto(coda);
        Compra cp = new Compra();//el articulo encontrado pasa a compra
        cp.setIdproducto(coda);
        cp.setNompro(ar.getNompro());
        cp.setPrecio(ar.getPrecio());
        cp.setCantidad(can);
        cp.setImg(ar.getImg());
        List<Compra> lista;
        if (ses.getAttribute("canasta") == null) {
            lista = new ArrayList();
        } else {
            lista = (ArrayList<Compra>) ses.getAttribute("canasta");
        }
        //para agregar una nueva compra
        lista.add(cp);
        ses.setAttribute("canasta", lista);
        String pag = "/Carrito.jsp";
        request.getRequestDispatcher(pag).forward(request, response);

    }

    protected void delItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();//crear una sesion
        int ind = Integer.parseInt(request.getParameter("ind"));
        List<Compra> lista = (ArrayList<Compra>) ses.getAttribute("canasta");
        lista.remove(ind);
        ses.setAttribute("canasta", lista);
        String pag = "/Carrito.jsp";
        request.getRequestDispatcher(pag).forward(request, response);

    }

   
}
