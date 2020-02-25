lexer grammar IsObjectScriptLexer;

channels { COMMENTS_CHANNEL }

// abcdefghjklmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ
fragment A: ('A' | 'a');
fragment B: ('B' | 'b');
fragment C: ('C' | 'c');
fragment D: ('D' | 'd');
fragment E: ('E' | 'e');
fragment F: ('F' | 'f');
fragment G: ('G' | 'g');
fragment H: ('H' | 'h');
fragment I: ('I' | 'i');
fragment J: ('J' | 'j');
fragment K: ('K' | 'k');
fragment L: ('L' | 'l');
fragment M: ('M' | 'm');
fragment N: ('N' | 'n');
fragment O: ('O' | 'o');
fragment P: ('P' | 'p');
fragment Q: ('Q' | 'q');
fragment R: ('R' | 'r');
fragment S: ('S' | 's');
fragment T: ('T' | 't');
fragment U: ('U' | 'u');
fragment V: ('V' | 'v');
fragment W: ('W' | 'w');
fragment X: ('X' | 'x');
fragment Y: ('Y' | 'y');
fragment Z: ('Z' | 'z');

fragment F_LOWERCASE: [a-z];
fragment F_UPPERCASE: [A-Z];

// 0123456789
fragment F_DIGIT: [0-9];

// !@#$%^&*-+=<>|?_,./\~:;"'[]{}()
fragment FP_EXCLAMATION_MARK: '!';
fragment FP_AT: '@';
fragment FP_POUND_SIGN: '#';
fragment FP_DOLLAR_SIGN: '$';
fragment FP_PERCENT_SIGN: '%';
fragment FP_CARET: '^';
fragment FP_AMPERSAND: '&';
fragment FP_ASTERISK: '*';
fragment FP_MINUS_SIGN: '-';
fragment FP_PLUS_SIGN: '+';
fragment FP_EQUAL_SIGN: '=';
fragment FP_LESS_THAN: '<';
fragment FP_GREATER_THAN: '>';
fragment FP_VERTICAL_BAR: '|';
fragment FP_QUESTION_MARK: '?';
fragment FP_COMMA: ',';
fragment FP_DOT: '.';
fragment FP_UNDESCORE: '_';
fragment FP_SLASH: '/';
fragment FP_BACKSLASH: '\\';
fragment FP_TILDA: '~';
fragment FP_COLON: ':';
fragment FP_SEMICOLON: ';';
fragment FP_QUOTES: '"';
fragment FP_APOSTROPHE: '\'';
fragment FP_OPEN_SQUARE_BRACKET: '[';
fragment FP_CLOSE_SQUARE_BRACKET: ']';
fragment FP_OPEN_BRACE: '{';
fragment FP_CLOSE_BRACE: '}';
fragment FP_OPEN_PARENTHESIS: '(';
fragment FP_CLOSE_PARENTHESIS: ')';

fragment ExponentPart:
	E (FP_MINUS_SIGN | FP_PLUS_SIGN)? F_DIGIT+;
fragment InputCharacter: ~[\r\n\u0085\u2028\u2029];

fragment ANY_CHAR: .;
fragment CHAR: (F_LOWERCASE | F_UPPERCASE);
//WS :	' ' -> channel(HIDDEN);
WHITESPACE: (' ' | '\t') -> channel(HIDDEN);
NEWLINE: ('\r'? '\n' | '\r')+ -> channel(HIDDEN);

SINGLE_LINE_DOC_COMMENT: '///' InputCharacter*    -> channel(COMMENTS_CHANNEL);
SINGLE_LINE_COMMENT:     '//'  InputCharacter*    -> channel(COMMENTS_CHANNEL);
DELIMITED_COMMENT:       '/*'  .*? '*/'           -> channel(COMMENTS_CHANNEL);

ESQL
    : '&sql(' ->pushMode(SQL_QUERY)
    ;

OPEN_BRACE: FP_OPEN_BRACE;
CLOSE_BRACE: FP_CLOSE_BRACE;
OPEN_PARENTHESIS: FP_OPEN_PARENTHESIS;
CLOSE_PARENTHESIS: FP_CLOSE_PARENTHESIS;
OPEN_SQUARE_BRACKET: FP_OPEN_SQUARE_BRACKET;
CLOSE_SQUARE_BRACKET: FP_CLOSE_SQUARE_BRACKET;

