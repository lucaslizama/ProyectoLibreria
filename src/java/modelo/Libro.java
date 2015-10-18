package modelo;

import java.sql.Date;

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
    public Libro() {
    }

    public Libro(int isbn) {
        this.isbn = isbn;
    }

    public Libro(int isbn, String titulo, String autor, Date fechaPublicacion,
            String editorial, int edicion, String descripcion) {
        this.isbn = isbn;
        this.titulo = titulo;
        this.autor = autor;
        this.fechaPublicacion = fechaPublicacion;
        this.editorial = editorial;
        this.edicion = edicion;
        this.descripcion = descripcion;
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
    @Override
    public String toString() {
        return titulo;
    }
//</editor-fold>
}
