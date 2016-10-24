/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.lib.Convertors;
import uk.ac.dundee.computing.aec.instagrim.models.Profiler;

/**
 *
 * @author joshuahogarth
 */
@WebServlet(name = "Profile", urlPatterns = {"/Profile", "/Profile/*", "/profile", "/profile/*"})
public class Profile extends HttpServlet {

    private Cluster cluster;
    
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
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
            
        String args[] = Convertors.SplitRequestPath(request);
        if(args.length < 3)
        {
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        request.setAttribute("user", args[2]);
        
        Profiler prof = new Profiler();
        prof.setCluster(cluster);
        ArrayList<String> details = prof.RetrieveDetails(args[2]);
        if(details != null)
            request.setAttribute("details", details);
        
        RequestDispatcher rd = request.getRequestDispatcher("/userprofile.jsp");
        rd.forward(request, response);
    }
    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session=request.getSession();
        String user = (String)session.getAttribute("lookingFor");
        if(user == null)
            user = "111111";
        String newFName = request.getParameter("FirstName");
        if(newFName == null)
            newFName = "Josh";
        
        String newLName = request.getParameter("LastName");
        if(newLName == null)
            newFName = "Hogarth";
        
        Profiler prof = new Profiler();
        prof.UpdateDetails(user, newFName, newLName);
        
        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
        
        
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
