lexer grammar FSharpLex;

// Keywords §3.4
ABSTRACT: 'abstract';
AND: 'and';
AS: 'as';
ASSERT: 'assert';
BASE: 'base';
BEGIN: 'begin';
CLASS: 'class';
DEFAULT: 'default';
DELEGATE: 'delegate';
DO: 'do';
DONE: 'done';
DOWNCAST: 'downcast';
DOWNTO: 'downto';
ELIF: 'elif';
ELSE: 'else';
END: 'end';
EXCEPTION: 'exception';
EXTERN: 'extern';
FALSE: 'false';
FINALLY: 'finally';
FOR: 'for';
FUN: 'fun';
FUNCTION: 'function';
GLOBAL: 'global';
IF: 'if';
IN: 'in';
INHERIT: 'inherit';
INLINE: 'inline';
INTERFACE: 'interface';
INTERNAL: 'internal';
LAZY: 'lazy';
LET: 'let';
MATCH: 'match';
MEMBER: 'member';
MODULE: 'module';
MUTABLE: 'mutable';
NAMESPACE: 'namespace';
NEW: 'new';
NULL: 'null';
OF: 'of';
OPEN: 'open';
OR: 'or';
OVERRIDE: 'override';
PRIVATE: 'private';
PUBLIC: 'public';
REC: 'rec';
RETURN: 'return';
SIG: 'sig';
STATIC: 'static';
STRUCT: 'struct';
THEN: 'then';
TO: 'to';
TRUE: 'true';
TRY: 'try';
TYPE: 'type';
UPCAST: 'upcast';
USE: 'use';
VAL: 'val';
VOID: 'void';
WHEN: 'when';
WHILE: 'while';
WITH: 'with';
YIELD: 'yield';

// Reserved Keywords (§3.4)
ATOMIC: 'atomic';
BREAK: 'break';
CHECKED: 'checked';
COMPONENT: 'component';
CONST: 'const';
CONSTRAINT: 'constraint';
CONSTRUCTOR: 'constructor';
CONTINUE: 'continue';   
EAGER: 'eager';
FIXED: 'fixed';
FORI: 'fori';
FUNCTOR: 'functor';
INCLUDE: 'include';
MEASURE: 'measure';
METHOD: 'method';
MIXIN: 'mixin';
OBJECT: 'object';
PARALLEL: 'parallel';
PARAMS: 'params';
PROCESS: 'process';
PROTECTED: 'protected';
PURE: 'pure';
RECURSIVE: 'recursive';
SEALED: 'sealed';
TAILCALL: 'tailcall';
TRAIT: 'trait';
VIRTUAL: 'virtual';
VOLATILE: 'volatile';

// Symbolic keywords
LETBANG: 'let!';
USEBANG: 'use!';
DOBANG: 'do!';
YIELDBANG: 'yield!';
RETURNBANG: 'return!';
PIPE: '|';
FUNARROW: '->';
ASSIGNARROW: '<-';
DOT: '.';
COLON: ':';
LPAREN: '(';
RPAREN: ')';
LBRACK: '[';
RBRACK: ']';
ATTROPEN: '[<';
ATTRCLOSE: '>]';
ARROPEN: '[|';
ARRCLOSE: '|]';
LBRACE: '{';
RBRACE: '}';
QUOTE: '\'';
HASH: '#';
DOWNCASTOP: ':?>';
TYPETEST: ':?';
UPCASTOP: ':>';
RANGE: '..';
CONS: '::';
REFASSIGN: ':=';
FRAGSEP: ';;';
SEP: ';';
EQUALS: '=';
UNDERLINE: '_';
//QMARK: '?';
DQMARK: '??';
MULTOP: '(*)';
LQUOT: '<@';
RQUOT: '@>';
LQUOTU: '<@@';
RQUOTU: '@@>';

fragment FirstOpChar: [!%&*+-./<=>@^|~];
fragment OpChar: FirstOpChar | '?';
SymbolicOperator:  '?' | '?<-' | FirstOpChar OpChar*;

Ident: IdentifierName | '``' ('`'? ~[`\n\r\t])+ '``';
ReservedIdent: IdentifierName [!*];

CharacterLiteral:
    '\'' (SingleQuotationMarkEscapeSequence | GeneralEscapeSequence | ~[\n\r\t\b\f\u0007\u000b']) '\'';
RegularStringLiteral:
    '"' (DoubleQuotationMarkEscapeSequence | GeneralEscapeSequence | ~[\n\r\t\b\f\u0007\u000b"])* '"';

fragment Alert: '\u0007';
fragment LineTabulation: '\u000b';
fragment ControlCharacter: [\n\r\t\b\f\u0007\u000b];
fragment GeneralEscapeSequence:
    ControlCharacterEscapeSequence | BackslashEscapeSequence | TrigraphEscapeSequence
    | UnicodeEscapeSequence | LongUnicodeEscapeSequence;
fragment ControlCharacterEscapeSequence: '\\' [nrbtfav];
fragment BackslashEscapeSequence: '\\\\';
fragment SingleQuotationMarkEscapeSequence: '\\\'';
fragment DoubleQuotationMarkEscapeSequence: '\\"';
fragment TrigraphEscapeSequence: '\\' Digit Digit Digit;
fragment UnicodeEscapeSequence: '\\u' HexDigit HexDigit HexDigit HexDigit;
fragment LongUnicodeEscapeSequence: '\\U' HexDigit HexDigit HexDigit HexDigit;
fragment Digit: [0-9];
fragment HexDigit: [0-9] | [A-F] | [a-f];
fragment Letter: [\p{Lu}\p{Ll}\p{Lt}\p{Lm}\p{Lo}\p{Nl}];
fragment ConnectingChar:  [\p{Pc}];
fragment CombiningChar: [\p{Mn}\p{Mc}];
fragment FormattingChar: [\p{Cf}];
fragment IdentStartChar: Letter | '_';
fragment IdentChar: Letter | Digit | ConnectingChar | CombiningChar | FormattingChar | '\'' | '_';
fragment IdentifierName: IdentStartChar IdentChar*;

// WSx : [ \r\n]+ -> skip;  // just to get some first parse results
WS : [ \r\n]+ -> channel(HIDDEN);  // just to get some first parse results
Comment: '//' ~[\r\n]* -> channel(HIDDEN);


