# Manual técnico

## lenguajes
### Java
El 92.3% del programa esta hecho con Java y se utiliza para lo gráfico y lógico 
- JDK 19
Con esta librería se hizo la mayoria de lógica del sistema y toda la interfaz gráfica.
- cup - java-cup-11b
Con esta libreria se hizo el análisis sintáctico del lenguaje.
- jflex - jflex-full-1.9.1
Con esta libreria se hizo el análisis léxico del lenguaje.
- jcommon-1.0.23
Con esta libreria se hicieron las gráficas estadísticas.
- jfreechart-1.0.19
    Con esta libreria se hicieron las gráficas estadísticas.

## Métodos y funciones

### Analizadór léxico
#### Declaraciones y configuración inicial:

- Se especifica el paquete test.analizadores.
- Se importa la clase Symbol de java_cup.runtime y las clases Error_ y Tokens_ del paquete Errores.
- Se importan y usan las listas lista_errores y lista_tokens desde el paquete dataforge.Editor.
- Se definen algunas opciones para el analizador léxico, como %class, %public, %line, %char, %cup, %unicode, y %ignorecase.
#### Definición de expresiones regulares:

- Se definen varias expresiones regulares como WHITE, DECIMAL, CARACTERES, y CHARCOMILLAS, que se utilizarán para reconocer diferentes tipos de tokens en el código fuente.
#### Definición de tokens:

- Se definen tokens utilizando cadenas de caracteres encerradas entre comillas dobles, como "PROGRAM" y "END PROGRAM".
Cada vez que se encuentra uno de estos tokens, se imprime un mensaje en consola indicando el token encontrado y se crea un objeto Tokens_ que se añade a la lista de tokens.
- Además de las cadenas de caracteres, también se reconocen los tokens utilizando las expresiones regulares definidas anteriormente (DECIMAL, CARACTERES, etc.).
- Para cada tipo de token reconocido, se imprime un mensaje en consola y se crea un objeto Tokens_ que se añade a la lista de tokens.
#### Reglas de ignorar:

- Se define una regla para ignorar los espacios en blanco, tabuladores y saltos de línea.
#### Manejo de errores:

- Se define una regla para manejar los errores léxicos. Cuando ninguna de las expresiones regulares o tokens definidos coincide con el texto de entrada, se ejecuta esta regla. En este caso, se imprime un mensaje de error y se crea un objeto Error_ que se añade a la lista de errores.

```

package test.analizadores;
import java_cup.runtime.Symbol;
import Errores.Error_;
import static dataforge.Editor.lista_errores;
import static dataforge.Editor.lista_tokens;
import Errores.Tokens_;



%%
%class Scanner 
//Nombre de la clase que genera JFlex
%public // Para tener acceso desde otros paquetes
%line // Para registrar las líneas
%char // Llevar un conteo de caracteres
%cup // Habilita la integración con Cup
%unicode // Reconocimiento de caracteres unicode
%ignorecase // Omite el case sensitive, mayúsculas y minúsculas son iguales

%init{ //Constructor del analizador
    yyline = 1; 
    yycolumn=1;  
%init}

%column
// Expresiones regulares
WHITE = [ \r\t\n]+
DECIMAL = [0-9]+(\.[0-9]+)?
CARACTERES = [a-zA-Z0-9_]+
CHARCOMILLAS = (\")([a-zA-Z0-9_ ]+)(\")



%% //Creación de tokens
// Aquí puede ir código de Java



"PROGRAM" {
System.out.println("PROGRAM"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.PROGRAM,yyline,yycolumn, yytext());
}

"END PROGRAM" {
System.out.println("END PROGRAM"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.ENDPROGRAM,yyline,yycolumn, yytext());
}




{WHITE}   {}




"char\[\]" {
System.out.println("char[]"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.CHAR,yyline,yycolumn, yytext());
}


{DECIMAL}   {
System.out.println("algun decimal o entero"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"Double");
lista_tokens.add(nuevoToken);
return new Symbol(sym.DECIMAL,yyline,yycolumn, yytext());
}

{CHARCOMILLAS} {
System.out.println("algo entre comillas"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"String");
lista_tokens.add(nuevoToken);
return new Symbol(sym.CHARCOMILLAS,yyline,yycolumn, yytext());
}

{CARACTERES} {
System.out.println("algo"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"Var");
lista_tokens.add(nuevoToken);
return new Symbol(sym.CARACTERES,yyline,yycolumn, yytext());
}




. {
    //System.out.println("Lexical error: "+yytext()+" linea: "+yyline+" columna: "+yycolumn);
    Error_ nuevoError = new Error_(yyline,yycolumn,yytext(),true);
    lista_errores.add(nuevoError);
    //System.out.println(nuevoError.toString());
}

```
### Analizadór sintáctico

#### Declaraciones e importaciones:

