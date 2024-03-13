
package Graficas;
import java.util.ArrayList;
public class objetopie {
    public String titulo;
    public ArrayList<Object> label;
    public ArrayList<Object> values;

    public objetopie(String titulo, ArrayList<Object> label, ArrayList<Object> values) {
        this.titulo = titulo;
        this.label = label;
        this.values = values;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public ArrayList<Object> getLabel() {
        return label;
    }

    public void setLabel(ArrayList<Object> label) {
        this.label = label;
    }

    public ArrayList<Object> getValues() {
        return values;
    }

    public void setValues(ArrayList<Object> values) {
        this.values = values;
    }
    
    
}
