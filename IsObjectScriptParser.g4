parser grammar IsObjectScriptParser;

options {
	tokenVocab = IsObjectScriptLexer;
}

compileUnit: EOF;

// XML Storage
xml_document: xml_element*;
xml_content: chardata* (xml_element chardata?)*;
xml_element:
	LO_LessThan identifier attribute* LO_GreatherThan xml_content LO_LessThan P_SLASH identifier
		LO_GreatherThan;
//|   LO_LessThan identifier attribute* P_SLASH LO_GreatherThan;
attribute: identifier P_EQUAL_SIGN literal;
chardata:
	identifier
	| global
	| classname
	| P_PERCENT_SIGN
	| literal;

// SQL
embedded_sql:
	E_SQL sql_query+ SQL_QUERY_END;
sql_query:
    SQL_QUERY_STRING
    | SQL_QUERY_BEGIN sql_query+ SQL_QUERY_END;

// Functions
kw_function:
    F_ORDER
    | F_SELECT
    | F_EXTRACT
    | F_LISTBUILD
    | F_LISTGET
    | F_GET
	| F_ASCII
	| F_BIT
	| F_BITCOUNT
	| F_BITFIND
	| F_BITLOGIC
	| F_CASE
	| F_CHAR
	| F_CLASSMETHOD
	| F_CLASSNAME
	| F_COMPILE
	| F_DATA
	| F_DECIMAL
	| F_DOUBLE
	| F_FACTOR
	| F_FIND
	| F_FNUMBER
	| F_INCREMENT
	| F_INUMBER
	| F_ISOBJECT
	| F_ISVALIDDOUBLE
	| F_ISVALIDNUM
	| F_JUSTIFY
	| F_LENGTH
	| F_LIST
	| F_LISTDATA
	| F_LISTFIND
	| F_LISTFROMSTRING
	| F_LISTLENGTH
	| F_LISTNEXT
	| F_LISTSAME
	| F_LISTTOSTRING
	| F_LISTUPDATE
	| F_LISTVALID
	| F_LOCATE
	| F_MATCH
	| F_METHOD
	| F_NAME
	| F_NCONVERT
	| F_NEXT
	| F_NORMALIZE
	| F_NOW
	| F_NUMBER
	| F_ORDER
	| F_PARAMETER
	| F_PIECE
	| F_PREFETCHOFF
	| F_PREFETCHON
	| F_PROPERTY
	| F_QLENGTH
	| F_QSUBSCRIPT
	| F_QUERY
	| F_RANDOM
	| F_REPLACE
	| F_REVERSE
	| F_SCONVERT
	| F_SEQUENCE
	| F_SORTBEGIN
	| F_SORTEND
	| F_STACK
	| F_TEXT
	| F_TRANSLATE
	| F_VIEW
	| F_WASCII
	| F_WCHAR
	| F_WEXTRACT
	| F_WFIND
	| F_WISWIDE
	| F_WLENGTH
	| F_WREVERSE
	| F_XECUTE
	| F_ZABS
	| F_ZARCCOS
	| F_ZARCSIN
	| F_ZARCTAN
	| F_ZBOOLEAN
	| F_ZCONVERT
	| F_ZCOS
	| F_ZCOT
	| F_ZCRC
	| F_ZCSC
	| F_ZCYC
	| F_ZDASCII
	| F_ZDATE
	| F_ZDATEH
	| F_ZDATETIME
	| F_ZDATETIMEH
	| F_ZDCHAR
	| F_ZEXP
	| F_ZF
	| F_ZHEX
	| F_ZISWIDE
	| F_ZLASCII
	| F_ZLCHAR
	| F_ZLN
	| F_ZLOG
	| F_ZNAME
	| F_ZPOSITION
	| F_ZPOWER
	| F_ZQASCII
	| F_ZQCHAR
	| F_ZSEARCH
	| F_ZSEC
	| F_ZSEEK
	| F_ZSIN
	| F_ZSQR
	| F_ZSTRIP
	| F_ZTAN
	| F_ZTIME
	| F_ZTIMEH
	| F_ZVERSION
	| F_ZWASCII
	| F_ZWCHAR
	| F_ZWIDTH
	| F_ZWPACK
	| F_ZWBPACK
	| F_ZWUNPACK
	| F_ZWBUNPACK
	| F_ZZENKAKU
	| F_ZUTIL
	| F_ZOBJPROPERTY;

