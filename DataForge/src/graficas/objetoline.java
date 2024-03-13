
package Graficas;
import java.util.ArrayList;

public class objetoline {
    public String titulo;
    public String titulox;
    public String tituloy;
    public ArrayList<Object> datosX;
    public ArrayList<Object> datosY;

    public objetoline(String titulo, String titulox, String tituloy, ArrayList<Object> datosX, ArrayList<Object> datosY) {
        this.titulo = titulo;
        this.titulox = titulox;
        this.tituloy = tituloy;
        this.datosX = datosX;
        this.datosY = datosY;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getTitulox() {
        return titulox;
    }

    public void setTitulox(String titulox) {
        this.titulox = titulox;
    }

    public String getTituloy() {
        return tituloy;
    }

    public void setTituloy(String tituloy) {
        this.tituloy = tituloy;
    }

    public ArrayList<Object> getDatosX() {
        return datosX;
    }

    public void setDatosX(ArrayList<Object> datosX) {
        this.datosX = datosX;
    }

    public ArrayList<Object> getDatosY() {
        return datosY;
    }

    public void setDatosY(ArrayList<Object> datosY) {
        this.datosY = datosY;
    }
    
}