P_DOT: FP_DOT;
P_COMMA: FP_COMMA;
P_CARET: FP_CARET;
P_EQUAL_SIGN: FP_EQUAL_SIGN;
P_SEMICOLON: FP_SEMICOLON;
P_COLON: FP_COLON;
P_UNDESCORE: FP_UNDESCORE;
P_EXCLAMATION_MARK: FP_EXCLAMATION_MARK;
P_POUND_SIGN: FP_POUND_SIGN;
P_MINUS_SIGN: FP_MINUS_SIGN;
P_PLUS_SIGN: FP_PLUS_SIGN;
P_SLASH: FP_SLASH;
P_PERCENT_SIGN: FP_PERCENT_SIGN;
P_ASTERISK: FP_ASTERISK;
P_VERTICAL_BAR: FP_VERTICAL_BAR;
P_APOSTROPHE: FP_APOSTROPHE;

ClassInvocation: P_POUND_SIGN P_POUND_SIGN C L A S S;
DoublePeriod: P_DOT P_DOT;
TripplePeriod: P_DOT P_DOT P_DOT;
UserFunctionCallPrefix: FP_DOLLAR_SIGN FP_DOLLAR_SIGN;
MacroInvocationPrefix: FP_DOLLAR_SIGN FP_DOLLAR_SIGN FP_DOLLAR_SIGN;

ExponentiationOperator: FP_ASTERISK FP_ASTERISK;

// Logical operators
// '& (Not And), '| (Not Or); relational operators '= (not equal to), '< (not less than), '> (not greater than)
LO_NotAnd: FP_APOSTROPHE FP_AMPERSAND;
LO_NotOr: FP_APOSTROPHE FP_VERTICAL_BAR;
LO_NotEqual: FP_APOSTROPHE FP_EQUAL_SIGN;
LO_NotLessThan: FP_APOSTROPHE FP_LESS_THAN;
LO_NotGreatherThan: FP_APOSTROPHE FP_GREATER_THAN;
/*
<	Less than (60): Less than operator.
<=	Less than, Equal sign: Less than or equal to operator.
=	Equal sign (61): Equal to comparison operator.
>	Greater than (62): Greater than operator.
>=	Greater than, Equal sign: Greater than or equal to operator.
*/
LO_LessThan: FP_LESS_THAN;
LO_GreatherThan: FP_GREATER_THAN;
LO_LessThanEqual: FP_LESS_THAN FP_EQUAL_SIGN;
LO_GreatherThanEqual: FP_GREATER_THAN FP_EQUAL_SIGN;
LO_BitwiseAnd: FP_AMPERSAND;
LO_And: FP_AMPERSAND FP_AMPERSAND;
LO_Or: FP_VERTICAL_BAR FP_VERTICAL_BAR;

// Common keywords
On: O N;
As: A S;
Of: O F;
List: L I S T;
Array: A R R A Y;
ByRef: B Y R E F;
Output: O U T P U T;