// Commands
kw_commands:
    C_WRITE
    | C_QUIT
    | C_SET
    | C_IF
    | C_ELSE
    | C_ELSEIF
    | C_WHILE
    | C_DO
    | C_FOR
    | C_KILL
    | C_NEW
	| C_BREAK
	| C_CATCH
	| C_CLOSE
	| C_CONTINUE
	| C_GOTO
	| C_HALT
	| C_HANG
	| C_JOB
	| C_LOCK
	| C_MERGE
	| C_OPEN
	| C_READ
	| C_RETURN
	| C_TCOMMIT
	| C_THROW
	| C_TROLLBACK
	| C_TRY
	| C_TSTART
	| C_USE
	| C_VIEW
	| C_XECUTE
	| C_ZKILL
	| C_ZNSPACE
	| C_ZTRAP
	| C_ZWRITE
	| C_ZZDUMP
	| C_ZZWRITE;

// Special variables
special_variables:
	F_DEVICE
	| F_ECODE
	| F_ESTACK
	| F_ETRAP
	| F_HALT
	| F_HOROLOG
	| F_IO
	| F_JOB
	| F_KEY
	| F_NAMESPACE
	| F_PRINCIPAL
	| F_QUIT
	| F_ROLES
	| F_STACK
	| F_STORAGE
	| F_SYSTEM
	| F_TEST
	| F_THIS
	| F_THROWOBJ
	| F_TLEVEL
	| F_USERNAME
	| F_X
	| F_Y
	| F_ZA
	| F_ZB
	| F_ZCHILD
	| F_ZEOF
	| F_ZEOS
	| F_ZERROR
	| F_ZHOROLOG
	| F_ZIO
	| F_ZJOB
	| F_ZMODE
	| F_ZNAME
	| F_ZNSPACE
	| F_ZORDER
	| F_ZPARENT
	| F_ZPI
	| F_ZPOS
	| F_ZREFERENCE
	| F_ZSTORAGE
	| F_ZTIMESTAMP
	| F_ZTIMEZONE
	| F_ZTRAP
	| F_ZVERSION;

// Common keywords
common_keywords:
    KW_On
    | KW_As
    | KW_Of
    | KW_List
    | KW_Array
    | KW_ByRef
    | KW_Output;

// Keywords Reference B: Class Keywords
class_keywords:
    KW_Class
    | KW_Extends
    | KW_Parameter
    | KW_Property
    | KW_ForeignKey
    | KW_Index
    | KW_Method
    | KW_ClassMethod
    | KW_ClientMethod
    | KW_Projection
    | KW_Relationship
    | KW_Query
    | KW_Trigger
    | KW_XData
    | KW_Import
    | KW_Include
    | KW_IncludeGenerator
	| KW_Abstract
	| KW_ClassType
	| KW_ClientDataType
	| KW_ClientName
	| KW_CompileAfter
	| KW_DdlAllowed
	| KW_DependsOn
	| KW_Deprecated
	| KW_Final
	| KW_GeneratedBy
	| KW_Hidden
	| KW_Inheritance
	| KW_Language
	| KW_LegacyInstanceContext
	| KW_NoExtent
	| KW_OdbcType
	| KW_Owner
	| KW_ProcedureBlock
	| KW_PropertyClass
	| KW_ServerOnly
	| KW_SoapBindingStyle
	| KW_SoapBodyUse
	| KW_SqlCategory
	| KW_SqlRowIdName
	| KW_SqlRowIdPrivate
	| KW_SqlTableName
	| KW_StorageStrategy
	| KW_System
	| KW_ViewQuery;

// Reference C: Foreign Key Keywords
foreign_keywords:
	KW_Internal
	| KW_NoCheck
	| KW_OnDelete
	| KW_OnUpdate
	| KW_SqlName;

