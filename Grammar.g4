grammar Grammar;
program
   : PROGRAM identifier LEFT_CURLY block RIGHT_CURLY
   ;
identifier
   : IDENT
   ;
block
   : 
   (constantDefinitionPart)? (variableDeclarationPart)? compoundStatement
   ;
compoundStatement
   : MAIN LEFT_CURLY statements RIGHT_CURLY
   ;
statements
   : (statement SEMI)*
   ;
statement
   : assignmentStatement
   | structuredStatement
   ;
structuredStatement
   : ifStatement
   | repetetiveStatement
   ;
assignmentStatement
   : variable ASSIGN expression
   ;
variable
   : identifier
   ;
expression
   : simpleExpression ((EQUAL | NOT_EQUAL | LT | LE | GE | GT) simpleExpression)*
   ;
simpleExpression
   : term ((PLUS | MINUS | OR) term)*
   ;
term
   : signedFactor ((STAR | SLASH | DIV | MOD | AND) signedFactor)*
   ;
signedFactor
   : (PLUS | MINUS)? factor
   ;
factor
   : variable
   | LEFT_PAREN expression RIGHT_PAREN
   | unsignedConstant
   | NOT factor
   ;
unsignedConstant
   : unsignedNumber
   | NULL
   ;
ifStatement
   : IF LEFT_PAREN expression RIGHT_PAREN LEFT_CURLY statements RIGHT_CURLY (ELSE LEFT_CURLY statements RIGHT_CURLY)?
   ;
repetetiveStatement
   : whileStatement
   | forStatement
   ;
whileStatement
   : WHILE expression LEFT_CURLY statements RIGHT_CURLY
   ;
forStatement
   : FOR identifier ASSIGN forList LEFT_CURLY statements RIGHT_CURLY
   ;
forList
   : expression (TO | DOWNTO) expression
   ;
constantDefinitionPart
   : CONST (constantDefinition SEMI)+
   ;
constantDefinition
   : identifier ASSIGN constant
   ;
constant
   : unsignedNumber
   | sign unsignedNumber
   | identifier
   | sign identifier
   ;
type
   : CHAR 
   | BOOLEAN 
   | INT 
   | DOUBLE
   ;
identifierList
   : identifier (COMMA identifier)*
   ;
variableDeclarationPart
   : VAR variableDeclaration (SEMI variableDeclaration)* SEMI
   ;
variableDeclaration
   : identifierList COLON type
   ;
sign
   : PLUS
   | MINUS
   ;
unsignedNumber
   : unsignedInteger
   | unsignedDOUBLE
   ;
unsignedInteger
   : NUM_INT
   ;
unsignedDOUBLE
   : NUM_INT
   ;
fragment A
   : ('a')
   ;
fragment B
   : ('b')
   ;
fragment C
   : ('c')
   ;
fragment D
   : ('d')
   ;
fragment E
   : ('e')
   ;
fragment F
   : ('f')
   ;
fragment G
   : ('g')
   ;
fragment H
   : ('h')
   ;
fragment I
   : ('i')
   ;
fragment J
   : ('j')
   ;
fragment K
   : ('k')
   ;
fragment L
   : ('l')
   ;
fragment M
   : ('m')
   ;
fragment N
   : ('n')
   ;
fragment O
   : ('o')
   ;
fragment P
   : ('p')
   ;
fragment Q
   : ('q')
   ;
fragment R
   : ('r')
   ;
fragment S
   : ('s')
   ;
fragment T
   : ('t')
   ;
fragment U
   : ('u')
   ;
fragment V
   : ('v')
   ;
fragment W
   : ('w')
   ;
fragment X
   : ('x')
   ;
fragment Y
   : ('y')
   ;
fragment Z
   : ('z')
   ;
PROGRAM
   : P R O G R A M
   ;
MAIN
   : M A I N
   ;
VAR
   : V A R
   ;
CHAR
   : C H A R
   ;
BOOLEAN
   : B O O L E A N
   ;
INT
   : I N T
   ;
DOUBLE
   : D O U B L E
   ;
CONST
   : C O N S T
   ;
WHILE
   : W H I L E
   ;
IF
   : I F
   ;
ELSE
   : E L S E
   ;
FOR
   : F O R
   ;
TO
   : T O
   ;
DOWNTO
   : D O W N T O
   ;
DIV
   : D I V
   ;
NULL
   : N U L L
   ;
PLUS
   : '+'
   ;
MINUS
   : '-'
   ;
STAR
   : '*'
   ;
SLASH
   : '/'
   ;
ASSIGN
   : '='
   ;
COMMA
   : ','
   ;
COLON
   : ':'
   ;
SEMI
   : ';'
   ;
EQUAL
   : '=='
   ;
NOT_EQUAL
   : '!='
   ;
LT
   : '<'
   ;
LE
   : '<='
   ;
GE
   : '>='
   ;
GT
   : '>'
   ;
LEFT_PAREN
   : '('
   ;
RIGHT_PAREN
   : ')'
   ;
LEFT_CURLY
   : '{'
   ;
RIGHT_CURLY
   : '}'
   ;
MOD
   : '%'
   ;
NOT
   : '!'
   ;
OR
   : '||'
   ;
AND
   : '&&'
   ;
WS  
   : [ \t\r\n]+ -> skip 
   ;
IDENT
   : ('a' .. 'z' | 'A' .. 'Z') ('a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_')*
   ;
COMMENT_1
   : '/*' .*? '*/' -> skip
   ;
COMMENT_2
   : '//' .*? '\n' -> skip
   ;
NUM_INT
   : ('0' .. '9') + (('.' ('0' .. '9') + (EXPONENT)?)? | EXPONENT)
   ;
fragment EXPONENT
   : ('e') ('+' | '-')? ('0' .. '9') +
   ;
