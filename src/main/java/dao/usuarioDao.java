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
            String sql = "select idCliente, idRol, username, apellidos, nombres, dni, password from Usuarios";

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
            String sql = "select idCliente, idRol, username, apellidos, nombres, dni, password "
                    + " from usuarios where idCliente=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, cod);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                u = new usuario();
                u.setCodu(rs.getString(1));
                u.setRol(rs.getString(2));
                u.setUsername(rs.getString(3));
                u.setApellidos(rs.getString(4));
                u.setNombres(rs.getString(5));
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
            st.setString(4, a.getApellidos());
            st.setString(5, a.getNombres());
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

    
}
