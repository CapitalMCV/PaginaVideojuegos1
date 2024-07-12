package dao;

import beans.Compra;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import beans.Productos;
import beans.VentaAnual;
import beans.VentaCat;
import beans.Ventas;
import beans.producto;
import util.MySQLConexion;

public class Negocio {
    
    public List<Productos> lispro(String idcat){
        List<Productos> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="select nombre_produc,precio,Imagen from especialidad where idCategoria=?";
            PreparedStatement st=cn.prepareStatement(sql);
            st.setString(1, idcat);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Productos p=new Productos();
                p.setNompro(rs.getString(1));
                p.setPrecio(rs.getDouble(2));
                p.setImg(rs.getString(3));
                lista.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        return lista;
    }
    
    public List<Productos> CatPro(String cat){
        List<Productos> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="call spproductos(?)";
            CallableStatement st=cn.prepareCall(sql);
            st.setString(1, cat);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Productos p=new Productos();
                p.setNompro(rs.getString(1));
                p.setIdCategoria(rs.getString(2));
                p.setIdproducto(rs.getString(3));
                p.setImg(rs.getString(4));
                p.setNomcat(rs.getString(5));
                p.setPrecio(rs.getDouble(6));
                p.setStock(rs.getInt(7));
                lista.add(p);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return lista;
    }
    
    public List<Ventas> lisMes(int an){
        List<Ventas> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="{call spmes(?)}";
            CallableStatement st=cn.prepareCall(sql);
            st.setInt(1, an);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                Ventas v= new Ventas();
                v.setMes(rs.getInt(1));
                v.setMonto(rs.getDouble(2));
                lista.add(v);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return lista;
    }
    
    public List<VentaAnual> lisvenan(){
        List<VentaAnual> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="{call spprovenanu()}";
            CallableStatement st=cn.prepareCall(sql);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                VentaAnual v= new VentaAnual();
                v.setAno(rs.getInt(1));
                v.setCan_tot(rs.getInt(2));
                lista.add(v);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return lista;
    }
    
    public List<VentaCat> lisvencat(int cat){
        List<VentaCat> lista=new ArrayList();
        Connection cn=MySQLConexion.getConexion();
        try{
            String sql="{call spcatmasven(?)}";
            CallableStatement st=cn.prepareCall(sql);
            st.setInt(1, cat);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                VentaCat v= new VentaCat();
                v.setIdcat(rs.getString(1));
                v.setNomcat(rs.getString(2));
                v.setTotal(rs.getDouble(3));
                lista.add(v);
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return lista;
    }
    
    public Productos busProducto(String id) {
    Productos p=null;
    Connection cn=MySQLConexion.getConexion();
      try{
          String sql="select Idproducto, nombre_produc, stock, precio, imagen FROM productos WHERE idproducto=?";
          PreparedStatement st=cn.prepareStatement(sql);
          st.setString(1, id);
          ResultSet rs=st.executeQuery();
          if(rs.next()){
              p=new Productos();
              p.setIdproducto(rs.getString(1));
              p.setNompro(rs.getString(2));
              p.setStock(rs.getInt(3));
              p.setPrecio(rs.getDouble(4));
           }
      }catch(Exception ex){
          ex.printStackTrace();
      }
      return p; 

    }
}
