package graficas;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import javax.swing.ImageIcon;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import static test.analizadores.Parser.atributoslinea;
import static dataforge.Editor.img; 
 


public class graphLine {
    public static String nombreIMGLine;
    public static int idIMGLine = 0;
    public void generarGrafica() {
        
        ArrayList<Object> datosx = atributoslinea.get(0).getDatosX();
        ArrayList<Object> datosy = atributoslinea.get(0).getDatosY();
        String titulo = atributoslinea.get(0).getTitulo();
        String tituloX = atributoslinea.get(0).getTitulox();
        String tituloY = atributoslinea.get(0).getTituloy();
        
        
        
        //creamos la gráfica
        String UbicacionDelLine = createLineChart(datosx, datosy, titulo, tituloX, tituloY);
        System.out.println(UbicacionDelLine);
        img.add(new ImageIcon(UbicacionDelLine));
        
    }
    
    private static String createLineChart(ArrayList<Object> elementos, ArrayList<Object> datos, String titulo, String tituloX, String tituloY) {
        String xLine;
        idIMGLine = idIMGLine + 1;
        xLine = String.valueOf(idIMGLine);
        
        nombreIMGLine = "grafica_line" + xLine + ".jpg";
        
        CategoryAxis xAxis = new CategoryAxis(tituloX);
    
    // Crear una serie de datos
    DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        for (int i = 0; i < elementos.size(); i++) {
            dataset.addValue((Number) datos.get(i), titulo, elementos.get(i).toString());
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
