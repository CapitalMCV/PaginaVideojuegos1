package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import util.MySQLConexion;
import beans.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class usuarioDao {

    //VISTA ADMIN   
    //listado general de alumnos
    public List<usuario> getUsuAdmin() {
        List<usuario> lista = new ArrayList();
        Connection cn = MySQLConexion.getConexion();

        try {
            String sql = "select idCliente, idRol, username, apellidos, nombres, dni, password from usuarios";

            PreparedStatement st = cn.prepareStatement(sql);
            // st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                usuario u = new usuario();
                u.setCodu(rs.getString(1));
                u.setRol(rs.getString(2));
                u.setUsername(rs.getString(3));
                u.setApellidos(rs.getString(4));
                u.setNombres(rs.getString(5));
                u.setDni(rs.getInt(6));
                u.setPassword(rs.getString(7));
                lista.add(u);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    //busqueda por codigo
    public usuario busUsuario(String cod) {
        usuario u = null;
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "select idCliente, idRol, username, nombres, apellidos, dni, password"
                    + " from usuarios where idCliente=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, cod);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                u = new usuario();
                u.setCodu(rs.getString(1));
                u.setRol(rs.getString(2));
                u.setUsername(rs.getString(3));
                u.setNombres(rs.getString(4));
                u.setApellidos(rs.getString(5));
                u.setDni(rs.getInt(6));
                u.setPassword(rs.getString(7));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return u;
    }

    //GRABAR
    public void adiUsuAdmin(usuario a) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call spadiUsu(?,?,?,?,?,?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, a.getRol());
            st.setString(2, a.getUsername());
            st.setString(3, a.getApellidos());
            st.setString(4, a.getNombres());
            st.setInt(5, a.getDni());
            st.setString(6, a.getPassword());
            st.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //MODIFICAR
    public void cambiaUsu(usuario a) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call spModiUsu(?,?,?,?,?,?,?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, a.getCodu());
            st.setString(2, a.getRol());
            st.setString(3, a.getUsername());
            st.setString(4, a.getNombres());
            st.setString(5, a.getApellidos());
            st.setInt(6, a.getDni());
            st.setString(7, a.getPassword());
            st.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //ANULAR
    public void delUsu(String id) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call spDelUsu(?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, id);
            st.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public boolean autenticar(String username, String password) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean autenticado = false;

        try {
            con = MySQLConexion.getConexion();
            String query = "SELECT * FROM Usuarios WHERE username = ? AND password = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();

            autenticado = rs.next(); // Si rs.next() es verdadero, significa que hay al menos una fila coincidente, es decir, credenciales válidas.
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return autenticado;
    }

    public String obtenerRol(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String rol = null;

        try {
            con = MySQLConexion.getConexion();
            String query = "SELECT idRol FROM Usuarios WHERE username = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                rol = rs.getString("idRol");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Cerrar recursos
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return rol;
    }

    //GRABAR nuevo usuario rol cliente
    public void registrar(usuario a) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call spadiUsuCliente(?,?,?,?,?,?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, "R02"); 
            st.setString(2, a.getUsername());
            st.setString(3, a.getApellidos());
            st.setString(4, a.getNombres());
            st.setInt(5, a.getDni());
            st.setString(6, a.getPassword());
            st.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}