grammar newPascal;


program
   : PROGRAM identifier LEFT_CURLY block RIGHT_CURLY
   ;


block
   : 
	( 
	constantDefinitionPart | 
	typeDefinitionPart | 
	variableDeclarationPart | 
	procedureAndFunctionDeclarationPart
	)* 
	compoundStatement
   ;


statements
   : statement (SEMI statement)*
   ;


statement
   : simpleStatement
   | structuredStatement
   ;


simpleStatement
   : assignmentStatement
   | procedureStatement
   | emptyStatement
   ;


structuredStatement
   : compoundStatement
   | conditionalStatement
   | repetetiveStatement
   ;


compoundStatement
   : LEFT_CURLY statements RIGHT_CURLY
   ;


assignmentStatement
   : variable ASSIGN expression
   ;


variable
   : identifier (LEFT_BRACK expression (COMMA expression)* RIGHT_BRACK)*
   ;


expression
   : simpleExpression ((EQUAL | NOT_EQUAL | LT | LE | GE | GT | IN) simpleExpression)*
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
   | functionDesignator
   | unsignedConstant
   | set
   | NOT factor
   ;


unsignedConstant
   : unsignedNumber
   | string
   | NULL
   ;


functionDesignator
   : identifier LEFT_PAREN parameterList RIGHT_PAREN
   ;


set
   : LEFT_BRACK elementList RIGHT_BRACK
   ;


elementList
   : element (COMMA element)*
   |
   ;


element
   : expression (DOTDOT expression)?
   ;


actualParameter
   : expression
   ;


emptyStatement
   :
   ;


procedureStatement
   : identifier (LEFT_PAREN parameterList RIGHT_PAREN)?
   ;


parameterList
   : actualParameter (COMMA actualParameter)*
   ;


conditionalStatement
   : ifStatement
   | caseStatement
   ;


ifStatement
   : IF LEFT_PAREN expression RIGHT_PAREN LEFT_CURLY statement RIGHT_CURLY (: ELSE statement)?
   | IF LEFT_PAREN expression RIGHT_PAREN statement (: ELSE statement)?
   ;


caseStatement
   : CASE expression LEFT_CURLY caseListElement (SEMI caseListElement)* (SEMI ELSE statements)? RIGHT_CURLY
   ;


caseListElement
   : constList COLON statement
   ;


repetetiveStatement
   : whileStatement
   | doWhileStatement
   | forStatement
   ;


whileStatement
   : WHILE expression DO statement
   ;


doWhileStatement
   : DO statements WHILE expression
   ;


forStatement
   : FOR identifier ASSIGN forList DO statement
   ;


forList
   : initialValue (TO | DOWNTO) finalValue
   ;


initialValue
   : expression
   ;


finalValue
   : expression
   ;


constantDefinitionPart
   : CONST (constantDefinition SEMI)+
   ;


constantDefinition
   : identifier EQUAL constant
   ;


constant
   : unsignedNumber
   | sign unsignedNumber
   | identifier
   | sign identifier
   | string
   ;


constList
   : constant (COMMA constant)*
   ;


typeDefinitionPart
   : TYPE (typeDefinition SEMI)+
   ;


typeDefinition
   : identifier EQUAL (type | functionType | procedureType)
   ;


functionType
   : FUNCTION (formalParameterList)? COLON resultType
   ;


procedureType
   : PROCEDURE (formalParameterList)?
   ;


type
   : simpleType
   | arrayType
   ;


simpleType
   : scalarType
   | subrangeType
   | typeIdentifier
   | stringtype
   ;


arrayType
   : ARRAY LEFT_BRACK typeList RIGHT_BRACK COLON type
   ;


typeList
   : indexType (COMMA indexType)*
   ;


indexType
   : simpleType
   ;


scalarType
   : LEFT_PAREN identifierList RIGHT_PAREN
   ;


stringtype
   : STRING LEFT_BRACK (identifier | unsignedNumber) RIGHT_BRACK
   ;


subrangeType
   : constant DOTDOT constant
   ;


formalParameterList
   : LEFT_PAREN formalParameterSection (SEMI formalParameterSection)* RIGHT_PAREN
   ;


formalParameterSection
   : parameterGroup
   | VAR parameterGroup
   | FUNCTION parameterGroup
   | PROCEDURE parameterGroup
   ;


resultType
   : typeIdentifier
   ;


parameterGroup
   : identifierList COLON typeIdentifier
   ;


identifierList
   : identifier (COMMA identifier)*
   ;


typeIdentifier
   : identifier
   | (CHAR | BOOLEAN | INTEGER | REAL | STRING)
   ;


variableDeclarationPart
   : VAR variableDeclaration (SEMI variableDeclaration)* SEMI
   ;


variableDeclaration
   : identifierList COLON type
   ;


procedureAndFunctionDeclarationPart
   : procedureOrFunctionDeclaration SEMI
   ;


procedureOrFunctionDeclaration
   : procedureDeclaration
   | functionDeclaration
   ;


procedureDeclaration
   : PROCEDURE identifier (formalParameterList)? SEMI block
   ;


functionDeclaration
   : FUNCTION identifier (formalParameterList)? COLON resultType SEMI block
   ;


identifier
   : IDENT
   ;


sign
   : PLUS
   | MINUS
   ;


string
   : STRING_LITERAL
   ;


unsignedNumber
   : unsignedInteger
   | unsignedReal
   ;


unsignedInteger
   : NUM_INT
   ;


unsignedReal
   : NUM_INT
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


LEFT_BRACK
   : '['
   ;


RIGHT_BRACK
   : ']'
   ;


LEFT_CURLY
   : '{'
   ;


RIGHT_CURLY
   : '}'
   ;


DOT
   : '.'
   ;


DOTDOT
   : '..'
   ;


IDENT
   : ('a' .. 'z' | 'A' .. 'Z') ('a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_')*
   ;


STRING_LITERAL
   : '\'' ('\'\'' | ~ ('\''))* '\''
   ;


NUM_INT
   : ('0' .. '9') + (('.' ('0' .. '9') + (EXPONENT)?)? | EXPONENT)
   ;

PROGRAM
   : P R O G R A M
   ;


FUNCTION
   : F U N C T I O N
   ;


PROCEDURE
   : P R O C E D U R E
   ;


RETURN
   : R E T U R N
   ;


TYPE
   : T Y P E
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


INTEGER
   : I N T E G E R
   ;


REAL
   : R E A L
   ;


STRING
   : S T R I N G
   ;


ARRAY
   : A R R A Y
   ;


CONST
   : C O N S T
   ;


DO
   : D O
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


IN
   : I N
   ;


TO
   : T O
   ;


DOWNTO
   : D O W N T O
   ;


SWITCH
   : S W I T C H
   ;


CASE
   : C A S E
   ;


DEFAULT
   : D E F A U L T
   ;


MOD
   : '%'
   ;


DIV
   : D I V
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


NULL
   : N U L L
   ;


WHITESPACE
   : [ \t\r\n] -> skip
   ;


COMMENT_1
   : '/*' .*? '*/' -> skip
   ;


COMMENT_2
   : '//' .*? '\n' -> skip
   ;


fragment EXPONENT
   : ('e') ('+' | '-')? ('0' .. '9') +
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