// Reference D: Index Keywords
index_keywords:
	KW_Condition
	| KW_Data
	| KW_Extent
	| KW_IdKey
	| KW_Internal
	| KW_PrimaryKey
	| KW_SqlName
	| KW_Type
	| KW_Unique;

// Reference E: Method Keywords
method_keywords:
	KW_Abstract
	| KW_ClientName
	| KW_CodeMode
	| KW_Deprecated
	| KW_ExternalProcName
	| KW_Final
	| KW_ForceGenerate
	| KW_GenerateAfter
	| KW_Internal
	| KW_Language
	| KW_NotInheritable
	| KW_PlaceAfter
	| KW_Private
	| KW_ProcedureBlock
	| KW_PublicList
	| KW_ReturnResultsets
	| KW_ServerOnly
	| KW_SoapAction
	| KW_SoapBindingStyle
	| KW_SoapBodyUse
	| KW_SoapMessageName
	| KW_SoapNameSpace
	| KW_SoapRequestMessage
	| KW_SoapTypeNameSpace
	| KW_SqlName
	| KW_SqlProc
	| KW_WebMethod
	| KW_ZenMethod;

// Reference F: Parameter Keywords
parameter_keywords:
	KW_Abstract
	| KW_Constraint
	| KW_Deprecated
	| KW_Final
	| KW_Flags
	| KW_Internal;

// Reference G: Projection Keywords
projection_keywords: KW_Internal;

// Reference H: Property Keywords
property_keywords:
	KW_Aliases
	| KW_Calculated
	| KW_Cardinality
	| KW_ClientName
	| KW_Collection
	| KW_Deprecated
	| KW_Final
	| KW_Identity
	| KW_InitialExpression
	| KW_Internal
	| KW_Inverse
	| KW_MultiDimensional
	| KW_OnDelete
	| KW_Private
	| KW_ReadOnly
	| KW_Required
	| KW_ServerOnly
	| KW_SqlColumnNumber
	| KW_SqlComputeCode
	| KW_SqlComputed
	| KW_SqlComputeOnChange
	| KW_SqlFieldName
	| KW_SqlListDelimiter
	| KW_SqlListType
	| KW_Transient;

// Reference I: Query Keywords
query_keywords:
	KW_ClientName
	| KW_Final
	| KW_Internal
	| KW_Private
	| KW_SoapBindingStyle
	| KW_SoapBodyUse
	| KW_SoapNameSpace
	| KW_SqlName
	| KW_SqlProc
	| KW_SqlView
	| KW_SqlViewName
	| KW_WebMethod;

// Reference J: Trigger Keywords
trigger_keywords:
	KW_CodeMode
	| KW_Event
	| KW_Final
	| KW_Foreach
	| KW_Internal
	| KW_Language
	| KW_NewTable
	| KW_OldTable
	| KW_Order
	| KW_SqlName
	| KW_Time
	| KW_UpdateColumnList;

// Reference K: XData Keywords
xdata_keywords: KW_Internal | KW_MimeType | KW_SchemaSpec | KW_XMLNamespace;

// Reference L: Storage Keywords
storage_keywords:
	KW_DataLocation
	| KW_DefaultData
	| KW_Final
	| KW_IdLocation
	| KW_IndexLocation
	| KW_SqlRowIdName
	| KW_SqlRowIdProperty
	| KW_SqlTableNumber
	| KW_State
	| KW_StreamLocation
	| KW_Type;

// Logical operators
logical_operators:
	P_APOSTROPHE
	| LO_NotAnd
	| LO_NotOr
	| LO_NotEqual
	| LO_NotLessThan
	| LO_NotGreatherThan
	| LO_LessThan
	| LO_GreatherThan
	| P_EQUAL_SIGN
	| LO_LessThanEqual
	| LO_GreatherThanEqual
	| LO_BitwiseAnd
	| P_VERTICAL_BAR
	| LO_And
	| LO_Or
	| P_COMMA
	| OPEN_SQUARE_BRACKET;

// Arithmetic Operators
arithmetic_operators: P_MINUS_SIGN
| P_PLUS_SIGN
| P_ASTERISK
| P_SLASH
| ExponentiationOperator
| P_APOSTROPHE
| P_POUND_SIGN
| P_BACKSLASH;

