
package test.analizadores;
import java_cup.runtime.Symbol;
import Errores.Error_;
import static dataforge.Editor.lista_errores;

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
CHARCOMILLAS = (\")([a-zA-Z0-9_]+)(\")

corcheteiz = "\["
corchetede = "\]"


%% //Creación de tokens
// Aquí puede ir código de Java

"PROGRAM" {
System.out.println("PROGRAM"); 
return new Symbol(sym.PROGRAM,yyline,yycolumn, yytext());
}

"END PROGRAM" {
System.out.println("END PROGRAM"); 
return new Symbol(sym.ENDPROGRAM,yyline,yycolumn, yytext());
}


{WHITE}   {}


"char\[\]" {
System.out.println("char[]"); 
return new Symbol(sym.CHAR,yyline,yycolumn, yytext());
}

":" {
System.out.println(":"); 
return new Symbol(sym.DOSPUNTOS,yyline,yycolumn, yytext());
}
"double" {
System.out.println("double"); 
return new Symbol(sym.DOUBLE,yyline,yycolumn, yytext());
}

"var" {
System.out.println("var"); 
return new Symbol(sym.VAR,yyline,yycolumn, yytext());
}

"end" {
System.out.println("end"); 
return new Symbol(sym.END,yyline,yycolumn, yytext());
}

"<-" {
System.out.println("<-"); 
return new Symbol(sym.IGUALDAD,yyline,yycolumn, yytext());
}

"arr" {
System.out.println("arr");
return new Symbol(sym.ARR,yyline,yycolumn, yytext());
}

"\@" {
System.out.println("@");
return new Symbol(sym.ARROBA,yyline,yycolumn, yytext());
}

{corcheteiz} {
System.out.println("["); 
return new Symbol(sym.CORCHETEIZ,yyline,yycolumn, yytext());
}

{corchetede} {
System.out.println("]"); 
return new Symbol(sym.CORCHETEDE,yyline,yycolumn, yytext());
}

"SUM"  {
System.out.println("sum"); 
return new Symbol(sym.SUM,yyline,yycolumn, yytext());
}

"RES" {
System.out.println("res"); 
return new Symbol(sym.RES,yyline,yycolumn, yytext());
}

"MUL" {
System.out.println("mul"); 
return new Symbol(sym.MUL,yyline,yycolumn, yytext());
}

"DIV" {
System.out.println("div"); 
return new Symbol(sym.DIV,yyline,yycolumn, yytext());
}

"MOD" {
System.out.println("mod"); 
return new Symbol(sym.MOD,yyline,yycolumn, yytext());
}

"("  {
System.out.println("("); 
return new Symbol(sym.PARENTESISIZ,yyline,yycolumn, yytext());
}

")" {
System.out.println(")"); 
return new Symbol(sym.PARENTESISDE,yyline,yycolumn, yytext());
}

","  {
System.out.println(","); 
return new Symbol(sym.COMA,yyline,yycolumn, yytext());
}

"Media" {
System.out.println("Media"); 
return new Symbol(sym.MEDIA,yyline,yycolumn, yytext());
}

"Mediana" {
System.out.println("Mediana"); 
return new Symbol(sym.MEDIANA,yyline,yycolumn, yytext());
}

"Moda" {
System.out.println("Moda"); 
return new Symbol(sym.MODA,yyline,yycolumn, yytext());
}

"Varianza" {
System.out.println("Varianza"); 
return new Symbol(sym.VARIANZA,yyline,yycolumn, yytext());
}

"Max" {
System.out.println("Max"); 
return new Symbol(sym.MAX,yyline,yycolumn, yytext());
}

"Min" {
System.out.println("Min"); 
return new Symbol(sym.MIN,yyline,yycolumn, yytext());
}

"console" {
System.out.println("console"); 
return new Symbol(sym.CONSOLE,yyline,yycolumn, yytext());
}

"print" {
System.out.println("print"); 
return new Symbol(sym.PRINT,yyline,yycolumn, yytext());
}

"column" {
System.out.println("column"); 
return new Symbol(sym.COLUMN,yyline,yycolumn, yytext());
}

"=" {
System.out.println("="); 
return new Symbol(sym.IGUAL,yyline,yycolumn, yytext());
}

";" {
System.out.println(";"); 
return new Symbol(sym.PUNTOCOMA,yyline,yycolumn, yytext());
}

"graphPie" {
System.out.println("graphPie"); 
return new Symbol(sym.GRAPHPIE,yyline,yycolumn, yytext());
}

"titulo" {
System.out.println("titulo"); 
return new Symbol(sym.TITULO,yyline,yycolumn, yytext());
}

"label" {
System.out.println("label"); 
return new Symbol(sym.LABEL,yyline,yycolumn, yytext());
}

"values" {
System.out.println("values"); 
return new Symbol(sym.VALUES,yyline,yycolumn, yytext());
}

"EXEC" {
System.out.println("EXEC"); 
return new Symbol(sym.EXEC,yyline,yycolumn, yytext());
}

"ejeX" {
System.out.println("ejeX"); 
return new Symbol(sym.EJEX,yyline,yycolumn, yytext());
}

"ejeY" {
System.out.println("ejeY"); 
return new Symbol(sym.EJEY,yyline,yycolumn, yytext());
}

"tituloX" {
System.out.println("tituloX"); 
return new Symbol(sym.TITULOX,yyline,yycolumn, yytext());
}

"tituloY" {
System.out.println("tituloY"); 
return new Symbol(sym.TITULOY,yyline,yycolumn, yytext());
}

"graphLine" {
System.out.println("graphLine"); 
return new Symbol(sym.GRAPHLINE,yyline,yycolumn, yytext());
}






{DECIMAL}   {
System.out.println("algun decimal o entero"); 
return new Symbol(sym.DECIMAL,yyline,yycolumn, yytext());
}

{CHARCOMILLAS} {
System.out.println("algo entre comillas"); 
return new Symbol(sym.CHARCOMILLAS,yyline,yycolumn, yytext());
}

{CARACTERES} {
System.out.println("algo"); 
return new Symbol(sym.CARACTERES,yyline,yycolumn, yytext());
}


. {
    //System.out.println("Lexical error: "+yytext()+" linea: "+yyline+" columna: "+yycolumn);
    Error_ nuevoError = new Error_(yyline,yycolumn,yytext(),true);
    lista_errores.add(nuevoError);
    //System.out.println(nuevoError.toString());
}
