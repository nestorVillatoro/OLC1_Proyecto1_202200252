package graficas;


import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.DefaultCategoryDataset;
import javax.swing.*;
import java.io.File;
import java.io.IOException;
import java.util.List;
import org.jfree.chart.ChartUtilities;

public class graphBar extends JFrame {
    
    public static String nombreIMGBar;
    public static int idIMGBar = 0;
    
    public static void main(String[] args) {
        // Ejemplo de uso
        SwingUtilities.invokeLater(() -> {
            String chartTitle = "Ejemplo de Gráfica de Barras";
            List<String> xLabels = List.of("Enero", "Febrero", "Marzo", "Abril");
            List<Double> yValues = List.of(10.0, 20.0, 15.0, 25.0);
            String xAxisLabel = "Mes";
            String yAxisLabel = "Valor";

            String UbicacionDelBar = graphBar(chartTitle, xLabels, yValues, xAxisLabel, yAxisLabel);
            System.out.println(UbicacionDelBar);
        });
    }
    
    private static String graphBar(String chartTitle, List<String> xLabels, List<Double> yValues, String xAxisLabel, String yAxisLabel) {
   
        String xBar;
        idIMGBar = idIMGBar + 1;
        xBar = String.valueOf(idIMGBar);
        
        nombreIMGBar = "grafica_bar" + xBar + ".jpg";
        
        
        // Crear conjunto de datos
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        for (int i = 0; i < xLabels.size(); i++) {
            dataset.addValue(yValues.get(i), "Data", xLabels.get(i));
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
