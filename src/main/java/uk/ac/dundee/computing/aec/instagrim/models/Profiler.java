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

/**
 *
 * @author joshuahogarth
 */
public class Profiler {
    Cluster cluster;
    
    public Profiler()
    {
    }
    
    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }
    
    public ArrayList<String> RetrieveDetails(String User)
    {
        ArrayList<String> details = new ArrayList<>();

        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select login from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        User));
        if (rs.isExhausted()) {
            System.out.println("No details");
            return null;
        } else {
            for (Row row : rs) {        
                java.util.UUID UUID = row.getUUID("login");
                System.out.println("UUID" + UUID.toString());
                details.add(UUID.toString());
            }
        }
        
        return details;
    }
    
}
