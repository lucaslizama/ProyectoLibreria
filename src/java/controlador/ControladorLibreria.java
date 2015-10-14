package controlador;

import conexion.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;
import java.util.List;
import javax.swing.JOptionPane;
import modelo.Libro;

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

    private void configurarConexion() {
        conexion = new Conexion();
        conexion.setNombreBaseDeDatos("jdbc:mysql://localhost/libreria");
        conexion.setNombreTabla("libro");
        conexion.setCadenaConexion("com.mysql.jdbc.Driver");
        conexion.setUsuario("root");
        conexion.setPass("");
    }

    public Libro buscarLibro(int isbn) {
        Libro libro = new Libro();
        configurarConexion();

        conexion.setCadenaSQL("SELECT * FROM "
                + conexion.getNombreTabla()
                + " WHERE isbn=" + isbn + ";");
        conexion.setEsSelect(true);
        conexion.conectar();

        try {
            ResultSet resultados = conexion.getDbResultSet();
            if (resultados.next()) {
                libro = crearLibro(resultados);
            } else {
                libro = crearLibro(null);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error SQL: " + ex.getMessage());
        }
        conexion.cerrar();
        return libro;
    }

    public List<Libro> buscarLibros() {
        List<Libro> libros = new ArrayList<>();
        configurarConexion();
        conexion.setCadenaSQL("SELECT * FROM libro;");
        conexion.setEsSelect(true);
        conexion.conectar();

        try {
            ResultSet resultados = conexion.getDbResultSet();
            while (resultados.next()) {
                libros.add(crearLibro(resultados));
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Error SQL: " + ex.getMessage());
        }
        conexion.cerrar();
        return libros;
    }
    
    public void ingresarLibro(Libro libro) throws Exception{
        if(!existeLibro(libro.getIsbn())){
            configurarConexion();
            conexion.setEsSelect(false);
            conexion.setCadenaSQL("INSERT INTO libro "
                    + "VALUES(" + libro.getIsbn() + ","
                    + "'" + libro.getTitulo() + "',"
                    + "'" + libro.getAutor() + "',"
                    + "'" + new java.sql.Date(libro.getFechaPublicacion().getTime()) + "',"
                    + "'" + libro.getEditorial() + "',"
                    + libro.getEdicion() + ","
                    + "'" + libro.getDescripcion() + "');");
            conexion.conectar();
            conexion.cerrar();
        }else{
            throw new Exception("Ya existe un libro con el isbn que intento ingresar");
        }
    }

    private Libro crearLibro(ResultSet resultado) throws SQLException {
        Libro libro = new Libro();

        if (resultado != null) {
            libro.setIsbn(resultado.getInt("isbn"));
            libro.setAutor(resultado.getString("autor"));
            libro.setTitulo(resultado.getString("titulo"));
            libro.setFechaPublicacion(resultado.getDate("fecha_publicacion"));
            libro.setEditorial(resultado.getString("editorial"));
            libro.setEdicion(resultado.getInt("edicion"));
        } else {
            libro.setIsbn(-1);
            libro.setAutor("");
            libro.setTitulo("");
            Calendar aux = Calendar.getInstance();
            aux.set(1900, 1, 1);
            libro.setFechaPublicacion(new Date(aux.getTimeInMillis()));
            libro.setEditorial("");
            libro.setEdicion(-1);
        }

        return libro;
    }
    
    public boolean existeLibro(int isbn){
        List<Libro> libros = buscarLibros();
        for(Libro l : libros){
            if(l.getIsbn() == isbn)
                return true;
        }
        return false;
    }

    /*
    public static void main(String[] args) {
        ControladorLibreria controlador = new ControladorLibreria();
        Date fecha = new Date(Calendar.getInstance().getTimeInMillis());
        Libro nuevo = new Libro(3, "ASDFG", "Lucas", fecha, "DGASDF", 1, "ASDSFDFASDASDASDASD");
        
        try{
            controlador.ingresarLibro(nuevo);
        }catch(Exception ex){
            JOptionPane.showMessageDialog(null, ex.getMessage());
        }
        
        Libro l = controlador.buscarLibro(2);
        System.out.println(l.getFechaPublicacion());
    }
    */
}
