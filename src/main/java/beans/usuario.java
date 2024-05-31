
package beans;

public class usuario {
    private String codu;
    private String username;
    private String nombres;
    private String apellidos;
    private int dni;
    private String password;
    private String rol;

    public usuario() {
    }

    public usuario(String codu, String username, String nombres, String apellidos, int dni, String password, String rol) {
        this.codu = codu;
        this.username = username;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.dni = dni;
        this.password = password;
        this.rol = rol;
    }
    
    public String getCodu() {
        return codu;
    }

    public void setCodu(String codu) {
        this.codu = codu;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
}
