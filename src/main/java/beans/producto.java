package beans;

public class producto {
    private String idproducto;
    private String idCategoria;
    private String nompro;
    private int stock;
    private double precio;
    private String img;

    public producto() {
    }

    public producto(String idproducto, String idCategoria, String nompro, int stock, double precio, String img) {
        this.idproducto = idproducto;
        this.idCategoria = idCategoria;
        this.nompro = nompro;
        this.stock = stock;
        this.precio = precio;
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(String idproducto) {
        this.idproducto = idproducto;
    }

    public String getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(String idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNompro() {
        return nompro;
    }

    public void setNompro(String nompro) {
        this.nompro = nompro;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    
    
}
