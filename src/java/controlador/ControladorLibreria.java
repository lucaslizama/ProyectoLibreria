package controlador;

import conexion.Conexion;

public class ControladorLibreria {

    private Conexion conexion;

    //<editor-fold defaultstate="collapsed" desc="Accesadores y Mutadores">
    /**
     * @return the conexion
     */
    public Conexion getConexion() {
        return conexion;
    }

    /**
     * @param conexion the conexion to set
     */
    public void setConexion(Conexion conexion) {
        this.conexion = conexion;
    }
//</editor-fold>

    public void configurarConexion(String tabla,boolean esSelect) {
        conexion = new Conexion();
        conexion.setNombreBaseDeDatos("jdbc:mysql://localhost/libreria");
        conexion.setNombreTabla(tabla);
        conexion.setCadenaConexion("com.mysql.jdbc.Driver");
        conexion.setUsuario("root");
        conexion.setPass("");
        conexion.setEsSelect(esSelect);
    }
}
