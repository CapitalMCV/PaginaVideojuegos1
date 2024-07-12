package controlador;

import dao.usuarioDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class controlCliente extends HttpServlet {

    usuarioDao obj = new usuarioDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int op = Integer.parseInt(request.getParameter("opc"));
        if (op == 1) {
            autenticar(request, response);
        }
        if (op == 2) {
            registrar(request, response);
        }
        if (op == 3) {
            añadirusuario(request, response);
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
            eliUsu(request, response);
        }
        if (op == 8) {
            cerrarSesion(request, response);
        }
        if (op == 9) {
            graba(request, response);
        }

    }

    //listado total de usuarios
    protected void getUsu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("dato", obj.getUsuAdmin());//enviar una variable dato con el listado total de todos los usuarios
        request.setAttribute("titulo", "Adicion de usuarios");
        request.setAttribute("nro", 3);//para grabar
        request.setAttribute("usu", new usuario());
        String pag = "/pagUsuarioCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    //grabar o actualizar
    protected void adiAlu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        usuario a = new usuario();
        int sw = 0;
        if (request.getParameter("codu") != null) {
            sw = 1;
            a.setCodu(request.getParameter("codu"));
        }
        a.setUsername(request.getParameter("user"));
        a.setApellidos(request.getParameter("ape"));
        a.setNombres(request.getParameter("nombre"));
        a.setDni(Integer.parseInt(request.getParameter("dni")));
        a.setRol(request.getParameter("rol"));
        a.setPassword(request.getParameter("pass"));

        if (sw == 0) {
            obj.adiUsuAdmin(a);
        } else {
            obj.cambiaUsu(a);
        }

        request.setAttribute("dato", obj.getUsuAdmin());
        request.setAttribute("titulo", "Adicion de usuarios");
        request.setAttribute("nro", 5);//para grabar
        request.setAttribute("usu", new usuario());
        String pag = "/pagUsuarioCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);

    }

    //grabar o actualizar
    protected void añadirusuario(HttpServletRequest request, HttpServletResponse response)
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
        request.setAttribute("nro", 3);//para grabar
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

        obj.delUsu(cod);
        request.setAttribute("dato", obj.getUsuAdmin());
        request.setAttribute("titulo", "Borrar datos");
        request.setAttribute("nro", 5);//para grabar
        request.setAttribute("usu", obj.busUsuario(cod));
        String pag = "/pagUsuarioCrud.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    protected void autenticar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("Username: " + username);
        System.out.println("Password: " + password);

        usuario u = obj.autenticar(username.trim(), password.trim());
        HttpSession ses = request.getSession();
        String pag = "";

        if (u == null) {
            request.setAttribute("mensaje", "usuario o contraseña incorrectos");
            pag = "/LoginPrincipal.jsp";
        } else {
            ses.setAttribute("usuario", u);
            ses.setAttribute("username", u.getNombres() + " " + u.getApellidos());
            String rol = obj.obtenerRol(username);
            System.out.println("Rol: " + rol);
            if (rol != null) {
                if (rol.equals("R01")) {
                    pag = "/perfilAdmin.jsp";
                } else {
                    pag = "/pagPrincipal.jsp";
                }
            } else {
                ses.setAttribute("usuario", u);
                request.setAttribute("mensaje", "Rol no encontrado");
                pag = "/LoginPrincipal.jsp";
            }
        }

        request.getRequestDispatcher(pag).forward(request, response);
    }

    protected void cerrarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        String pag = "/LoginPrincipal.jsp";
        request.getRequestDispatcher(pag).forward(request, response);

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

    protected void graba(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses = request.getSession();//crear una sesion
        List<Compra> lista = (ArrayList<Compra>) ses.getAttribute("canasta");
        usuario u = (usuario) ses.getAttribute("usuario");
        double total = (double) ses.getAttribute("total");
        //graba la factura y el detalle
        String fac = obj.grabaFactura(lista, u.getCodu());
        String cad = "Factura Nro :" + fac;
        cad += "\n Cliente " + u.getApellidos() + "," + u.getNombres();
        cad += "\n Total Compra " + total;
        ses.setAttribute("canasta", null);
        ses.setAttribute("usuario", null);
        response.sendRedirect("generaQr?texto=" + cad);

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
