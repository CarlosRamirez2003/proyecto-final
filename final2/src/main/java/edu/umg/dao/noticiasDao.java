package edu.umg.dao;

import com.google.gson.Gson;
import edu.umg.model.comentario;
import edu.umg.model.noticias;
import edu.umg.utils.VariablesGlobales;
import jdk.internal.dynalink.beans.StaticClass;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * <h3></h3>
 *
 * @descripción
 * @autor carlos ramirez
 **/
public class noticiasDao {

    public static int edad = 0;


    public List<noticias> getAllDB() {
        List<noticias> noticia = new ArrayList<>();

        try {
            Statement statement = VariablesGlobales.conn.createStatement();
            String sql = "select * from prueba1not";
            ResultSet rs = statement.executeQuery(sql);

            while (rs.next()) {

                noticias NoticiasNew = new noticias(
                        rs.getString("titulo"),
                        rs.getString("resumen"),
                        rs.getString("firma"),
                        rs.getString("url")
                );

                noticia.add(NoticiasNew);
            }

        } catch (SQLException e) {

            throw new RuntimeException(e);
        }

        return noticia;

    }


    public void json() {

        String json = "";
        try {
            BufferedReader andres = new BufferedReader(new FileReader("C:\\Users\\Andres\\IdeaProjects\\final2\\data.json"));
            String linea = "";

            while ((linea = andres.readLine()) != null) {
                json += linea;

            }
            andres.close();


        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        System.out.println("mostrando json ");
        System.out.println(json);

        Gson gson = new Gson();
        noticias p = gson.fromJson(json, noticias.class);


        System.out.println("mostrando objeto");


        System.out.println(p);


    }


    public List<noticias> json2() {
        if (noticiasDao.edad == 0) {

            List<noticias> noticia2 = new ArrayList<>();

            Statement statement = null;
            try {
                statement = VariablesGlobales.conn.createStatement();


            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


            JSONParser parser = new JSONParser();
            try {
                FileReader reader = new FileReader("C:\\Users\\Andres\\IdeaProjects\\final2\\data.json");
                Object obj = parser.parse(reader);
                JSONObject pJsonObj = (JSONObject) obj;
                JSONArray array = (JSONArray) pJsonObj.get("results");


                for (int i = 0; i < array.size(); i++) {

                    JSONObject PlatoFuerte = (JSONObject) array.get(i);

                    String titulo = (String) PlatoFuerte.get("title");
                    String resumen = (String) PlatoFuerte.get("abstract");
                    String firma = (String) PlatoFuerte.get("byline");
                    String url = (String) PlatoFuerte.get("url");

                    String titulo2 = titulo;
                    String resumen2 = resumen;
                    String firma2 = firma;
                    String url2 = url;


                    System.out.println("\n los Datos son");
                    System.out.println("titulo= =" + titulo);
                    System.out.println("resumen: = " + resumen);
                    System.out.println("firma: =" + firma);
                    System.out.println("url: =" + url);
                    if (titulo2 == null || resumen2 == null || firma2 == null || url2 == null) {

                        titulo2 = "vacio";
                        resumen2 = "vacio";
                        firma2 = "vacio";
                        url2 = "vacio";


                    }
                    agregarbase(titulo, resumen, firma, url);

                    noticias Noticias = new noticias(titulo, resumen, firma, url);

                    noticia2.add(Noticias);

                    System.out.println("noticiaaaaaa");

                    noticiasDao.edad = 1;


                }
            } catch (FileNotFoundException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            } catch (ParseException e) {
                throw new RuntimeException(e);


            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return noticia2;


        } else {


        }

        return null;
    }


    public void agregarbase(String titulo, String resumen, String firma, String url) throws SQLException {
        Statement st = VariablesGlobales.conn.createStatement();

        String query = "INSERT INTO prueba1not(titulo,resumen,firma,url)VALUES('" + titulo + "','" + resumen + "','" + firma + "','" + url + "')";

        st.executeUpdate(query);


    }

    public void noticia(String titulo) {
        noticias noticias = new noticias();
        ResultSet rs;

        Connection connection = VariablesGlobales.conn;
        try {
            Statement st = VariablesGlobales.conn.createStatement();
            String sql = "select * from prueba1not where titulo='" + titulo + "';";
            rs = st.executeQuery(sql);


            if (rs.next()) {
                noticias.setTitulo(rs.getString("titulo"));
                noticias.setResumen(rs.getString("resumen"));

                noticias.setFirma(rs.getString("firma"));
                noticias.setTitulo(rs.getString("url"));


            } else {
                noticias.setTitulo("");
                noticias.setResumen("");

                noticias.setFirma("");
                noticias.setTitulo("");


            }
            st.close();
            connection.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }





    public List<comentario> introduciolink(){
        List<comentario> comentario = new ArrayList<>();

        try {

    Statement statement = VariablesGlobales.conn.createStatement();
    String sql = "SELECT * from comentario";
    ResultSet rs = statement.executeQuery(sql);

    while (rs.next()) {
        comentario comentarionew = new comentario(
                rs.getString("nombre"),
                rs.getString("comentario")
        );

        comentario.add(comentarionew);
    }

} catch (Exception e) {
    throw new RuntimeException(e);
}


        return comentario;
    }

}






























