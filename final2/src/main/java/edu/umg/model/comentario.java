package edu.umg.model;

/**
 * <h3></h3>
 *
 * @descripción
 * @autor carlos ramirez
 **/
public class comentario {
    String nomrbe;
    String comentario;



    public comentario(String nomrbe, String comentario) {
        this.nomrbe = nomrbe;
        this.comentario = comentario;
    }

    public String getNomrbe() {
        return nomrbe;
    }

    public void setNomrbe(String nomrbe) {
        this.nomrbe = nomrbe;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }



}


