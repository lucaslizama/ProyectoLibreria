package modelo;

import controlador.ControladorLibreria;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Libro {

    //<editor-fold defaultstate="collapsed" desc="Campos">

    private int isbn;
    private String titulo;
    private String autor;
    private Date fechaPublicacion;
    private String editorial;
    private int edicion;
    private String descripcion;
    private String imagen;
//</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Constructores">
    public Libro(int isbn) {
        this.isbn = isbn;
    }

    public Libro(int isbn, String titulo, String autor, Date fechaPublicacion,
            String editorial, int edicion, String descripcion, String imagen) {
        this.isbn = isbn;
        this.titulo = titulo;
        this.autor = autor;
        this.fechaPublicacion = fechaPublicacion;
        this.editorial = editorial;
        this.edicion = edicion;
        this.descripcion = descripcion;
        this.imagen = imagen;
    }
//</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Accesadores y Mutadores">
    /**
     * @return the isbn
     */
    public int getIsbn() {
        return isbn;
    }

    /**
     * @param isbn the isbn to set
     */
    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }

    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @param titulo the titulo to set
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return the autor
     */
    public String getAutor() {
        return autor;
    }

    /**
     * @param autor the autor to set
     */
    public void setAutor(String autor) {
        this.autor = autor;
    }

    /**
     * @return the fechaPublicacion
     */
    public Date getFechaPublicacion() {
        return fechaPublicacion;
    }

    /**
     * @param fechaPublicacion the fechaPublicacion to set
     */
    public void setFechaPublicacion(Date fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }

    /**
     * @return the editorial
     */
    public String getEditorial() {
        return editorial;
    }

    /**
     * @param editorial the editorial to set
     */
    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    /**
     * @return the edicion
     */
    public int getEdicion() {
        return edicion;
    }

    /**
     * @param edicion the edicion to set
     */
    public void setEdicion(int edicion) {
        this.edicion = edicion;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the imagen
     */
    public String getImagen() {
        return imagen;
    }

    /**
     * @param imagen the imagen to set
     */
    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
//</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Metodos">
    public final boolean leer() {
        ControladorLibreria controlador = new ControladorLibreria();
        controlador.configurarConexion("usuario", true);
        controlador.getConexion().setCadenaSQL("SELECT * from libro;");
        controlador.getConexion().conectar();
        ResultSet resultados = controlador.getConexion().getDbResultSet();

        try {
            while (resultados.next()) {
                if (resultados.getInt("isbn") == isbn) {
                    titulo = resultados.getString("titulo");
                    autor = resultados.getString("autor");
                    fechaPublicacion = resultados.getDate("fecha_publicacion");
                    editorial = resultados.getString("editorial");
                    edicion = resultados.getInt("edicion");
                    descripcion = resultados.getString("descripcion");
                    imagen = resultados.getString("imagen");
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
        if (!existeLibro()) {
            ControladorLibreria controlador = new ControladorLibreria();
            controlador.configurarConexion("libro", false);
            controlador.getConexion().setCadenaSQL(
                    "INSERT INTO libro VALUES(" + isbn + ",'" + titulo +
                    "','" + autor + "','" + fechaPublicacion + 
                    "','" + editorial + "'," + edicion +
                    ",'" + descripcion + "','" + imagen + "');");
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

    public List<Libro> buscarLibros() {
        List<Libro> libros = new ArrayList<>();
        ControladorLibreria controlador = new ControladorLibreria();
        controlador.configurarConexion("libro", true);
        controlador.getConexion().setCadenaSQL("SELECT * from libro;");
        controlador.getConexion().conectar();
        ResultSet resultados = controlador.getConexion().getDbResultSet();

        try {
            while (resultados.next()) {
                Libro libro = new Libro(resultados.getInt("isbn"));
                if (libro.leer()) {
                    libros.add(libro);
                }
            }
        } catch (Exception ex) {
            System.out.println("Error SQL: " + ex.getMessage());
        }
        controlador.getConexion().cerrar();
        return libros;
    }

    public boolean existeLibro() {
        List<Libro> libros = buscarLibros();
        for (Libro libro : libros) {
            if (libro.getIsbn() == isbn) {
                return true;
            }
        }
        return false;
    }
    
    public String toString() {
        return titulo;
    }
//</editor-fold>
}
