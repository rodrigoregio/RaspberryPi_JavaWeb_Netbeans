package com.projeto.classes;

import com.projeto.beam.Agua;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Pega_aguas {
    public ArrayList<Agua> Pega_dados(){
        try{
            String Driver="com.mysql.jdbc.Driver";
            String url="jdbc:mysql://localhost:3306/arduino?useTimezone=true&serverTimezone=UTC";
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(url,"boirod","Elmatader0");
            String query="SELECT * FROM arduino.agua order by idAgua desc limit 10;";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            ArrayList<Agua> lista=new ArrayList();
            while(rs.next()){
                Agua dado=new Agua();
                dado.setIdAgua(rs.getInt("idAgua"));
                dado.setStatus(rs.getString("status"));
                dado.setData_hora(rs.getString("data_hora"));
                lista.add(dado);
                //System.out.println(add);
            }
            return lista;
        }catch(SQLException | ClassNotFoundException e){
            return null;
        }
    }
}