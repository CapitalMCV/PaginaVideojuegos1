package dao;

import java.sql.*;
import java.util.*;
import util.MySQLConexion;
import beans.producto;

public class productoDao {
    public List<producto> listProd() {
        List<producto> lista = new ArrayList<>();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "SELECT idProducto, idCategoria, nombre_produc, stock, precio, Imagen FROM productos";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                producto p = new producto();
                p.setCodProd(rs.getString("idProducto"));
                p.setCodCat(rs.getString("idCategoria"));
                p.setNomProd(rs.getString("nombre_produc"));
                p.setStock(rs.getInt("stock"));
                p.setPrecio(rs.getDouble("precio"));
                p.setImagen(rs.getString("Imagen"));
                lista.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return lista;
    }
}