// Functions
function:
    f_order
    | f_select
    | f_extract
    | f_listbuild
    | f_listget
    | f_get
    | f_case
    | f_zobjproperty
    | f_zutil
	| F_ASCII
	| F_BIT
	| F_BITCOUNT
	| F_BITFIND
	| F_BITLOGIC
	| F_CHAR
	| F_CLASSMETHOD
	| F_CLASSNAME
	| F_COMPILE
	| F_DATA
	| F_DECIMAL
	| F_DOUBLE
	| F_FACTOR
	| F_FIND
	| F_FNUMBER
	| F_INCREMENT
	| F_INUMBER
	| F_ISOBJECT
	| F_ISVALIDDOUBLE
	| F_ISVALIDNUM
	| F_JUSTIFY
	| F_LENGTH
	| F_LIST
	| F_LISTDATA
	| F_LISTFIND
	| F_LISTFROMSTRING
	| F_LISTLENGTH
	| F_LISTNEXT
	| F_LISTSAME
	| F_LISTTOSTRING
	| F_LISTUPDATE
	| F_LISTVALID
	| F_LOCATE
	| F_MATCH
	| F_METHOD
	| F_NAME
	| F_NCONVERT
	| F_NEXT
	| F_NORMALIZE
	| F_NOW
	| F_NUMBER
	| F_ORDER
	| F_PARAMETER
	| F_PIECE
	| F_PREFETCHOFF
	| F_PREFETCHON
	| F_PROPERTY
	| F_QLENGTH
	| F_QSUBSCRIPT
	| F_QUERY
	| F_RANDOM
	| F_REPLACE
	| F_REVERSE
	| F_SCONVERT
	| F_SEQUENCE
	| F_SORTBEGIN
	| F_SORTEND
	| F_STACK
	| F_TEXT
	| F_TRANSLATE
	| F_VIEW
	| F_WASCII
	| F_WCHAR
	| F_WEXTRACT
	| F_WFIND
	| F_WISWIDE
	| F_WLENGTH
	| F_WREVERSE
	| F_XECUTE
	| F_ZABS
	| F_ZARCCOS
	| F_ZARCSIN
	| F_ZARCTAN
	| F_ZBOOLEAN
	| F_ZCONVERT
	| F_ZCOS
	| F_ZCOT
	| F_ZCRC
	| F_ZCSC
	| F_ZCYC
	| F_ZDASCII
	| F_ZDATE
	| F_ZDATEH
	| F_ZDATETIME
	| F_ZDATETIMEH
	| F_ZDCHAR
	| F_ZEXP
	| F_ZF
	| F_ZHEX
	| F_ZISWIDE
	| F_ZLASCII
	| F_ZLCHAR
	| F_ZLN
	| F_ZLOG
	| F_ZNAME
	| F_ZPOSITION
	| F_ZPOWER
	| F_ZQASCII
	| F_ZQCHAR
	| F_ZSEARCH
	| F_ZSEC
	| F_ZSEEK
	| F_ZSIN
	| F_ZSQR
	| F_ZSTRIP
	| F_ZTAN
	| F_ZTIME
	| F_ZTIMEH
	| F_ZVERSION
	| F_ZWASCII
	| F_ZWCHAR
	| F_ZWIDTH
	| F_ZWPACK
	| F_ZWBPACK
	| F_ZWUNPACK
	| F_ZWBUNPACK
	| F_ZZENKAKU;

// Commands
commands:
    c_write
    | c_quit
    | c_set
    | c_if
    | c_do
    | c_while
    | c_do_while
    | c_for
    | c_kill
    | c_new
    | c_tstart
    | c_tcommit
    | c_trollback
    | c_merge
    | c_continue
    | c_zwrite
    | c_xecute
	| C_BREAK
	| C_CATCH
	| C_CLOSE
	| C_GOTO
	| C_HALT
	| C_HANG
	| C_JOB
	| C_LOCK
	| C_OPEN
	| C_READ
	| C_RETURN
	| C_THROW
	| C_TRY
	| C_USE
	| C_VIEW
	| C_ZKILL
	| C_ZNSPACE
	| C_ZTRAP
	| C_ZZDUMP
	| C_ZZWRITE
	| c_dim;

