package graficas;


import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.DefaultCategoryDataset;
import javax.swing.*;
import java.io.File;
import java.io.IOException;
import org.jfree.chart.ChartUtilities;
import static dataforge.Editor.img;
import static test.analizadores.Parser.atributosbar;
import java.util.ArrayList;

public class graphBar {
    
    public static String nombreIMGBar;
    public static int idIMGBar = 0;
    
    public void generarGrafica() {
        // Ejemplo de uso
        SwingUtilities.invokeLater(() -> {
            ArrayList<Object> datosx = atributosbar.get(0).getDatosX();
            ArrayList<Object> datosy = atributosbar.get(0).getDatosY();
            String titulo = atributosbar.get(0).getTitulo();
            String tituloX = atributosbar.get(0).getTitulox();
            String tituloY = atributosbar.get(0).getTituloy();

            String UbicacionDelBar = graphBar(titulo, datosx, datosy, tituloX, tituloY);
            System.out.println(UbicacionDelBar);
            
            img.add(new ImageIcon(UbicacionDelBar));
        });
    }
    
    private static String graphBar(String chartTitle, ArrayList<Object> xLabels, ArrayList<Object> yValues, String xAxisLabel, String yAxisLabel) {
   
        String xBar;
        idIMGBar = idIMGBar + 1;
        xBar = String.valueOf(idIMGBar);
        
        nombreIMGBar = "grafica_bar" + xBar + ".jpg";
        
        
        // Crear conjunto de datos
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        for (int i = 0; i < xLabels.size(); i++) {
            dataset.addValue( (Number) yValues.get(i), chartTitle, xLabels.get(i).toString());
        }


        // Crear la gráfica
        JFreeChart chart = ChartFactory.createBarChart(
                chartTitle,    // Título de la gráfica
                xAxisLabel,    // Título del eje X
                yAxisLabel,    // Título del eje Y
                dataset        // Conjunto de datos
        );
        
        //ruta donde se guardará la imagen 
        String rutaArchivo = "C:\\Users\\nyavi\\Desktop\\quinto semestre\\compi\\lab\\OLC1_Proyecto1_202200252\\DataForge\\src\\dataforge\\graficas\\" + nombreIMGBar;
        File archivo = new File(rutaArchivo);

        // Guardar el gráfico como imagen .jpg en la ubicación especificada
        try {
            ChartUtilities.saveChartAsJPEG(archivo, chart, 800, 600);
            System.out.println("Imagen guardada en: " + rutaArchivo); 
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        
        return rutaArchivo;
    }

    
}