- Se importan las clases necesarias como Error_, Editor, java_cup.runtime.*, variables, y ArrayList.
- Se define una variable STR como StringBuilder y una lista elementosParaImprimir.
- Se instancia un objeto variables llamado hashVariables.
#### Métodos para manejo de errores sintácticos:

- Se definen dos métodos syntax_error y unrecovered_syntax_error para manejar errores sintácticos. Estos métodos añaden un objeto Error_ a la lista de errores en caso de error sintáctico.
#### Declaración de terminales y no terminales:

- Se definen los tokens terminales y no terminales que se utilizarán en la gramática del parser.
- Los tokens terminales representan los elementos léxicos del lenguaje como palabras clave, operadores, delimitadores, etc.
- Los tokens no terminales representan estructuras sintácticas más complejas que se construyen a partir de los tokens terminales.
#### Reglas de producción:

- Se definen las reglas de producción que especifican cómo se construyen las diferentes estructuras sintácticas del lenguaje.
- Por ejemplo, la regla inicializarPrograma ::= PROGRAM codigo ENDPROGRAM; especifica que un programa comienza con la palabra clave PROGRAM, seguida de un bloque de código (codigo), y termina con la palabra clave ENDPROGRAM.
- Cada regla de producción puede contener tokens terminales, no terminales, y código Java entre llaves {} que se ejecuta cuando se reduce esa regla.
#### Acciones semánticas:

- Dentro de las reglas de producción, se incluyen acciones semánticas que se ejecutan cuando se reduce esa regla.
- Estas acciones pueden realizar operaciones como asignar valores a variables, llamar a métodos, construir objetos, etc.
- Por ejemplo, en la regla declararVariable, se añade una variable al hashmap hashVariables utilizando el nombre y el contenido especificados.

```
package test.analizadores;
import Errores.Error_;
import dataforge.Editor;
import java_cup.runtime.*;
import hashMap.variables;
import java.util.ArrayList;


parser code 
{:
    public static StringBuilder STR = new StringBuilder();
    public ArrayList <String> elementosParaImprimir = new ArrayList <String>(); 

    variables hashVariables = new variables();

    public void syntax_error(Symbol s){
        //System.out.println("Error sintáctico: "+s.value+" linea: "+s.left+" columna: "+s.right);
        Error_ miError = new Error_(s.left,s.right,s.value.toString(),false);
        Editor.lista_errores.add(miError);
}
    public void unrecovered_syntax_error(Symbol s) throws java.lang.Exception{
       // System.out.println("Error sintáctico unrecovered: "+s.value+" linea: "+s.left+" columna: "+s.right);
        Error_ miError = new Error_(s.left,s.right,s.value.toString(),false);
        Editor.lista_errores.add(miError);    
}


:}

terminal String CHAR, DOUBLE, VAR, END, IGUALDAD, ARR, ARROBA, CORCHETEIZ, EJEX, EJEY, TITULOX, TITULOY;
terminal String CORCHETEDE, SUM, RES, MUL, DIV, MOD, PARENTESISIZ, PARENTESISDE, COMA, GRAPHLINE, HISTOGRAMA;
terminal String MEDIA, MEDIANA, MODA, VARIANZA, MAX, MIN, CONSOLE, PRINT, COLUMN, IGUAL, PUNTOCOMA, DOSPUNTOS;
terminal String DECIMAL, CARACTERES, CHARCOMILLAS, PROGRAM, ENDPROGRAM, GRAPHPIE, LABEL, VALUES, TITULO, EXEC;

non terminal declararVariable, declararDouble, declararChar, inicializarPrograma, codigo, comandos, listaImprimir;
non terminal declararArreglos, listaArreglosDouble, listaArreglosChar, declararGraficaHistograma, todo;
non terminal declararAritmetica, declararEstadisticas, declararPrint, declararGraficaPie, declararGraficaLine;

inicializarPrograma ::= PROGRAM codigo ENDPROGRAM;

codigo ::= comandos
        | codigo comandos;

comandos ::= declararVariable
            | declararArreglos
            | declararAritmetica
            | declararEstadisticas
            | declararPrint
            | declararGraficaPie
            | declararGraficaHistograma
            | declararGraficaLine;





declararVariable ::= VAR DOSPUNTOS DOUBLE DOSPUNTOS DOSPUNTOS CARACTERES:name IGUALDAD declararDouble:contenido END PUNTOCOMA {:hashVariables.setVariable(name, contenido);:}
                    | VAR DOSPUNTOS CHAR DOSPUNTOS DOSPUNTOS CARACTERES:name IGUALDAD declararChar:contenido END PUNTOCOMA {:hashVariables.setVariable(name, contenido);:};

declararDouble ::= DECIMAL:x {:RESULT = Double.parseDouble(x);:}
                    | CARACTERES:var {:RESULT = hashVariables.getVariable(var);:};

declararChar ::= CARACTERES:var {:RESULT = hashVariables.getVariable(var);:}
                   | CHARCOMILLAS:texto {:RESULT = ((String) texto);:};

```