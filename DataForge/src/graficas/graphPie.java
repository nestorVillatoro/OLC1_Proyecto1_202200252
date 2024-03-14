package graficas;

import static dataforge.Editor.img;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.chart.ChartUtilities;

import java.io.File;
import java.io.IOException;
import static test.analizadores.Parser.atributospie;
import java.util.ArrayList;
import javax.swing.ImageIcon;

public class graphPie {
    public static String nombreIMGPie;
    public static int idIMGPie = 0;
    public void generarGrafica() {
        
        ArrayList<Object> elementos = atributospie.get(0).getLabel();
        ArrayList<Object> datos = atributospie.get(0).getValues();
        String tituloGrafica = atributospie.get(0).getTitulo();

        // Crear el gráfico de pastel
        String UbicacionDelPie = createPieChart(elementos, datos, tituloGrafica);
        System.out.println(UbicacionDelPie);
        
        img.add(new ImageIcon(UbicacionDelPie));
        
    }


    private static String createPieChart(ArrayList<Object>elementos, ArrayList<Object> datos, String titulo) {
        
        String xPie;
        idIMGPie = idIMGPie + 1;
        xPie = String.valueOf(idIMGPie);
        
        nombreIMGPie = "grafica_pastel" + xPie + ".jpg";
        
        DefaultPieDataset dataset = new DefaultPieDataset();
        for (int i = 0; i < elementos.size(); i++) {
            dataset.setValue(elementos.get(i).toString(), (Number) datos.get(i));
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
