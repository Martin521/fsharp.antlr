grammar FSharp;
import FSharpLex;

// EQUALS: '=';
// INT: DIGIT_CHAR+;

// binding: LET IDENT EQUALS INT;
// binding: 'let' Ident '=' (CharacterLiteral | RegularStringLiteral);
implementationFile:
    namedModule
    // | namespaceDeclarationGroup
    // | anonymousModule
    ;
namedModule: 'module' longIdent moduleElem*;
moduleElem:
    moduleFunctionOrValueDefn
    // | typeDefns
    // | exceptionDefn
    // | moduleDefn
    // | moduleAbbrev
    // | importDecl
    // | compilerDirectiveDecl
    ;
moduleFunctionOrValueDefn:
    valueDefn
    // | attributesopt let function-defn
    // | attributesopt let value-defn
    // | attributesopt let recopt function-or-value-defns
    // | attributesopt do expr
    ;
valueDefn:
    'let' Ident  '=' expr
    // mutableopt accessopt pat typar-defnsopt return-typeopt = expr
    ;
longIdent: Ident ('.' Ident)*;
expr: RegularStringLiteral;

// file : expression (SEMI expression)* EOF;
// expression : expression POW expression | expression (TIMES | DIV) expression | expression (PLUS | MINUS) expression | LPAREN expression RPAREN | (PLUS | MINUS)* atom ;
// atom : scientific | variable ;
// scientific : SCIENTIFIC_NUMBER ;
// variable : VARIABLE ;

// VARIABLE : VALID_ID_START VALID_ID_CHAR* ;
// SCIENTIFIC_NUMBER : NUMBER (E SIGN? UNSIGNED_INTEGER)? ;
// LPAREN : '(' ;
// RPAREN : ')' ;
// PLUS : '+' ;
// MINUS : '-' ;
// TIMES : '*' ;
// DIV : '/' ;
// GT : '>' ;
// LT : '<' ;
// EQ : '=' ;
// POINT : '.' ;
// POW : '^' ;
// SEMI : ';' ;
// WS : [ \r\n\t] + -> channel(HIDDEN) ;

// fragment VALID_ID_START : ('a' .. 'z') | ('A' .. 'Z') | '_' ;
// fragment VALID_ID_CHAR : VALID_ID_START | ('0' .. '9') ;
// fragment NUMBER : ('0' .. '9') + ('.' ('0' .. '9') +)? ;
// fragment UNSIGNED_INTEGER : ('0' .. '9')+ ;
// fragment E : 'E' | 'e' ;
// fragment SIGN : ('+' | '-') ;
