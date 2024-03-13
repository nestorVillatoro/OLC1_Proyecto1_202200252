
package Graficas;
import java.util.ArrayList;

public class objetohisto {
    public String titulo;
    public ArrayList<Object> values;

    public objetohisto(String titulo, ArrayList<Object> values) {
        this.titulo = titulo;
        this.values = values;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public ArrayList<Object> getValues() {
        return values;
    }

    public void setValues(ArrayList<Object> values) {
        this.values = values;
    }
    
}