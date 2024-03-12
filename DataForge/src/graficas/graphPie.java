package graficas;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.chart.ChartUtilities;

import java.io.File;
import java.io.IOException;

public class graphPie {
    public static String nombreIMGPie;
    public static int idIMGPie = 0;
    public static void main(String[] args) {
        
        for(int i = 0; i < 3; i++){
        // Datos de ejemplo (puedes reemplazarlos con tus propios datos)
        String[] elementos = {"Manzanas", "Plátanos", "Peras", "Uvas"};
        double[] datos = {30, 20, 15, 35};
        String tituloGrafica = "Distribución de Frutas";

        // Crear el gráfico de pastel
        String UbicacionDelPie = createPieChart(elementos, datos, tituloGrafica);
        System.out.println(UbicacionDelPie);
        }
    }


    private static String createPieChart(String[] elementos, double[] datos, String titulo) {
        
        String xPie;
        idIMGPie = idIMGPie + 1;
        xPie = String.valueOf(idIMGPie);
        
        nombreIMGPie = "grafica_pastel" + xPie + ".jpg";
        
        DefaultPieDataset dataset = new DefaultPieDataset();
        for (int i = 0; i < elementos.length; i++) {
            dataset.setValue(elementos[i], datos[i]);
        }
        
        JFreeChart chart = ChartFactory.createPieChart(titulo, dataset, true, true, false);
        
        //ruta de la imagen
        String rutaArchivo = "C:\\Users\\nyavi\\Desktop\\quinto semestre\\compi\\lab\\OLC1_Proyecto1_202200252\\DataForge\\src\\dataforge\\graficas\\" + nombreIMGPie;
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
