package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import util.MySQLConexion;
import beans.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class productoDao {

    //VISTA ADMIN   
    public List<producto> getProd() {
        List<producto> lista = new ArrayList();
        Connection cn = MySQLConexion.getConexion();

        try {
            String sql = "SELECT idProducto, idCategoria, nombre_produc, stock, precio, Imagen FROM productos";

            PreparedStatement st = cn.prepareStatement(sql);
            // st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                producto p = new producto();
                p.setIdproducto(rs.getString(1));
                p.setIdCategoria(rs.getString(2));
                p.setNompro(rs.getString(3));
                p.setStock(rs.getInt(4));
                p.setPrecio(rs.getDouble(5));
                p.setImg(rs.getString(6));
                lista.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    //busqueda por codigo
    public usuario busProducto(String cod) {
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
    public void adiProd(producto b) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call spadiProd(?, ?, ?, ?, ?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, b.getIdCategoria());
            st.setString(2, b.getNompro());
            st.setInt(3, b.getStock());
            st.setDouble(4, b.getPrecio());
            st.setString(5, b.getImg()); // Asegúrate de que el campo de imagen no es null

            // Depuración: Imprimir valores antes de ejecutar
            System.out.println("Ejecutando procedimiento almacenado con los valores:");
            System.out.println("Categoria: " + b.getIdCategoria());
            System.out.println("Nombre Producto: " + b.getNompro());
            System.out.println("Stock: " + b.getStock());
            System.out.println("Precio: " + b.getPrecio());
            System.out.println("Imagen: " + b.getImg());

            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //MODIFICAR
    public void cambiaProd(producto a) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call spModiUsu(?,?,?,?,?,?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, a.getIdproducto());
            st.setString(2, a.getIdCategoria());
            st.setString(3, a.getNompro());
            st.setInt(4, a.getStock());
            st.setDouble(5, a.getPrecio());
            st.setString(6, a.getImg());
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