// RCOS_FUNCTIONS href = DocBook.UI.Page.cls?KEY=RCOS_FUNCTIONS
F_ASCII: FP_DOLLAR_SIGN  ((A S C I I) | (A));
F_BIT: FP_DOLLAR_SIGN  B I T;
F_BITCOUNT: FP_DOLLAR_SIGN  B I T C O U N T;
F_BITFIND: FP_DOLLAR_SIGN  B I T F I N D;
F_BITLOGIC: FP_DOLLAR_SIGN  B I T L O G I C;
F_CASE: FP_DOLLAR_SIGN  C A S E;
F_CHAR: FP_DOLLAR_SIGN  ((C H A R) | (C));
F_CLASSMETHOD: FP_DOLLAR_SIGN  C L A S S M E T H O D;
F_CLASSNAME: FP_DOLLAR_SIGN  C L A S S N A M E;
F_COMPILE: FP_DOLLAR_SIGN  C O M P I L E;
F_DATA: FP_DOLLAR_SIGN  ((D A T A) | (D));
F_DECIMAL: FP_DOLLAR_SIGN  D E C I M A L;
F_DOUBLE: FP_DOLLAR_SIGN  D O U B L E;
F_EXTRACT: FP_DOLLAR_SIGN  ((E X T R A C T) | (E));
F_FACTOR: FP_DOLLAR_SIGN  F A C T O R;
F_FIND: FP_DOLLAR_SIGN  ((F I N D) | (F));
F_FNUMBER: FP_DOLLAR_SIGN  ((F N U M B E R) | (F N));
F_GET: FP_DOLLAR_SIGN  ((G E T) | (G));
F_INCREMENT: FP_DOLLAR_SIGN  ((I N C R E M E N T) | (I));
F_INUMBER: FP_DOLLAR_SIGN  ((I N U M B E R) | (I N));
F_ISOBJECT: FP_DOLLAR_SIGN  I S O B J E C T;
F_ISVALIDDOUBLE: FP_DOLLAR_SIGN  I S V A L I D D O U B L E;
F_ISVALIDNUM: FP_DOLLAR_SIGN  I S V A L I D N U M;
F_JUSTIFY: FP_DOLLAR_SIGN  ((J U S T I F Y) | (J));
F_LENGTH: FP_DOLLAR_SIGN  ((L E N G T H) | (L));
F_LIST: FP_DOLLAR_SIGN  ((L I S T) | (L I));
F_LISTBUILD: FP_DOLLAR_SIGN  ((L I S T B U I L D) | (L B));
F_LISTDATA: FP_DOLLAR_SIGN  ((L I S T D A T A) | (L D));
F_LISTFIND: FP_DOLLAR_SIGN  ((L I S T F I N D) | (L F));
F_LISTFROMSTRING: FP_DOLLAR_SIGN  ((L I S T F R O M S T R I N G) | (L F S));
F_LISTGET: FP_DOLLAR_SIGN  ((L I S T G E T) | (L G));
F_LISTLENGTH: FP_DOLLAR_SIGN  ((L I S T L E N G T H) | (L L));
F_LISTNEXT: FP_DOLLAR_SIGN  L I S T N E X T;
F_LISTSAME: FP_DOLLAR_SIGN  ((L I S T S A M E) | (L S));
F_LISTTOSTRING: FP_DOLLAR_SIGN  ((L I S T T O S T R I N G) | (L T S));
F_LISTUPDATE: FP_DOLLAR_SIGN  ((L I S T U P D A T E) | (L U));
F_LISTVALID: FP_DOLLAR_SIGN  ((L I S T V A L I D) | (L V));
F_LOCATE: FP_DOLLAR_SIGN  L O C A T E;
F_MATCH: FP_DOLLAR_SIGN  M A T C H;
F_METHOD: FP_DOLLAR_SIGN  M E T H O D;
F_NAME: FP_DOLLAR_SIGN  ((N A M E) | (N A));
F_NCONVERT: FP_DOLLAR_SIGN  ((N C O N V E R T) | (N C));
F_NEXT: FP_DOLLAR_SIGN  ((N E X T) | (N));
F_NORMALIZE: FP_DOLLAR_SIGN  N O R M A L I Z E;
F_NOW: FP_DOLLAR_SIGN  N O W;
F_NUMBER: FP_DOLLAR_SIGN  ((N U M B E R) | (N U M));
F_ORDER: FP_DOLLAR_SIGN  ((O R D E R) | (O));
F_PARAMETER: FP_DOLLAR_SIGN  P A R A M E T E R;
F_PIECE: FP_DOLLAR_SIGN  ((P I E C E) | (P));
F_PREFETCHOFF: FP_DOLLAR_SIGN  P R E F E T C H O F F;
F_PREFETCHON: FP_DOLLAR_SIGN  P R E F E T C H O N;
F_PROPERTY: FP_DOLLAR_SIGN  P R O P E R T Y;
F_QLENGTH: FP_DOLLAR_SIGN  ((Q L E N G T H) | (Q L));
F_QSUBSCRIPT: FP_DOLLAR_SIGN  ((Q S U B S C R I P T) | (Q S));
F_QUERY: FP_DOLLAR_SIGN  ((Q U E R Y) | (Q));
F_RANDOM: FP_DOLLAR_SIGN  ((R A N D O M) | (R));
F_REPLACE: FP_DOLLAR_SIGN  R E P L A C E;
F_REVERSE: FP_DOLLAR_SIGN  ((R E V E R S E) | (R E));
F_SCONVERT: FP_DOLLAR_SIGN  ((S C O N V E R T) | (S C));
F_SELECT: FP_DOLLAR_SIGN  ((S E L E C T) | (S));
F_SEQUENCE: FP_DOLLAR_SIGN  ((S E Q U E N C E) | (S E Q));
F_SORTBEGIN: FP_DOLLAR_SIGN  S O R T B E G I N;
F_SORTEND: FP_DOLLAR_SIGN  S O R T E N D;
F_STACK: FP_DOLLAR_SIGN  ((S T A C K) | (S T));
F_TEXT: FP_DOLLAR_SIGN  ((T E X T) | (T));
F_TRANSLATE: FP_DOLLAR_SIGN  ((T R A N S L A T E) | (T R));
F_VIEW: FP_DOLLAR_SIGN  ((V I E W) | (V));
F_WASCII: FP_DOLLAR_SIGN  ((W A S C I I) | (W A));
F_WCHAR: FP_DOLLAR_SIGN  ((W C H A R) | (W C));
F_WEXTRACT: FP_DOLLAR_SIGN  ((W E X T R A C T) | (W E));
F_WFIND: FP_DOLLAR_SIGN  ((W F I N D) | (W F));
F_WISWIDE: FP_DOLLAR_SIGN  W I S W I D E;
F_WLENGTH: FP_DOLLAR_SIGN  ((W L E N G T H) | (W L));
F_WREVERSE: FP_DOLLAR_SIGN  ((W R E V E R S E) | (W R E));
F_XECUTE: FP_DOLLAR_SIGN  X E C U T E;
F_ZABS: FP_DOLLAR_SIGN  Z A B S;
F_ZARCCOS: FP_DOLLAR_SIGN  Z A R C C O S;
F_ZARCSIN: FP_DOLLAR_SIGN  Z A R C S I N;
F_ZARCTAN: FP_DOLLAR_SIGN  Z A R C T A N;
F_ZBOOLEAN: FP_DOLLAR_SIGN  ((Z B O O L E A N) | (Z B));
F_ZCONVERT: FP_DOLLAR_SIGN  ((Z C O N V E R T) | (Z C V T));
F_ZCOS: FP_DOLLAR_SIGN  Z C O S;
F_ZCOT: FP_DOLLAR_SIGN  Z C O T;
F_ZCRC: FP_DOLLAR_SIGN  Z C R C;
F_ZCSC: FP_DOLLAR_SIGN  Z C S C;
F_ZCYC: FP_DOLLAR_SIGN  ((Z C Y C) | (Z C));
F_ZDASCII: FP_DOLLAR_SIGN  ((Z D A S C I I) | (Z D A));
F_ZDATE: FP_DOLLAR_SIGN  ((Z D A T E) | (Z D));
F_ZDATEH: FP_DOLLAR_SIGN  ((Z D A T E H) | (Z D H));
F_ZDATETIME: FP_DOLLAR_SIGN  ((Z D A T E T I M E) | (Z D T));
F_ZDATETIMEH: FP_DOLLAR_SIGN  ((Z D A T E T I M E H) | (Z D T H));
F_ZDCHAR: FP_DOLLAR_SIGN  ((Z D C H A R) | (Z D C));
F_ZEXP: FP_DOLLAR_SIGN  Z E X P;
F_ZF: FP_DOLLAR_SIGN  ((Z F) | (Z F));
F_ZHEX: FP_DOLLAR_SIGN  ((Z H E X) | (Z H));
F_ZISWIDE: FP_DOLLAR_SIGN  Z I S W I D E;
F_ZLASCII: FP_DOLLAR_SIGN  ((Z L A S C I I) | (Z L A));
F_ZLCHAR: FP_DOLLAR_SIGN  ((Z L C H A R) | (Z L C));
F_ZLN: FP_DOLLAR_SIGN  Z L N;
F_ZLOG: FP_DOLLAR_SIGN  Z L O G;
F_ZNAME: FP_DOLLAR_SIGN  Z N A M E;
F_ZPOSITION: FP_DOLLAR_SIGN  Z P O S I T I O N;
F_ZPOWER: FP_DOLLAR_SIGN  Z P O W E R;
F_ZQASCII: FP_DOLLAR_SIGN  ((Z Q A S C I I) | (Z Q A));
F_ZQCHAR: FP_DOLLAR_SIGN  ((Z Q C H A R) | (Z Q C));
F_ZSEARCH: FP_DOLLAR_SIGN  ((Z S E A R C H) | (Z S E));
F_ZSEC: FP_DOLLAR_SIGN  Z S E C;
F_ZSEEK: FP_DOLLAR_SIGN  Z S E E K;
F_ZSIN: FP_DOLLAR_SIGN  Z S I N;
F_ZSQR: FP_DOLLAR_SIGN  Z S Q R;
F_ZSTRIP: FP_DOLLAR_SIGN  Z S T R I P;
F_ZTAN: FP_DOLLAR_SIGN  Z T A N;
F_ZTIME: FP_DOLLAR_SIGN  ((Z T I M E) | (Z T));
F_ZTIMEH: FP_DOLLAR_SIGN  ((Z T I M E H) | (Z T H));
F_ZVERSION: FP_DOLLAR_SIGN  Z V E R S I O N;
F_ZWASCII: FP_DOLLAR_SIGN  ((Z W A S C I I) | (Z W A));
F_ZWCHAR: FP_DOLLAR_SIGN  ((Z W C H A R) | (Z W C));
F_ZWIDTH: FP_DOLLAR_SIGN  Z W I D T H;
F_ZWPACK: FP_DOLLAR_SIGN  Z W P A C K;
F_ZWBPACK: FP_DOLLAR_SIGN  Z W B P A C K;
F_ZWUNPACK: FP_DOLLAR_SIGN  Z W U N P A C K;
F_ZWBUNPACK: FP_DOLLAR_SIGN  Z W B U N P A C K;
F_ZZENKAKU: FP_DOLLAR_SIGN  Z Z E N K A K U;

