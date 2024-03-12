
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
CARACTERESCOM = ("!")(.+?)
CARACTERESCOMMUL = "<!" ([^>]|\n)* "!>"
CHARCOMILLAS = (\")([a-zA-Z0-9_ ]+)(\")

corcheteiz = "\["
corchetede = "\]"


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

{CARACTERESCOMMUL} {
System.out.println("Comentario"); 
}


{WHITE}   {}

{CARACTERESCOM} {
System.out.println("Comentario"); 
}


"char\[\]" {
System.out.println("char[]"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.CHAR,yyline,yycolumn, yytext());
}

":" {
System.out.println(":"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.DOSPUNTOS,yyline,yycolumn, yytext());
}
"double" {
System.out.println("double"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.DOUBLE,yyline,yycolumn, yytext());
}

"var" {
System.out.println("var"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.VAR,yyline,yycolumn, yytext());
}

"end" {
System.out.println("end"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.END,yyline,yycolumn, yytext());
}

"<-" {
System.out.println("<-");
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken); 
return new Symbol(sym.IGUALDAD,yyline,yycolumn, yytext());
}

"arr" {
System.out.println("arr");
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.ARR,yyline,yycolumn, yytext());
}

"\@" {
System.out.println("@");
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.ARROBA,yyline,yycolumn, yytext());
}

{corcheteiz} {
System.out.println("["); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.CORCHETEIZ,yyline,yycolumn, yytext());
}

{corchetede} {
System.out.println("]"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.CORCHETEDE,yyline,yycolumn, yytext());
}

"SUM"  {
System.out.println("sum"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.SUM,yyline,yycolumn, yytext());
}

"RES" {
System.out.println("res"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.RES,yyline,yycolumn, yytext());
}

"MUL" {
System.out.println("mul"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.MUL,yyline,yycolumn, yytext());
}

"DIV" {
System.out.println("div"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.DIV,yyline,yycolumn, yytext());

}

"MOD" {
System.out.println("mod"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.MOD,yyline,yycolumn, yytext());
}

"("  {
System.out.println("(");
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken); 
return new Symbol(sym.PARENTESISIZ,yyline,yycolumn, yytext());
}

")" {
System.out.println(")"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.PARENTESISDE,yyline,yycolumn, yytext());
}

","  {
System.out.println(","); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.COMA,yyline,yycolumn, yytext());
}

"Media" {
System.out.println("Media"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.MEDIA,yyline,yycolumn, yytext());
}

"Mediana" {
System.out.println("Mediana"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.MEDIANA,yyline,yycolumn, yytext());
}

"Moda" {
System.out.println("Moda"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.MODA,yyline,yycolumn, yytext());
}

"Varianza" {
System.out.println("Varianza"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.VARIANZA,yyline,yycolumn, yytext());
}

"Max" {
System.out.println("Max"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.MAX,yyline,yycolumn, yytext());
}

"Min" {
System.out.println("Min"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.MIN,yyline,yycolumn, yytext());
}

"console" {
System.out.println("console"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.CONSOLE,yyline,yycolumn, yytext());
}

"print" {
System.out.println("print"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.PRINT,yyline,yycolumn, yytext());
}

"column" {
System.out.println("column"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.COLUMN,yyline,yycolumn, yytext());
}

"=" {
System.out.println("="); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.IGUAL,yyline,yycolumn, yytext());
}

";" {
System.out.println(";"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.PUNTOCOMA,yyline,yycolumn, yytext());
}

"graphPie" {
System.out.println("graphPie"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.GRAPHPIE,yyline,yycolumn, yytext());
}

"titulo" {
System.out.println("titulo"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.TITULO,yyline,yycolumn, yytext());
}

"label" {
System.out.println("label"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.LABEL,yyline,yycolumn, yytext());
}

"values" {
System.out.println("values"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.VALUES,yyline,yycolumn, yytext());
}

"EXEC" {
System.out.println("EXEC"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.EXEC,yyline,yycolumn, yytext());
}

"ejeX" {
System.out.println("ejeX"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.EJEX,yyline,yycolumn, yytext());
}

"ejeY" {
System.out.println("ejeY"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.EJEY,yyline,yycolumn, yytext());
}

"tituloX" {
System.out.println("tituloX"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.TITULOX,yyline,yycolumn, yytext());
}

"tituloY" {
System.out.println("tituloY"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.TITULOY,yyline,yycolumn, yytext());
}

"graphLine" {
System.out.println("graphLine"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.GRAPHLINE,yyline,yycolumn, yytext());
}

"Histograma" {
System.out.println("Histograma");
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken); 
return new Symbol(sym.HISTOGRAMA,yyline,yycolumn, yytext());
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