attribute_identifier:
	class_keywords
	| foreign_keywords
	| index_keywords
	| method_keywords
	| parameter_keywords
	| projection_keywords
	| property_keywords
	| query_keywords
	| storage_keywords
	| trigger_keywords
	| xdata_keywords;

// Query parameters
query_parameters:
    parameters;

// Attributes
cl_attributes:
	OPEN_SQUARE_BRACKET attribute_list CLOSE_SQUARE_BRACKET;

attribute_list: cl_attribute (P_COMMA cl_attribute)*;

cl_attribute:
	attribute_identifier (assignment_operator attribute_argument)?;

attribute_argument:
    block
	| expression
	| arithmetic_operators;

// Parameters
parameter_identifier: identifier;
parameters: OPEN_PARENTHESIS parameter_list CLOSE_PARENTHESIS;
parameter_list: parameter (P_COMMA parameter)*;

parameter:
	parameter_identifier (P_EQUAL_SIGN parameter_argument)?;

parameter_argument:
	classname
	| classname_list
	| QUOTED_STRING
	| INTEGER_LITERAL
	| identifier;

// Global modules
formal_spec: OPEN_PARENTHESIS arguments CLOSE_PARENTHESIS;
arguments: argument_list*;
argument_list: argument | (P_COMMA argument);
argument: ((KW_ByRef | KW_Output)? identifier type_definition? argument_default?)
	| (identifier TripplePeriod);
argument_default: assignment_operator expression;

property_expression_list:
	identifier
	| OPEN_PARENTHESIS identifier (P_COMMA identifier)* CLOSE_PARENTHESIS;

includename: identifier;
includename_list:
	OPEN_PARENTHESIS includename (P_COMMA includename)* CLOSE_PARENTHESIS;

classname: identifier (P_DOT identifier)*;

class_extend: KW_Extends (classname | classname_list);
classname_list:
	OPEN_PARENTHESIS classname (P_COMMA classname)* CLOSE_PARENTHESIS;

class_body: OPEN_BRACE class_member_declarations CLOSE_BRACE;

class_member_declarations: class_member_declaration*;

class_member_declaration: common_member_declaration;

common_member_declaration:
	parameter_definition
	| property_definition
	| foreignkey_definition
	| index_definition
	| method_definition
	| projection_definition
	| relationship_definition
	| query_definition
	| trigger_definition
	| xdata_definition
	| storage_definition;

type_definition: KW_As ((KW_List | KW_Array) KW_Of)? classname;

// Expressions
sql_field_name: OPEN_BRACE identifier CLOSE_BRACE;
local_array: identifier OPEN_PARENTHESIS (expression | (P_COMMA expression))+ CLOSE_PARENTHESIS;
classmethod_invocation:
	ClassInvocation OPEN_PARENTHESIS classname CLOSE_PARENTHESIS member_access;
global:
	P_CARET (LO_Or)? classname parenthesis_block?;
routine: identifier? P_CARET classname parenthesis_block?;
macro_invocation: MacroInvocationPrefix identifier parenthesis_block?;
user_function_call: UserFunctionCallPrefix routine;

postcondition: P_COLON condition;

condition: (OPEN_PARENTHESIS condition CLOSE_PARENTHESIS)
	| condition logical_operators condition
	| expression;

arithmetic_operation:
    OPEN_PARENTHESIS arithmetic_operation CLOSE_PARENTHESIS
    | expression arithmetic_operators expression;

local_member_access:
    local_access_method
    | local_access_property
    | local_access_parameter;

member_access:
	access_property
	| access_method
	| access_parameter;

local_access_property: DoublePeriod identifier;
local_access_method: DoublePeriod identifier parenthesis_block;
local_access_parameter: DoublePeriod P_POUND_SIGN identifier;
access_property: P_DOT identifier;
access_method: P_DOT identifier parenthesis_block;
access_parameter: P_DOT P_POUND_SIGN identifier;

parenthesis_block:
	OPEN_PARENTHESIS parenthesis_block_parameters CLOSE_PARENTHESIS;
parenthesis_block_parameters: ( P_COMMA* ( P_DOT? expression ) )*;