// RCOS_COMMANDS href = DocBook.UI.Page.cls?KEY=RCOS_COMMANDS
C_BREAK:  ((B R E A K) | (B));
C_CATCH:  C A T C H;
C_CLOSE:  ((C L O S E) | (C));
C_CONTINUE:  C O N T I N U E;
C_DO:  ((D O) | (D));
//C_DO WHILE:  ((D O   W H I L E) | (D));
C_ELSE:  E L S E;
C_ELSEIF:  E L S E I F;
C_FOR:  ((F O R) | (F));
C_GOTO:  ((G O T O) | (G));
C_HALT:  ((H A L T) | (H));
C_HANG:  ((H A N G) | (H));
C_IF:  ((I F) | (I));
C_JOB:  ((J O B) | (J));
C_KILL:  ((K I L L) | (K));
C_LOCK:  ((L O C K) | (L));
C_MERGE:  ((M E R G E) | (M));
C_NEW:  ((N E W) | (N));
C_OPEN:  ((O P E N) | (O));
C_QUIT:  ((Q U I T) | (Q));
C_READ:  ((R E A D) | (R));
C_RETURN:  ((R E T U R N) | (R E T));
C_SET:  ((S E T) | (S));
C_TCOMMIT:  ((T C O M M I T) | (T C));
C_THROW:  T H R O W;
C_TROLLBACK:  ((T R O L L B A C K) | (T R O));
C_TRY:  T R Y;
C_TSTART:  ((T S T A R T) | (T S));
C_USE:  ((U S E) | (U));
C_VIEW:  ((V I E W) | (V));
C_WHILE:  W H I L E;
C_WRITE:  ((W R I T E) | (W));
C_XECUTE:  ((X E C U T E) | (X));
C_ZKILL:  ((Z K I L L) | (Z K));
C_ZNSPACE:  ((Z N S P A C E) | (Z N));
C_ZTRAP:  Z T R A P;
C_ZWRITE:  ((Z W R I T E) | (Z W));
C_ZZDUMP:  Z Z D U M P;
C_ZZWRITE:  Z Z W R I T E;

