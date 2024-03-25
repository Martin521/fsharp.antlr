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

// Ident (§3.4)
IDENT: IDENT_TEXT | '``' ( ~[`\n\r\t] | '`' ~[`\n\r\t] )+ '``';
RESERVED_IDENT: IDENT_TEXT [!*];




fragment DIGIT_CHAR: [0-9];
fragment LETTER_CHAR: [\p{Lu}\p{Ll}\p{Lt}\p{Lm}\p{Lo}\p{Nl}];
fragment CONNECTING_CHAR:  [\p{Pc}];
fragment COMBINING_CHAR: [\p{Mn}\p{Mc}];
fragment FORMATTING_CHAR: [\p{Cf}];
fragment IDENT_START_CHAR: LETTER_CHAR | '_';
fragment IDENT_CHAR: LETTER_CHAR | DIGIT_CHAR | CONNECTING_CHAR | COMBINING_CHAR | FORMATTING_CHAR | '\'' | '_';
fragment IDENT_TEXT: IDENT_START_CHAR IDENT_CHAR*;
WS : [ \r\n]+ -> channel(HIDDEN);


