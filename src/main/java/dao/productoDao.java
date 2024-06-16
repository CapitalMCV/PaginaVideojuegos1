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
    public producto busProducto(String cod) {
        producto p = null;
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "SELECT idProducto, idCategoria, nombre_produc, stock, precio, Imagen FROM productos WHERE idProducto=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, cod);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                p = new producto();
                p.setIdproducto(rs.getString(1));
                p.setIdCategoria(rs.getString(2));
                p.setNompro(rs.getString(3));
                p.setStock(rs.getInt(4));
                p.setPrecio(rs.getDouble(5));
                p.setImg(rs.getString(6));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return p;
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
            st.setString(5, b.getImg());
            st.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //MODIFICAR
    public void cambiaProd(producto a) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call spModiProd(?,?,?,?,?,?)}";
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
    public void delProd(String id) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "{call spDelProd(?)}";
            CallableStatement st = cn.prepareCall(sql);
            st.setString(1, id);
            st.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