// RCOS_SVARIABLES href = DocBook.UI.Page.cls?KEY=RCOS_SVARIABLES
SSV_GLOBAL: FP_CARET FP_DOLLAR_SIGN  ((G L O B A L) | (G));
SSV_JOB: FP_CARET FP_DOLLAR_SIGN  ((J O B) | (J));
SSV_LOCK: FP_CARET FP_DOLLAR_SIGN  ((L O C K) | (L));
SSV_ROUTINE: FP_CARET FP_DOLLAR_SIGN  ((R O U T I N E) | (R));

// RCOS_VARIABLES href = DocBook.UI.Page.cls?KEY=RCOS_VARIABLES
F_DEVICE: FP_DOLLAR_SIGN  ((D E V I C E) | (D));
F_ECODE: FP_DOLLAR_SIGN  ((E C O D E) | (E C));
F_ESTACK: FP_DOLLAR_SIGN  ((E S T A C K) | (E S));
F_ETRAP: FP_DOLLAR_SIGN  ((E T R A P) | (E T));
F_HALT: FP_DOLLAR_SIGN  H A L T;
F_HOROLOG: FP_DOLLAR_SIGN  ((H O R O L O G) | (H));
F_IO: FP_DOLLAR_SIGN  ((I O) | (I));
F_JOB: FP_DOLLAR_SIGN  ((J O B) | (J));
F_KEY: FP_DOLLAR_SIGN  ((K E Y) | (K));
F_NAMESPACE: FP_DOLLAR_SIGN  N A M E S P A C E;
F_PRINCIPAL: FP_DOLLAR_SIGN  ((P R I N C I P A L) | (P));
F_QUIT: FP_DOLLAR_SIGN  ((Q U I T) | (Q));
F_ROLES: FP_DOLLAR_SIGN  R O L E S;
//F_STACK: FP_DOLLAR_SIGN  ((S T A C K) | (S T));
F_STORAGE: FP_DOLLAR_SIGN  ((S T O R A G E) | (S));
F_SYSTEM: FP_DOLLAR_SIGN  ((S Y S T E M) | (S Y));
F_TEST: FP_DOLLAR_SIGN  ((T E S T) | (T));
F_THIS: FP_DOLLAR_SIGN  T H I S;
F_THROWOBJ: FP_DOLLAR_SIGN  T H R O W O B J;
F_TLEVEL: FP_DOLLAR_SIGN  ((T L E V E L) | (T L));
F_USERNAME: FP_DOLLAR_SIGN  U S E R N A M E;
F_X: FP_DOLLAR_SIGN  ((X) | (X));
F_Y: FP_DOLLAR_SIGN  ((Y) | (Y));
F_ZA: FP_DOLLAR_SIGN  ((Z A) | (Z A));
F_ZB: FP_DOLLAR_SIGN  ((Z B) | (Z B));
F_ZCHILD: FP_DOLLAR_SIGN  ((Z C H I L D) | (Z C));
F_ZEOF: FP_DOLLAR_SIGN  Z E O F;
F_ZEOS: FP_DOLLAR_SIGN  Z E O S;
F_ZERROR: FP_DOLLAR_SIGN  ((Z E R R O R) | (Z E));
F_ZHOROLOG: FP_DOLLAR_SIGN  ((Z H O R O L O G) | (Z H));
F_ZIO: FP_DOLLAR_SIGN  ((Z I O) | (Z I));
F_ZJOB: FP_DOLLAR_SIGN  ((Z J O B) | (Z J));
F_ZMODE: FP_DOLLAR_SIGN  ((Z M O D E) | (Z M));
//F_ZNAME: FP_DOLLAR_SIGN  ((Z N A M E) | (Z N));
F_ZNSPACE: FP_DOLLAR_SIGN  Z N S P A C E;
F_ZORDER: FP_DOLLAR_SIGN  ((Z O R D E R) | (Z O));
F_ZPARENT: FP_DOLLAR_SIGN  ((Z P A R E N T) | (Z P));
F_ZPI: FP_DOLLAR_SIGN  Z P I;
F_ZPOS: FP_DOLLAR_SIGN  Z P O S;
F_ZREFERENCE: FP_DOLLAR_SIGN  ((Z R E F E R E N C E) | (Z R));
F_ZSTORAGE: FP_DOLLAR_SIGN  ((Z S T O R A G E) | (Z S));
F_ZTIMESTAMP: FP_DOLLAR_SIGN  ((Z T I M E S T A M P) | (Z T S));
F_ZTIMEZONE: FP_DOLLAR_SIGN  ((Z T I M E Z O N E) | (Z T Z));
F_ZTRAP: FP_DOLLAR_SIGN  ((Z T R A P) | (Z T));
//F_ZVERSION: FP_DOLLAR_SIGN  ((Z V E R S I O N) | (Z V));

