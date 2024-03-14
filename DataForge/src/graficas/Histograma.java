package graficas;


import static dataforge.Editor.img;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.swing.ImageIcon;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import static test.analizadores.Parser.atributoshisto;

public class Histograma {
    public static String nombreIMG;
    public static int idIMG = 0;
    public void generarGrafica() {
        
        ArrayList<Object> datos = atributoshisto.get(0).getValues();
        String titulo = atributoshisto.get(0).getTitulo();

        
        
        
        //creamos la gráfica
        String UbicacionDeHisto = createHistograma(titulo, datos);
        System.out.println(UbicacionDeHisto);
        img.add(new ImageIcon(UbicacionDeHisto));
        
    }       
    
    public static String createHistograma(String titulo, ArrayList<Object> valores) {
        String x;
        idIMG = idIMG + 1;
        x = String.valueOf(idIMG);
        
        nombreIMG = "histograma" + x + ".jpg";
        
        Map<String, Integer> contador = new HashMap<>();
        for (Object elemento : valores) {
            contador.put((String) elemento, contador.getOrDefault(elemento, 0) + 1);
        }

        // Crear un conjunto de datos para el histograma
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        
        
        // Llenar las listas con los datos del mapa
        for (Map.Entry<String, Integer> entry : contador.entrySet()) {
            dataset.addValue(entry.getValue(), entry.getKey(), "");
        }
       

        // Crear el gráfico de histograma
        JFreeChart chart = ChartFactory.createBarChart(titulo, "", "", dataset, PlotOrientation.VERTICAL, true, true, false );

        
         //ruta donde se guardará la imagen 
         
        String rutaArchivo = "C:\\Users\\nyavi\\Desktop\\quinto semestre\\compi\\lab\\OLC1_Proyecto1_202200252\\DataForge\\src\\dataforge\\graficas\\" + nombreIMG;
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

