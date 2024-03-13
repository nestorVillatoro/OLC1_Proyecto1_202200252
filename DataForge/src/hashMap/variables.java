package hashMap;
import java.util.HashMap;
import java.util.Map;

public class variables {
     // Mapa para almacenar las variables y sus valores
    public Map<String, Object> variables;
    
    public variables() {
        
        this.variables = new HashMap<>();
        
    }

    // Método para asignar un valor a una variable
    public void setVariable(String nombre, Object contenido) {
        if (contenido instanceof String) {
            
            String contenidoStr =  (String) contenido;
            contenidoStr = contenidoStr.substring(1, contenidoStr.length() - 1);
             variables.put(nombre, contenidoStr);
             System.out.println("SE AGREGO A LAS VARIABLES, LA VARIABLE:  "+nombre+" Y ALMACENA: "+ contenidoStr);

        }
        else{
            
            variables.put(nombre, contenido);
            System.out.println("SE AGREGO A LAS VARIABLES, LA VARIABLE:  "+nombre+" Y ALMACENA: "+ contenido);
            
        }
        
    }

    // Método para obtener el valor de una variable
    public Object getVariable(String nombre) {
        return variables.get(nombre);
    }
    
    
}