// RCOS_MULTIVALUE href = DocBook.UI.Page.cls?KEY=RCOS_MULTIVALUE
F_CHANGE: FP_DOLLAR_SIGN  C H A N G E;
F_MV: FP_DOLLAR_SIGN  M V;
F_MVAT: FP_DOLLAR_SIGN  M V A T;
F_MVFMT: FP_DOLLAR_SIGN  M V F M T;
F_MVFMTS: FP_DOLLAR_SIGN  M V F M T S;
F_MVICONV: FP_DOLLAR_SIGN  M V I C O N V;
F_MVICONVS: FP_DOLLAR_SIGN  M V I C O N V S;
F_MVINMAT: FP_DOLLAR_SIGN  M V I N M A T;
F_MVLOWER: FP_DOLLAR_SIGN  M V L O W E R;
F_MVOCONV: FP_DOLLAR_SIGN  M V O C O N V;
F_MVOCONVS: FP_DOLLAR_SIGN  M V O C O N V S;
F_MVRAISE: FP_DOLLAR_SIGN  M V R A I S E;
F_MVTRANS: FP_DOLLAR_SIGN  M V T R A N S;
C_MV:  M V;
C_MVCALL:  M V C A L L;
C_MVCRT:  ((M V C R T) | (M V C));
C_MVDIM:  M V D I M;
C_MVPRINT:  ((M V P R I N T) | (M V P));