assignment_operator: P_EQUAL_SIGN;
assignment: (assignment_expression | ( OPEN_PARENTHESIS assignment_expression (P_COMMA assignment_expression)* CLOSE_PARENTHESIS )) assignment_operator expression;

expression:
    P_APOSTROPHE expression
    | P_MINUS_SIGN expression
    | P_PLUS_SIGN expression
    | P_AT ( literal | identifier )
    | literal
          | local_member_access member_access*
      	| identifier member_access+
      	| function
      	| function_with_arguments
      	| local_array
      	| special_variables
      	| classmethod_invocation
      	| global
      	| macro_invocation
      	| user_function_call
      	| sql_field_name
      	| identifier
      	| OPEN_BRACE expression CLOSE_BRACE
    | expression arithmetic_operators expression
        | expression logical_operators expression
        | OPEN_PARENTHESIS expression CLOSE_PARENTHESIS
    | expression (P_UNDESCORE expression)+

    ;

assignment_expression:
    local_member_access member_access*
    | identifier member_access+
    | local_array
    | special_variables
    | global
    | macro_invocation
    | function
    | OPEN_BRACE assignment_expression CLOSE_BRACE
    | identifier;

literal: INTEGER_LITERAL | REAL_LITERAL | QUOTED_STRING;

// Statements
statement: embedded_statement # EmbeddedStatement;
embedded_statement: block | embedded_statement_simple;

statement_list: statement*;
block: OPEN_BRACE statement_list CLOSE_BRACE;
method_body: block;

embedded_statement_simple:
    commands
    | function
    | embedded_sql
    | label
	| comment_semicolon;

function_with_arguments: function parenthesis_block;

assignment_list: assignment (P_COMMA assignment)*;

c_dim: VAR_DECLARATION identifier type_definition assignment_operator expression;
c_quit: C_QUIT postcondition? expression?;
c_set: C_SET postcondition? (assignment | assignment_list);
c_do: C_DO postcondition?
    ( local_access_method
    | routine
    | local_member_access member_access* access_method
    | classmethod_invocation parenthesis_block
    | identifier member_access* access_method )
    | ( P_DOT+ statement )+
    ;

c_while: C_WHILE condition block;
c_do_while: C_DO block c_while ;
c_for: C_FOR ( assignment ( ( P_COLON expression )? P_COLON expression )? )? block;
c_kill: C_KILL postcondition? (assignment_expression (P_COMMA assignment_expression)*)?;
c_merge: C_MERGE postcondition? assignment_expression assignment_operator assignment_expression;
c_new: C_NEW (identifier (P_COMMA identifier)*)?;
c_write:
	C_WRITE postcondition? expression? (
                ( P_COMMA expression )
                | ( P_COMMA? P_EXCLAMATION_MARK )
                | ( P_UNDESCORE expression )
            )*;
c_if:
	C_IF condition ( block | statement ) (
		C_ELSEIF condition ( block | statement )
	)* (C_ELSE ( block | statement ) )?;
c_tstart: C_TSTART postcondition?;
c_tcommit: C_TCOMMIT postcondition?;
c_trollback: C_TROLLBACK postcondition;
c_continue: C_CONTINUE postcondition;
c_zwrite: C_ZWRITE postcondition? identifier;
c_xecute: C_XECUTE postcondition? expression;

// functions
f_select: F_SELECT OPEN_PARENTHESIS (condition P_COLON expression (P_COMMA condition P_COLON expression)*) CLOSE_PARENTHESIS;
f_case: F_CASE OPEN_PARENTHESIS ( condition ( P_COMMA expression? P_COLON expression )+ ) CLOSE_PARENTHESIS;
f_order: F_ORDER OPEN_PARENTHESIS expression (P_COMMA expression)? (P_COMMA expression)? CLOSE_PARENTHESIS;
f_extract: F_EXTRACT OPEN_PARENTHESIS expression (P_COMMA (expression | P_ASTERISK))? (P_COMMA (expression | P_ASTERISK))? CLOSE_PARENTHESIS;
f_listbuild: F_LISTBUILD OPEN_PARENTHESIS (expression (P_COMMA expression)*)? CLOSE_PARENTHESIS;
f_listget: F_LISTGET OPEN_PARENTHESIS expression (P_COMMA expression (P_COMMA expression)?)? CLOSE_PARENTHESIS;
f_get: F_GET OPEN_PARENTHESIS expression (P_COMMA expression)? CLOSE_PARENTHESIS;
f_zobjproperty: F_ZOBJPROPERTY OPEN_PARENTHESIS expression P_COMMA expression CLOSE_PARENTHESIS;
f_zutil: F_ZUTIL OPEN_PARENTHESIS expression ( P_COMMA expression )* CLOSE_PARENTHESIS;

