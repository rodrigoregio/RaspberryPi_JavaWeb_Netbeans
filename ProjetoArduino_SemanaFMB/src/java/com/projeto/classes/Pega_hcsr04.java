package com.projeto.classes;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.projeto.beam.HCSR04;
/**
 *
 * @author Rodrigo
 */
public class Pega_hcsr04 {
    public ArrayList<HCSR04> Pega_dados(){
        try{
            String Driver="com.mysql.jdbc.Driver";
            String url="jdbc:mysql://localhost:3306/arduino?useTimezone=true&serverTimezone=UTC";
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(url,"boirod","Elmatader0");
            String query="SELECT * FROM arduino.distancias order by iddistancias desc limit 10;";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            ArrayList<HCSR04> lista=new ArrayList();
            while(rs.next()){
                HCSR04 dado=new HCSR04();
                dado.setIdDistancia(rs.getInt("iddistancias"));
                dado.setValor(rs.getFloat("valor"));
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