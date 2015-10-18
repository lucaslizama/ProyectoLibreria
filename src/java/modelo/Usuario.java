package modelo;

import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import controlador.ControladorLibreria;

public class Usuario {

    private String username;
    private String password;
    private String primerNombre;
    private String segundoNombre;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private Date fechaNacimiento;
    private boolean administrador;

    //<editor-fold defaultstate="collapsed" desc="Accesadores y Mutadores">
    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the primerNombre
     */
    public String getPrimerNombre() {
        return primerNombre;
    }

    /**
     * @param primerNombre the primerNombre to set
     */
    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }

    /**
     * @return the segundoNombre
     */
    public String getSegundoNombre() {
        return segundoNombre;
    }

    /**
     * @param segundoNombre the segundoNombre to set
     */
    public void setSegundoNombre(String segundoNombre) {
        this.segundoNombre = segundoNombre;
    }

    /**
     * @return the apellidoPaterno
     */
    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    /**
     * @param apellidoPaterno the apellidoPaterno to set
     */
    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    /**
     * @return the apellidoMaterno
     */
    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    /**
     * @param apellidoMaterno the apellidoMaterno to set
     */
    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }

    /**
     * @return the fechaNacimiento
     */
    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    /**
     * @param fechaNacimiento the fechaNacimiento to set
     */
    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    
    /**
     * @return the administrador
     */
    public boolean isAdministrador() {
        return administrador;
    }
    
    /**
     * @param administrador the administrador to set
     */
    public void setAdministrador(boolean administrador) {
        this.administrador = administrador;
    }
//</editor-fold>

    public Usuario() {
        this.username = "";
    }

    public Usuario(String username) {
        this.username = username;
    }

    public final boolean leer() {
        ControladorLibreria controlador = new ControladorLibreria();
        controlador.configurarConexion("usuario", true);
        controlador.getConexion().setCadenaSQL("SELECT * from usuario;");
        controlador.getConexion().conectar();
        ResultSet resultados = controlador.getConexion().getDbResultSet();

        try {
            while (resultados.next()) {
                if (resultados.getString("username").equals(this.username)) {
                    password = resultados.getString("password");
                    primerNombre = resultados.getString("primer_nombre");
                    segundoNombre = resultados.getString("segundo_nombre");
                    apellidoPaterno = resultados.getString("apellido_paterno");
                    apellidoMaterno = resultados.getString("apellido_materno");
                    fechaNacimiento = resultados.getDate("fecha_nacimiento");
                    administrador = resultados.getBoolean("administrador");
                    controlador.getConexion().cerrar();
                    return true;
                } else {
                    controlador.getConexion().cerrar();
                    return false;
                }
            }
        } catch (Exception ex) {
            controlador.getConexion().cerrar();
            System.out.println("Error SQL: " + ex.getMessage());
        }
        controlador.getConexion().cerrar();
        return false;
    }

    public boolean crear() {
        if (!existeUsuario()) {
            ControladorLibreria controlador = new ControladorLibreria();
            controlador.configurarConexion("usuario", false);
            controlador.getConexion().setCadenaSQL(
                    "INSERT INTO usuario VALUES('" + username + "','" + password +
                    "','" + primerNombre + "','" + segundoNombre + 
                    "','" + apellidoPaterno + "','" + apellidoMaterno +
                    "','" + fechaNacimiento + "'," + 0 + ");");
            controlador.getConexion().conectar();
            controlador.getConexion().cerrar();
            return true;
        } else {
            return false;
        }
    }

    public boolean actualizar() {
        return false;
    }

    public boolean eliminar() {
        return false;
    }

    public List<Usuario> buscarUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        ControladorLibreria controlador = new ControladorLibreria();
        controlador.configurarConexion("usuario", true);
        controlador.getConexion().setCadenaSQL("SELECT * from usuario;");
        controlador.getConexion().conectar();
        ResultSet resultados = controlador.getConexion().getDbResultSet();

        try {
            while (resultados.next()) {
                Usuario user = new Usuario(resultados.getString("username"));
                if (user.leer()) {
                    usuarios.add(user);
                }
            }
        } catch (Exception ex) {
            System.out.println("Error SQL: " + ex.getMessage());
        }
        controlador.getConexion().cerrar();
        return usuarios;
    }

    public boolean existeUsuario() {
        List<Usuario> usuarios = buscarUsuarios();
        for (Usuario user : usuarios) {
            if (user.getUsername().equals(username)) {
                return true;
            }
        }
        return false;
    }
}
