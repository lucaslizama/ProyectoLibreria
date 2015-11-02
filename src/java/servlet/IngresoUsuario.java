/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author lucas
 */
@WebServlet(name = "IngresoUsuario", urlPatterns = {"/IngresoUsuario"})
public class IngresoUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(false);
            Usuario actual = (Usuario) session.getAttribute("usuarioActual");
            if (actual.isAdministrador()) {
                String nombre = request.getParameter("nombre");
                String segundoNombre = request.getParameter("segundoNombre");
                String apellidoPaterno = request.getParameter("apellidoPaterno");
                String apellidoMaterno = request.getParameter("apellidoMaterno");
                String fechaNacimiento = request.getParameter("fechaNacimiento");
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                Usuario nuevo = new Usuario(username);
                nuevo.setPrimerNombre(nombre);
                nuevo.setSegundoNombre(segundoNombre);
                nuevo.setApellidoPaterno(apellidoPaterno);
                nuevo.setApellidoMaterno(apellidoMaterno);
                Calendar cal = Calendar.getInstance();
                cal.set(Integer.parseInt(fechaNacimiento.substring(0, 4)), Integer.parseInt(fechaNacimiento.substring(5, 7)), Integer.parseInt(fechaNacimiento.substring(8)));
                nuevo.setFechaNacimiento(new Date(cal.getTimeInMillis()));
                nuevo.setPassword(password);
                nuevo.setAdministrador(false);

                if (nuevo.existeUsuario()) {
                    response.sendRedirect("ingresarUsuario.jsp?error=existeUsuario");
                } else {
                    if (nuevo.crear()) {
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Servlet Logout</title>");
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<h1>Usuario creado exitsamente!</h1>");
                        out.println("<a href='perfil.jsp'><p>Volver a perfil Administrador</p></a>");
                        out.println("</body>");
                        out.println("</html>");
                    } else {
                        response.sendRedirect("ingresarUsuario.jsp?error=crearUsuario");
                    }
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
