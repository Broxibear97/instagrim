/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.util.ArrayList;
import javax.servlet.FilterConfig;
import javax.servlet.http.HttpServletResponse;
import uk.ac.dundee.computing.aec.instagrim.filters.ProtectPages;

/**
 *
 * @author joshuahogarth
 */
public class Profiler {
    Cluster cluster;
    FilterConfig fc;
    
    public Profiler()
    {
    }
    
    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }
    
    public boolean UpdateDetails(String user, String fname, String lname)
    {
        try
        {
            Session session = cluster.connect("instagrim");
            String query = "UPDATE userprofiles SET first_name = ?, last_name = ? where login = ?";
            PreparedStatement prep = session.prepare(query);
            BoundStatement bsprep = new BoundStatement(prep);
            session.execute(bsprep.bind(fname, lname, user));
            session.close();

        }
        catch(Exception ex)
        {
            System.out.println("Error --> " + ex);
            return false;
        }
        
        return true;
    }
    
    
    
    public ArrayList<String> RetrieveDetails(String User)
    {
        ArrayList<String> details = new ArrayList<>();

        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select login, first_name, last_name, email from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        User));
        session.close();
        if (rs.isExhausted() || rs == null) {
            System.out.println("No details");
            return null;
        } else {
            for (Row row : rs) {        
                details.add(row.getString("login"));
                
                if(row.getString("first_name") != null)
                    details.add(row.getString("first_name"));
                else
                    details.add("N/A");
                
                if(row.getString("last_name") != null)
                    details.add(row.getString("last_name"));
                else
                    details.add("N/A");
                
                /*if(row.getString("email") != null)
                    details.add(row.getString("email"));
                else
                    details.add("N/A"); */
            }
        }
        
        return details;
    }
    
}
