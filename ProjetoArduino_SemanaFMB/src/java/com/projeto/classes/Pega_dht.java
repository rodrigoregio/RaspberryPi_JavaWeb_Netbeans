package com.projeto.classes;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.projeto.beam.DHT;
/**
 *
 * @author Rodrigo
 */
public class Pega_dht {
    public ArrayList<DHT> Pega_dados(){
        try{
            String Driver="com.mysql.jdbc.Driver";
            String url="jdbc:mysql://localhost:3306/arduino?useTimezone=true&serverTimezone=UTC";
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(url,"boirod","Elmatader0");
            String query="SELECT * FROM arduino.umidade_e_temperatura order by id desc limit 10;";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            ArrayList<DHT> lista=new ArrayList();
            while(rs.next()){
                DHT dado=new DHT();
                dado.setId(rs.getInt("id"));
                dado.setTemperatura(rs.getInt("temperatura"));
                dado.setUmidade(rs.getInt("umidade"));
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