
package dataforge;


public class DataForge {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        try {
            String ruta = "./src/test/Analizadores/";
            String[] opJFlex = {ruta + "lex.jflex", "-d", ruta};
            jflex.Main.generate(opJFlex);

            String[] opCup = {"-destdir", ruta, "-parser", "Parser", ruta + "parser.cup"};
            java_cup.Main.main(opCup);

        } catch (Exception e) {
        }
        
        Abrir_Ventana usar = new Abrir_Ventana();  
        usar.Abrir();
      
    }
}