label: EOL? identifier parenthesis_block?;

comment_semicolon: P_SEMICOLON ( identifier | ERROR_TEXT | P_COMMA | P_DOT | arithmetic_operators )*;

storage_block: OPEN_BRACE xml_document CLOSE_BRACE;

// Class members

// ForeignKey name(key_props) References referenced_class(ref_index) [ keyword_list ]; ex:
// ForeignKey EmpKey(EmpId) References MyApp.Employee(EmpID) [ OnDelete = cascade ];
foreignkey_definition: KW_ForeignKey identifier P_SEMICOLON;

// Index name On property_expression_list [ keyword_list ];
index_definition:
	KW_Index identifier KW_On property_expression_list cl_attributes? P_SEMICOLON;

// Parameter name As parameter_type [ keyword_list ] = value ; ex: Parameter SERVICENAME =
// "SOAPDemo" ;
parameter_definition:
	KW_Parameter identifier P_EQUAL_SIGN (identifier | literal) P_SEMICOLON;

// Projection name As projection_class (parameter_list) ;
projection_definition:
	KW_Projection identifier parameters? P_SEMICOLON;

// Property name As classname (parameter_list) [ keyword_list ] ; / description Property name As
// List Of classname (parameter_list) [ keyword_list ] ; Property name As Array Of classname
// (parameter_list) [ keyword_list ] ; ex: Property SSN As %String(PATTERN = "3N1""-""2N1""-""4N") [
// Required ];
property_definition:
	KW_Property identifier type_definition parameters? cl_attributes? P_SEMICOLON;

// Relationship name As classname [ keyword_list ] ;
relationship_definition:
	KW_Relationship identifier type_definition cl_attributes? P_SEMICOLON;

// Method name(formal_spec) As returnclass [ keyword_list ] { implementation } ClassMethod
// name(formal_spec) As returnclass [ keyword_list ] { implementation } ClientMethod
// name(formal_spec) As returnclass [ keyword_list ] { implementation }
/* example
 ClassMethod MyProc(data As %String(MAXLEN = 85)) As %Integer [ SQLProc ]
 {
 Quit 22
 }
 */
method_definition:
	(KW_Method | KW_ClassMethod) identifier formal_spec type_definition? cl_attributes? method_body?;

// Query name(formal_spec) As classname [ keyword_list ]  { implementation }
query_definition:
	KW_Query identifier formal_spec type_definition? cl_attributes? query_parameters? OPEN_BRACE sql_query CLOSE_BRACE;

// Trigger name [ keyword_list ]  { code }
trigger_definition: KW_Trigger identifier cl_attributes? method_body;

// XData name [ keyword_list ]  { data }
xdata_definition: KW_XData identifier cl_attributes?;

// Storage
storage_definition: KW_Storage identifier storage_block;

// Class includes
class_import: KW_Import (classname | classname_list);
class_include: KW_Include (includename | includename_list);
class_includegenerator: KW_IncludeGenerator (includename | includename_list);

// Class definition
class_definition:
    (class_import | class_include | class_includegenerator)*
	KW_Class classname (class_extend)? cl_attributes? class_body;

// Identifier
identifier:
	IDENTIFIER
	| kw_commands
	| kw_function
	| special_variables
	| common_keywords
	| storage_keywords
	| class_keywords
	| foreign_keywords
	| index_keywords
	| method_keywords
	| parameter_keywords
	| property_keywords
	| query_keywords
	| trigger_keywords
	| xdata_keywords
	| KW_Property
	| KW_As;