// Reference A: Class Definitions
Class: C L A S S;
Extends: E X T E N D S;
Parameter: P A R A M E T E R;
Property: P R O P E R T Y;
ForeignKey: F O R E I G N K E Y;
Index: I N D E X;
Method: M E T H O D;
ClassMethod: C L A S S M E T H O D;
ClientMethod: C L I E N T M E T H O D;
Projection: P R O J E C T I O N;
Relationship: R E L A T I O N S H I P;
Query: Q U E R Y;
Trigger: T R I G G E R;
XData: X D A T A ;
Import: I M P O R T;
Include: I N C L U D E;
IncludeGenerator: I N C L U D E G E N E R A T O R;

// Reference B: Class Keywords
Abstract: 'Abstract';
ClassType: 'ClassType';
ClientDataType: 'ClientDataType';
ClientName: 'ClientName';
CompileAfter: 'CompileAfter';
DdlAllowed: 'DdlAllowed';
DependsOn: 'DependsOn';
Deprecated: 'Deprecated';
Final: 'Final';
GeneratedBy: 'GeneratedBy';
Hidden: 'Hidden';
Inheritance: 'Inheritance';
Language: 'Language';
LegacyInstanceContext: 'LegacyInstanceContext';
NoExtent: 'NoExtent';
OdbcType: 'OdbcType';
Owner: 'Owner';
ProcedureBlock: 'ProcedureBlock';
PropertyClass: 'PropertyClass';
ServerOnly: 'ServerOnly';
SoapBindingStyle: 'SoapBindingStyle';
SoapBodyUse: 'SoapBodyUse';
SqlCategory: 'SqlCategory';
SqlRowIdName: 'SqlRowIdName';
SqlRowIdPrivate: 'SqlRowIdPrivate';
SqlTableName: 'SqlTableName';
StorageStrategy: 'StorageStrategy';
System: 'System';
ViewQuery: 'ViewQuery';

// Reference C: Foreign Key Keywords
Internal: 'Internal';
NoCheck: 'NoCheck';
OnDelete: 'OnDelete';
OnUpdate: 'OnUpdate';
SqlName: 'SqlName';

// Reference D: Index Keywords
Condition: 'Condition';
Data: 'Data';
Extent: 'Extent';
IdKey: 'IdKey';
//Internal: '';
PrimaryKey: 'PrimaryKey';
//SqlName: '';
Type: 'Type';
Unique: 'Unique';

// Reference E: Method Keywords
//Abstract: '';
//ClientName: '';
CodeMode: 'CodeMode';
//Deprecated: '';
ExternalProcName: 'ExternalProcName';
//Final: '';
ForceGenerate: 'ForceGenerate';
GenerateAfter: 'GenerateAfter';
//Internal: '';
//Language: '';
NotInheritable: 'NotInheritable';
PlaceAfter: 'PlaceAfter';
Private: 'Private';
//ProcedureBlock: '';
PublicList: 'PublicList';
ReturnResultsets: 'ReturnResultsets';
//ServerOnly: '';
SoapAction: 'SoapAction';
//SoapBindingStyle: '';
//SoapBodyUse: '';
SoapMessageName: 'SoapMessageName';
SoapNameSpace: 'SoapNameSpace';
SoapRequestMessage: 'SoapRequestMessage';
SoapTypeNameSpace: 'SoapTypeNameSpace';
//SqlName: '';
SqlProc: 'SqlProc';
WebMethod: 'WebMethod';
ZenMethod: 'ZenMethod';

