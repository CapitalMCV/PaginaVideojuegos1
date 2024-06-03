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
        switch (op) {
            case 1:
                autenticar(request, response);
                break;
            case 2:
                registrar(request, response);
                break;
            case 4:
                getProd(request, response);
                break;
            case 5:
                adiProd(request, response);
                break;
            case 6:
                ediUsu(request, response);
                break;
            case 7:
                ediUsu(request, response);
                break;
            default:
                throw new ServletException("Invalid operation code");
        }
    }

    //listado total
    protected void getProd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("dato", obj.getProd());
        request.setAttribute("titulo", "Adicion de productos");
        request.setAttribute("nro", 5);//para grabar
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
            b.setIdproducto(request.getParameter("idproducto"));
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

    //editar alumno
    protected void ediUsu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("cod");

        request.setAttribute("dato", obj.getProd());
        request.setAttribute("titulo", "Actualizar datos");
        request.setAttribute("nro", 6);//para grabar
        request.setAttribute("usu", obj.busProducto(cod));
        String pag = "/pagUsuarioCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    //eliminar alumno
    protected void eliUsu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("cod");

        request.setAttribute("dato", obj.getProd());
        request.setAttribute("titulo", "Actualizar datos");
        request.setAttribute("nro", 5);//para grabar
        request.setAttribute("usu", obj.busProducto(cod));
        String pag = "/pagUsuarioCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    protected void autenticar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        productoDao usuarioDao = new productoDao();

        if (usuarioDao.autenticar(username, password)) {
            String rol = usuarioDao.obtenerRol(username);

            if (rol.equals("R01")) {
                response.sendRedirect("perfilAdmin.jsp");
            } else if (rol.equals("R02")) {
                response.sendRedirect("pagPrincipal.jsp");
            }
        } else {
            response.sendRedirect("LoginPrincipal.jsp?error=true");
        }
    }

    protected void registrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        usuario a = new usuario();

        a.setUsername(request.getParameter("user"));
        a.setApellidos(request.getParameter("ape"));
        a.setNombres(request.getParameter("nom"));
        a.setDni(Integer.parseInt(request.getParameter("dni")));
        a.setPassword(request.getParameter("pass"));

        obj.registrar(a);

        String pag = "/registroCuenta.jsp";
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
