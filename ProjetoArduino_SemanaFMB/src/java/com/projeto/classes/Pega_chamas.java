package com.projeto.classes;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.projeto.beam.Chamas;
public class Pega_chamas {
    public ArrayList<Chamas> Pega_dados(){
        try{
            String Driver="com.mysql.jdbc.Driver";
            String url="jdbc:mysql://localhost:3306/arduino?useTimezone=true&serverTimezone=UTC";
            Class.forName(Driver);
            Connection con = DriverManager.getConnection(url,"boirod","Elmatader0");
            String query="SELECT * FROM arduino.chamas order by idChamas desc limit 10;";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            ArrayList<Chamas> lista=new ArrayList();
            while(rs.next()){
                Chamas dado=new Chamas();
                dado.setIdChamas(rs.getInt("idChamas"));
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