// Reference F: Parameter Keywords
//Abstract: '';
Constraint: 'Constraint';
//Deprecated: '';
//Final: '';
Flags: 'Flags';
//Internal: '';

// Reference G: Projection Keywords
//Internal: '';

// Reference H: Property Keywords
Aliases: 'Aliases';
Calculated: 'Calculated';
Cardinality: 'Cardinality';
//ClientName: '';
Collection: 'Collection';
//Deprecated: '';
//Final: '';
Identity: 'Identity';
InitialExpression: 'InitialExpression';
//Internal: '';
Inverse: 'Inverse';
MultiDimensional: 'MultiDimensional';
//OnDelete: '';
//Private: '';
ReadOnly: 'ReadOnly';
Required: 'Required';
//ServerOnly: '';
SqlColumnNumber: 'SqlColumnNumber';
SqlComputeCode: 'SqlComputeCode';
SqlComputed: 'SqlComputed';
SqlComputeOnChange: 'SqlComputeOnChange';
SqlFieldName: 'SqlFieldName';
SqlListDelimiter: 'SqlListDelimiter';
SqlListType: 'SqlListType';
Transient: 'Transient';

// Reference I: Query Keywords
//ClientName: '';
//Final: '';
//Internal: '';
//Private: '';
//SoapBindingStyle: '';
//SoapBodyUse: '';
//SoapNameSpace: '';
//SqlName: '';
//SqlProc: '';
SqlView: 'SqlView';
SqlViewName: 'SqlViewName';
//WebMethod: '';

// Reference J: Trigger Keywords
//CodeMode: '';
Event: 'Event';
//Final: '';
Foreach: 'Foreach';
//Internal: '';
//Language: '';
NewTable: 'NewTable';
OldTable: 'OldTable';
Order: 'Order';
//SqlName: '';
Time: 'Time';
UpdateColumnList: 'UpdateColumnList';

// Reference K: XData Keywords
//Internal: '';
MimeType: 'MimeType';
SchemaSpec: 'SchemaSpec';
XMLNamespace: 'XMLNamespace';

// Reference L: Storage Keywords
DataLocation: 'DataLocation';
DefaultData: 'DefaultData';
//Final: '';
IdLocation: 'IdLocation';
IndexLocation: 'IndexLocation';
//SqlRowIdName: '';
SqlRowIdProperty: 'SqlRowIdProperty';
SqlTableNumber: 'SqlTableNumber';
State: 'State';
StreamLocation: 'StreamLocation';
//Type: '';

Storage: 'Storage';
VAR_DECLARATION: FP_POUND_SIGN D I M;

// identifers
IDENTIFIER: FP_PERCENT_SIGN? CHAR (CHAR | F_DIGIT)*;

// Numeric Literals
INTEGER_LITERAL: F_DIGIT+;
REAL_LITERAL: F_DIGIT* FP_DOT [0-9]+ ExponentPart?;

QUOTED_STRING : FP_QUOTES ('""' | ~'"')* FP_QUOTES;

mode EMBEDDED_SQL;
SQL_E_CLOSE_PARENS: ')' -> popMode;
SQL_E_OPEN_PARENS: '(' -> pushMode(SQL_QUERY);
mode SQL_QUERY;
SQL_CLOSE_PARENS: ')' -> popMode;
SQL_OPEN_PARENS: '(' -> pushMode(SQL_QUERY);
SQL_WHITESPACE: (' ' | '\t') -> channel(HIDDEN);
SQL_NEWLINE: ('\r'? '\n' | '\r')+ -> channel(HIDDEN);
SQL_COMMA: ',';
SQL_DOT: '.';
SQL_EQUAL: '=';
SQL_ASTERISK: '*';
SQL_UNDESCORE: '_';
SQL_ID: FP_PERCENT_SIGN? CHAR (CHAR | F_DIGIT)*;
SQL_VAR: ':' SQL_ID;
SQL_INTEGER_LITERAL: F_DIGIT+;
SQL_DOUBLE_QUOTE_STRING: '"' ~["]* '"';
SQL_SINGLE_QUOTE_STRING: '\'' ~[']* '\'';
