package graficas;


import java.io.File;
import java.io.IOException;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;



public class graphLine {
    public static String nombreIMGLine;
    public static int idIMGLine = 0;
    public void generarGrafica() {
        
        for(int i = 0; i < 3; i++){
        // Datos de ejemplo (puedes reemplazarlos con tus propios datos)
        String[] elementos = {"Manzanas", "Plátanos", "Peras", "Uvas"};
        double[] datos = {30, 20, 15, 35};
        String tituloGrafica = "Distribución de Frutas";
        String tituloX = "Frutas";
        String tituloY = "Cantidad";
        
        //creamos la gráfica
        String UbicacionDelLine = createLineChart(elementos, datos, tituloGrafica, tituloX, tituloY);
        System.out.println(UbicacionDelLine);
        
        }
    }
    
    private static String createLineChart(String[] elementos, double[] datos, String titulo, String tituloX, String tituloY) {
        String xLine;
        idIMGLine = idIMGLine + 1;
        xLine = String.valueOf(idIMGLine);
        
        nombreIMGLine = "grafica_line" + xLine + ".jpg";
        
        CategoryAxis xAxis = new CategoryAxis(tituloX);
    
    // Crear una serie de datos
    DefaultCategoryDataset dataset = new DefaultCategoryDataset();
    for (int i = 0; i < elementos.length; i++) {
        dataset.addValue(datos[i], titulo, elementos[i]);
    }
    
    // Crear el gráfico de línea
    JFreeChart chart = ChartFactory.createLineChart(titulo, tituloX, tituloY, dataset, PlotOrientation.VERTICAL, true, false, false);
    
    // Asignar el eje x personalizado
    chart.getCategoryPlot().setDomainAxis(xAxis);
    
    //ruta donde se guardará la imagen 
        String rutaArchivo = "C:\\Users\\nyavi\\Desktop\\quinto semestre\\compi\\lab\\OLC1_Proyecto1_202200252\\DataForge\\src\\dataforge\\graficas\\" + nombreIMGLine;
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
