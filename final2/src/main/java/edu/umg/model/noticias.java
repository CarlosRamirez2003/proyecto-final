package edu.umg.model;

/**
 * <h3></h3>
 *
 * @descripción
 * @autor carlos ramirez
 **/
public class noticias {
    private  String titulo;
    private  String resumen;
    private  String firma;
    private  String url;

    public noticias(String titulo, String resumen, String firma, String url) {
        this.titulo = titulo;
        this.resumen = resumen;
        this.firma = firma;
        this.url = url;
    }

    public noticias() {

    }


    public String getTitulo() {
        return titulo;
    }


    public String getResumen() {
        return resumen;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public String getFirma() {
        return firma;
    }

    public void setFirma(String firma) {
        this.firma = firma;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String setTitulo(String titulo) {
        this.titulo = titulo;
        return titulo;
    }
}
