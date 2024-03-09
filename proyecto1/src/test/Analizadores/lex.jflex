
package test.analizadores;
import java_cup.runtime.Symbol;
import Errores.Error_;
import static test.Test.lista_errores;

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
ENTERO = [0-9]+
DECIMAL = {ENTERO}\.{ENTERO} 


%% //Creación de tokens
// Aquí puede ir código de Java


"char\[\]" {return new Symbol(sym.CHAR,yyline,yycolumn, yytext());}
":" {return new Symbol(sym.DOSPUNTOS,yyline,yycolumn, yytext());}
"double" {return new Symbol(sym.DOUBLE,yyline,yycolumn, yytext());}
"var" {return new Symbol(sym.VAR,yyline,yycolumn, yytext());}
"end" {return new Symbol(sym.END,yyline,yycolumn, yytext());}
"<-" {return new Symbol(sym.IGUALDAD,yyline,yycolumn, yytext());}
"arr" {return new Symbol(sym.ARR,yyline,yycolumn, yytext());}
"@" {return new Symbol(sym.ARROBA,yyline,yycolumn, yytext());}
"\[" {return new Symbol(sym.CORCHETEIZ,yyline,yycolumn, yytext());}
"\]" {return new Symbol(sym.CORCHETEDE,yyline,yycolumn, yytext());}
"SUM" {return new Symbol(sym.SUM,yyline,yycolumn, yytext());}
"RES" {return new Symbol(sym.RES,yyline,yycolumn, yytext());}
"MUL" {return new Symbol(sym.MUL,yyline,yycolumn, yytext());}
"DIV" {return new Symbol(sym.DIV,yyline,yycolumn, yytext());}
"MOD" {return new Symbol(sym.MOD,yyline,yycolumn, yytext());}
"(" {return new Symbol(sym.PARENTESISIZ,yyline,yycolumn, yytext());}
")" {return new Symbol(sym.PARENTESISDE,yyline,yycolumn, yytext());}
"," {return new Symbol(sym.COMA,yyline,yycolumn, yytext());}
"Media" {return new Symbol(sym.MEDIA,yyline,yycolumn, yytext());}
"Mediana" {return new Symbol(sym.MEDIANA,yyline,yycolumn, yytext());}
"Moda" {return new Symbol(sym.MODA,yyline,yycolumn, yytext());}
"Varianza" {return new Symbol(sym.VARIANZA,yyline,yycolumn, yytext());}
"Max" {return new Symbol(sym.MAX,yyline,yycolumn, yytext());}
"Min" {return new Symbol(sym.MIN,yyline,yycolumn, yytext());}
"console" {return new Symbol(sym.CONSOLE,yyline,yycolumn, yytext());}
"print" {return new Symbol(sym.PRINT,yyline,yycolumn, yytext());}
"column" {return new Symbol(sym.COLUMN,yyline,yycolumn, yytext());}
"=" {return new Symbol(sym.IGUAL,yyline,yycolumn, yytext());}




  
{WHITE}   {}
{ENTERO}    {return new Symbol(sym.ENTERO,yyline,yycolumn, yytext());}
{DECIMAL}   {return new Symbol(sym.DECIMAL,yyline,yycolumn, yytext());}

. {
    //System.out.println("Lexical error: "+yytext()+" linea: "+yyline+" columna: "+yycolumn);
    Error_ nuevoError = new Error_(yyline,yycolumn,yytext(),true);
    lista_errores.add(nuevoError);
    //System.out.println(nuevoError.toString());
}
