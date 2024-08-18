
package test.analizadores;
import java_cup.runtime.Symbol;
import Errores.Error_;
import static dataforge.Editor.lista_errores;
import static dataforge.Editor.lista_tokens;
import Errores.Tokens_;



%%
%class Scanner //Nombre de la clase que genera JFlex
%public // Para tener acceso desde otros paquetes
%line // Para registrar las líneas
%char // Llevar un conteo de caracteres
%cup // Habilita la integración con Cup
%unicode // Reconocimiento de caracteres unicode

%init{ //Constructor del analizador
    yyline = 1; 
    yycolumn=1;  
%init}

%column
// Expresiones regulares
WHITE = [ \r\t\n]+
// DECIMAL = [0-9]+(\.[0-9]+)?
CARACTERUNICO = [\x21-\x7E]
CARACTERES = [a-zA-Z0-9_]+


CARACTERESCOM = ("#")(.+?)
CARACTERESCOMMUL = "<!" ([^>]|\n)* "!>"

llaveiz = "\{"
llavede = "\}"


%% //Creación de tokens
// Aquí puede ir código de Java




{llaveiz} {
System.out.println("{"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.LLAVEIZ,yyline,yycolumn, yytext());
}

{llavede} {
System.out.println("}"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.LLAVEDE,yyline,yycolumn, yytext());
}

{CARACTERESCOMMUL} {
System.out.println("Comentario multi"); 
}


{WHITE}   {}

{CARACTERESCOM} {
System.out.println("Comentario"); 
}


"CONJ" {
System.out.println("CONJ"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.CONJ,yyline,yycolumn, yytext());
}

"OPERA" {
System.out.println("OPERA"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.OPERA,yyline,yycolumn, yytext());
}

"EVALUAR" {
System.out.println("EVALUAR"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.EVALUAR,yyline,yycolumn, yytext());
}

":" {
System.out.println(":"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.DOSPUNTOS,yyline,yycolumn, yytext());
}


"->" {
System.out.println("->");
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken); 
return new Symbol(sym.IGUALDAD,yyline,yycolumn, yytext());
}

"~" {
System.out.println("~");
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken); 
return new Symbol(sym.HASTA,yyline,yycolumn, yytext());
}



"U" {
System.out.println("U"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.UNION,yyline,yycolumn, yytext());
}

"&" {
System.out.println("&"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.INTERSECCION,yyline,yycolumn, yytext());
}

"^" {
System.out.println("^"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.COMPLEMENTO,yyline,yycolumn, yytext());
}


"-" {
System.out.println("-"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.DIFERENCIA,yyline,yycolumn, yytext());
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

";" {
System.out.println(";"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"id");
lista_tokens.add(nuevoToken);
return new Symbol(sym.PUNTOCOMA,yyline,yycolumn, yytext());
}


// {DECIMAL}   {
// System.out.println("algun decimal o entero"); 
// Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"Double");
// lista_tokens.add(nuevoToken);
// return new Symbol(sym.DECIMAL,yyline,yycolumn, yytext());
// }

{CARACTERUNICO} {
System.out.println("caracter unico"); 
Tokens_ nuevoToken = new Tokens_(yyline,yycolumn,yytext(),"Var");
lista_tokens.add(nuevoToken);
return new Symbol(sym.CARACTERUNICO,yyline,yycolumn, yytext());
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
