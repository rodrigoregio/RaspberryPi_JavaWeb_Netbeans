/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projeto.classes;

import com.projeto.beam.LDR;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * URL de conexão com o mysql
 * jdbc:mysql://localhost:3306/homesys?useTimezone=true&serverTimezone=UTC [root em Esquema default]
 * @author Rodrigo
 */
public class Pega_ldr {
    public ArrayList<LDR> Pega_dados(){
        try{
            String Driver="com.mysql.jdbc.Driver";
            String url="jdbc:mysql://localhost:3306/arduino?useTimezone=true&serverTimezone=UTC";
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(url,"boirod","Elmatader0");
            String query="SELECT * FROM arduino.luminosidade order by idluminosidade desc limit 10;";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            ArrayList<LDR> lista=new ArrayList();
            while(rs.next()){
                LDR dado=new LDR();
                dado.setIdLuminosidade(rs.getInt("idluminosidade"));
                dado.setValor(rs.getInt("valor"));
                dado.setEstado(rs.getString("estado"));
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
