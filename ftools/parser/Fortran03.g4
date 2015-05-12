grammar Fortran03;
// R550
implicitSpec : 
declarationTypeSpec  LEFTPAR  letterSpecList  RIGHTPAR 
;
// R551
letterSpec : 
letter   (    letter   )?  
;
// R552
namelistStmt : 
NAMELIST
 FORWARDSLASH  namelistGroupName  FORWARDSLASH  namelistGroupObjectList
  (     (    COMMA     )?    FORWARDSLASH  namelistGroupName  FORWARDSLASH 
namelistGroupObjectList  )* 
Newline
;
// R553
namelistGroupObject : 
variableName
;
// R554
equivalenceStmt : 
EQUIVALENCE equivalenceSetList
Newline
;
// R555
equivalenceSet : 
 LEFTPAR  equivalenceObject  COMMA   equivalenceObjectList  RIGHTPAR 
;
// R556
equivalenceObject : 
variableName
| arrayElement
| substring
;
// R557
commonStmt : 
COMMON
  (    FORWARDSLASH    (   commonBlockName   )?    FORWARDSLASH    )?   commonBlockObjectList
  (     (    COMMA     )?    FORWARDSLASH    (   commonBlockName   )?    FORWARDSLASH 
commonBlockObjectList  )* 
Newline
;
// R558
commonBlockObject : 
variableName   (    LEFTPAR  explicitShapeSpecList  RIGHTPAR    )?  
| procPointerName
;
// R1237
containsStmt : 
CONTAINS
Newline
;
// R1236
returnStmt : 
RETURN   (   scalarIntExpr   )?  
Newline
;
// R1235
entryStmt : 
ENTRY entryName   (    LEFTPAR    (   dummyArgList   )?    RIGHTPAR    (   suffix   )?     )?  
Newline
;
// R1234
endSubroutineStmt : 
END   (   SUBROUTINE   (   subroutineName   )?     )?  
Newline
;
// R1233
dummyArg : 
dummyArgName
|  ASTERISK 
;
// R1232
subroutineStmt : 
  (   prefix   )?   SUBROUTINE subroutineName
  (    LEFTPAR    (   dummyArgList   )?    RIGHTPAR    (   procLanguageBindingSpec   )?     )?  
Newline
;
// R1231
subroutineSubprogram : 
subroutineStmt
  specificationPart 
  (executionPart)?
  (internalSubprogramPart)?
endSubroutineStmt
;
// R1230
endFunctionStmt : 
END   (   FUNCTION   (   functionName   )?     )?  
Newline
;
// R1238
stmtFunctionStmt : 
functionName  LEFTPAR    (   dummyArgNameList   )?    RIGHTPAR   EQUALS  scalarExpr
Newline
;
// R472
acDoVariable : 
scalarIntVariable
;
// R471
acImpliedDoControl : 
acDoVariable  EQUALS  scalarIntExpr  COMMA   scalarIntExpr
  (    COMMA   scalarIntExpr   )?  
;
// R470
acImpliedDo : 
 LEFTPAR  acValueList  COMMA   acImpliedDoControl  RIGHTPAR 
;
// R604
logicalVariable : 
variable
;
// R911
writeStmt : 
WRITE  LEFTPAR  ioControlSpecList  RIGHTPAR    (   outputItemList   )?  
Newline
;
// R912
printStmt : 
PRINT fformat   (    COMMA   outputItemList   )?  
Newline
;
// R607
defaultCharVariable : 
variable
;
// R914
fformat : 
defaultCharExpr
| label
|  ASTERISK 
;
// R915
inputItem : 
variable
| ioImpliedDo
;
// R916
outputItem : 
expr
| ioImpliedDo
;
// R917
ioImpliedDo : 
 LEFTPAR  ioImpliedDoObjectList  COMMA   ioImpliedDoControl  RIGHTPAR 
;
// R918
ioImpliedDoObject : 
inputItem
| outputItem
;
// R919
ioImpliedDoControl : 
doVariable  EQUALS  scalarIntExpr  COMMA  
scalarIntExpr   (    COMMA   scalarIntExpr   )?  
;
// R1015
signEditDesc : 
SS
| SP
| S
;
// R1014
n : 
intLiteralConstant
;
// R608
intVariable : 
variable
;
// R609
substring : 
parentString  LEFTPAR  substringRange  RIGHTPAR 
;
// R1011
controlEditDesc : 
positionEditDesc
|   (   r   )?    FORWARDSLASH 
|  COLON 
| signEditDesc
| k P
| blankInterpEditDesc
| roundEditDesc
| decimalEditDesc
;
// R1010
v : 
signedIntLiteralConstant
;
// R213
executableConstruct : 
actionStmt
| associateConstruct
| caseConstruct
| doConstruct
| forallConstruct
| ifConstruct
| selectTypeConstruct
| whereConstruct
;
// R212
specificationStmt : 
accessStmt
| allocatableStmt
| asynchronousStmt
| bindStmt
| commonStmt
| dataStmt
| dimensionStmt
| equivalenceStmt
| externalStmt
| intentStmt
| intrinsicStmt
| namelistStmt
| optionalStmt
| pointerStmt
| protectedStmt
| saveStmt
| targetStmt
| volatileStmt
| valueStmt
Newline
;
// R211
internalSubprogram : 
functionSubprogram
| subroutineSubprogram
;
// R210
internalSubprogramPart : 
containsStmt
internalSubprogram
  (   internalSubprogram  )* 
;
// R215
keyword : 
name
;
// R214
actionStmt : 
allocateStmt
| assignmentStmt
| backspaceStmt
| callStmt
| closeStmt
| continueStmt
| cycleStmt
| deallocateStmt
| endfileStmt
// | endFunctionStmt
// | endProgramStmt
// | endSubroutineStmt
| exitStmt
| flushStmt
| forallStmt
| gotoStmt
| ifStmt
| inquireStmt
| nullifyStmt
| openStmt
| pointerAssignmentStmt
| printStmt
| readStmt
| returnStmt
| rewindStmt
| stopStmt
| waitStmt
| whereStmt
| writeStmt
| arithmeticIfStmt
| computedGotoStmt
Newline
;
// R828
labelDoStmt : 
  (   doConstructName  COLON    )?   DO label   (   loopControl   )?  
Newline
;
// R829
nonlabelDoStmt : 
  (   doConstructName  COLON    )?   DO   (   loopControl   )?  
Newline
;
// R824
endSelectTypeStmt : 
END SELECT   (   selectConstructName   )?  
Newline
;
// R825
doConstruct : 
blockDoConstruct
| nonblockDoConstruct
;
// R826
blockDoConstruct : 
doStmt
doBlock
endDo
;
// R827
doStmt : 
labelDoStmt
| nonlabelDoStmt
Newline
;
// R820
endAssociateStmt : 
END ASSOCIATE   (   associateConstructName   )?  
Newline
;
// R821
selectTypeConstruct : 
selectTypeStmt
  (   typeGuardStmt
block  )* 
endSelectTypeStmt
;
// R822
selectTypeStmt : 
  (   selectConstructName  COLON    )?   SELECT TYPE
 LEFTPAR    (   associateName  ARROW    )?   selector  RIGHTPAR 
Newline
;
// R823
typeGuardStmt : 
TYPE IS  LEFTPAR  typeSpec  RIGHTPAR    (   selectConstructName   )?  
| CLASS IS  LEFTPAR  typeSpec  RIGHTPAR    (   selectConstructName   )?  
| CLASS DEFAULT   (   selectConstructName   )?  
Newline
;
// R509
languageBindingSpec : 
BIND  LEFTPAR C   (   COMMA   NAME  EQUALS  scalarCharInitializationExpr   )?   RIGHTPAR 
;
// R508
accessSpec : 
PUBLIC
| PRIVATE
;
// R507
nullInit : 
functionReference
;
// R506
initialization : 
 EQUALS  initializationExpr
|  ARROW  nullInit
;
// R505
objectName : 
name
;
// R504
entityDecl : 
objectName   (   LEFTPAR  arraySpec  RIGHTPAR   )?     (    ASTERISK  charLength   )?     (   initialization   )?  
| functionName   (    ASTERISK  charLength   )?  
;
// R503
attrSpec : 
accessSpec
| ALLOCATABLE
| ASYNCHRONOUS
| DIMENSION  LEFTPAR  arraySpec  RIGHTPAR 
| EXTERNAL
| INTENT  LEFTPAR  intentSpec  RIGHTPAR 
| INTRINSIC
| languageBindingSpec
| OPTIONAL
| PARAMETER
| POINTER
| PROTECTED
| SAVE
| TARGET
| VALUE
| VOLATILE
;
// R502
declarationTypeSpec : 
intrinsicTypeSpec
| TYPE  LEFTPAR  derivedTypeSpec  RIGHTPAR 
| CLASS  LEFTPAR  derivedTypeSpec  RIGHTPAR 
| CLASS  LEFTPAR   ASTERISK   RIGHTPAR 
;
// R501
typeDeclarationStmt : 
declarationTypeSpec   (     (    COMMA   attrSpec  )*   DOUBLECOLON    )?   entityDeclList
Newline
;
// R439
componentDefStmt : 
dataComponentDefStmt
| procComponentDefStmt
Newline
;
// R438
componentPart : 
  (   componentDefStmt  )* 
;
// R433
endTypeStmt : 
END TYPE   (   typeName   )?  
Newline
;
// R432
privateOrSequence : 
privateComponentsStmt
| sequenceStmt
;
// R431
typeAttrSpec : 
accessSpec
| EXTENDS  LEFTPAR  parentTypeName  RIGHTPAR 
| ABSTRACT
| BIND  LEFTPAR C RIGHTPAR 
;
// R430
derivedTypeStmt : 
TYPE   (     (    COMMA   typeAttrSpecList   )?    DOUBLECOLON    )?   typeName
  (    LEFTPAR  typeParamNameList  RIGHTPAR    )?  
Newline
;
// R437
typeParamAttrSpec : 
KIND
| LEN
;
// R436
typeParamDecl : 
typeParamName   (    EQUALS  scalarIntInitializationExpr   )?  
;
// R435
typeParamDefStmt : 
INTEGER   (   kindSelector   )?    COMMA   typeParamAttrSpec  DOUBLECOLON 
typeParamDeclList
Newline
;
// R434
sequenceStmt : 
SEQUENCE
Newline
;
// R727
intExpr : 
expr
;
// R726
defaultCharExpr : 
expr
;
// R725
charExpr : 
expr
;
// R724
logicalExpr : 
expr
;
// R723
definedBinaryOp : 
 PERIOD  letter   (   letter  )*   PERIOD 
;
// R722
expr : 
  level5Expr ( definedBinaryOp   expr )?
;
// R721
equivOp : 
 PERIOD EQV PERIOD 
|  PERIOD NEQV PERIOD 
;
// R720
orOp : 
 PERIOD OR PERIOD 
;
// R729
specificationExpr : 
scalarIntExpr
;
// R728
numericExpr : 
expr
;
// R312
extendedIntrinsicOp : 
intrinsicOperator
;
// R313
label : 
digit   (   digit   (   digit   (   digit   (   digit   )?     )?     )?     )?  
;
// R310
intrinsicOperator : 
powerOp
| multOp
| addOp
| concatOp
| relOp
| notOp
| andOp
| orOp
| equivOp
;
// R311
definedOperator : 
definedUnaryOp
| definedBinaryOp
| extendedIntrinsicOp
;
// R543
saveStmt : 
SAVE   (     (    DOUBLECOLON    )?   savedEntityList   )?  
Newline
;
// R542
protectedStmt : 
PROTECTED   (    DOUBLECOLON    )?   entityNameList
Newline
;
// R541
pointerDecl : 
objectName   (    LEFTPAR  deferredShapeSpecList  RIGHTPAR    )?  
| procEntityName
;
// R540
pointerStmt : 
POINTER   (    DOUBLECOLON    )?   pointerDeclList
Newline
;
// R547
valueStmt : 
VALUE   (    DOUBLECOLON    )?   dummyArgNameList
Newline
;
// R546
targetStmt : 
TARGET   (    DOUBLECOLON    )?   objectName   (    LEFTPAR  arraySpec  RIGHTPAR    )?  
  (    COMMA   objectName   (    LEFTPAR  arraySpec  RIGHTPAR    )?    )* 
Newline
;
// R545
procPointerName : 
name
;
// R544
savedEntity : 
objectName
| procPointerName
|  FORWARDSLASH  commonBlockName  FORWARDSLASH 
;
// R549
implicitStmt : 
IMPLICIT implicitSpecList
| IMPLICIT NONE
Newline
;
// R548
volatileStmt : 
VOLATILE   (    DOUBLECOLON    )?   objectNameList
Newline
;
// R1220
actualArgSpec : 
  (   keyword  EQUALS    )?   actualArg
;
// R1221
actualArg : 
expr
| variable
| procedureName
| procComponentRef
| altReturnSpec
;
// R1222
altReturnSpec : 
 ASTERISK  label
;
// R1223
functionSubprogram : 
functionStmt
  specificationPart
  (executionPart)?
  (internalSubprogramPart)?
endFunctionStmt
;
// R1224
functionStmt : 
  (   prefix   )?   FUNCTION functionName
 LEFTPAR    (   dummyArgNameList   )?    RIGHTPAR    (   suffix   )?  
Newline
;
// R1225
procLanguageBindingSpec : 
languageBindingSpec
;
// R1226
dummyArgName : 
name
;
// R1227
prefix : 
prefixSpec   (   prefixSpec  )* 
;
// R1228
prefixSpec : 
declarationTypeSpec
| RECURSIVE
| PURE
| ELEMENTAL
;
// R1229
suffix : 
procLanguageBindingSpec   (   RESULT  LEFTPAR  resultName  RIGHTPAR    )?  
| RESULT  LEFTPAR  resultName  RIGHTPAR    (   procLanguageBindingSpec   )?  
;
// R524
dataStmt : 
DATA dataStmtSet   (     (    COMMA     )?   dataStmtSet  )* 
Newline
;
// R522
bindStmt : 
languageBindingSpec   (    DOUBLECOLON    )?   bindEntityList
Newline
;
// R617
arraySection : 
dataRef   (    LEFTPAR  substringRange  RIGHTPAR    )?  
;
// R616
arrayElement : 
dataRef
;
// R615
typeParamInquiry : 
designator  PERCENT  typeParamName
;
// R611
substringRange : 
  (   scalarIntExpr   )?    COLON    (   scalarIntExpr   )?  
;
// R907
iomsgVariable : 
scalarDefaultCharVariable
;
// R906
fileNameExpr : 
scalarDefaultCharExpr
;
// R442
componentDecl : 
componentName   (    LEFTPAR  componentArraySpec  RIGHTPAR    )?  
  (    ASTERISK  charLength   )?     (   componentInitialization   )?  
;
// R443
componentArraySpec : 
explicitShapeSpecList
| deferredShapeSpecList
;
// R440
dataComponentDefStmt : 
declarationTypeSpec   (     (    COMMA   componentAttrSpecList   )?    DOUBLECOLON    )?  
componentDeclList
Newline
;
// R441
componentAttrSpec : 
POINTER
| DIMENSION  LEFTPAR  componentArraySpec  RIGHTPAR 
| ALLOCATABLE
| accessSpec
;
// R446
procComponentAttrSpec : 
POINTER
| PASS   (    LEFTPAR argName RIGHTPAR    )?  
| NOPASS
| accessSpec
;
// R447
privateComponentsStmt : 
PRIVATE
Newline
;
// R444
componentInitialization : 
 EQUALS  initializationExpr
|  ARROW  nullInit
;
// R445
procComponentDefStmt : 
PROCEDURE  LEFTPAR    (   procInterface   )?    RIGHTPAR   COMMA  
procComponentAttrSpecList  DOUBLECOLON  procDeclList
Newline
;
// R448
typeBoundProcedurePart : 
containsStmt
  (   bindingPrivateStmt   )?  
procBindingStmt
  (   procBindingStmt  )* 
;
// R449
bindingPrivateStmt : 
PRIVATE
Newline
;
// R610
parentString : 
scalarVariableName
| arrayElement
| scalarStructureComponent
| scalarConstant
;
// R909
closeSpec : 
  (   UNIT  EQUALS    )?   fileUnitNumber
| IOSTAT  EQUALS  scalarIntVariable
| IOMSG  EQUALS  iomsgVariable
| ERR  EQUALS  label
| STATUS  EQUALS  scalarDefaultCharExpr
;
// R1003
formatItem : 
  (   r   )?   dataEditDesc
| controlEditDesc
| charStringEditDesc
|   (   r   )?    LEFTPAR  formatItemList  RIGHTPAR 
;
// R619
sectionSubscript : 
subscript
| subscriptTriplet
| vectorSubscript
;
// R1007
m : 
intLiteralConstant
;
// R903
internalFileVariable : 
charVariable
;
// R1009
e : 
intLiteralConstant
;
// R901
ioUnit : 
fileUnitNumber
|  ASTERISK 
| internalFileVariable
;
// R614
structureComponent : 
dataRef
;
// R613
partRef : 
partName   (    LEFTPAR  sectionSubscriptList  RIGHTPAR    )?  
;
// R612
dataRef : 
partRef   (    PERCENT  partRef  )* 
;
// R905
connectSpec : 
  (   UNIT  EQUALS    )?   fileUnitNumber
| ACCESS  EQUALS  scalarDefaultCharExpr
| ACTION  EQUALS  scalarDefaultCharExpr
| ASYNCHRONOUS  EQUALS  scalarDefaultCharExpr
| BLANK  EQUALS  scalarDefaultCharExpr
| DECIMAL  EQUALS  scalarDefaultCharExpr
| DELIM  EQUALS  scalarDefaultCharExpr
| ENCODING  EQUALS  scalarDefaultCharExpr
| ERR  EQUALS  label
| FILE  EQUALS  fileNameExpr
| FORM  EQUALS  scalarDefaultCharExpr
| IOMSG  EQUALS  iomsgVariable
| IOSTAT  EQUALS  scalarIntVariable
| PAD  EQUALS  scalarDefaultCharExpr
| POSITION  EQUALS  scalarDefaultCharExpr
| RECL  EQUALS  scalarIntExpr
| ROUND  EQUALS  scalarDefaultCharExpr
| SIGN  EQUALS  scalarDefaultCharExpr
| STATUS  EQUALS  scalarDefaultCharExpr
;
// R904
openStmt : 
OPEN  LEFTPAR  connectSpecList  RIGHTPAR 
Newline
;
// R1001
formatStmt : 
FORMAT formatSpecification
Newline
;
// R1002
formatSpecification : 
 LEFTPAR    (   formatItemList   )?    RIGHTPAR 
;
// R908
closeStmt : 
CLOSE  LEFTPAR  closeSpecList  RIGHTPAR 
Newline
;
// R1004
r : 
intLiteralConstant
;
// R1005
dataEditDesc : 
I w   (    PERIOD  m   )?  
| B w   (    PERIOD  m   )?  
| O w   (    PERIOD  m   )?  
| Z w   (    PERIOD  m   )?  
| F w  PERIOD  d
| E w  PERIOD  d   (   E e   )?  
| EN w  PERIOD  d   (   E e   )?  
| ES w  PERIOD  d   (   E e   )?  
| G w  PERIOD  d   (   E e   )?  
| L w
| A   (   w   )?  
| D w  PERIOD  d
| DT   (   charLiteralConstant   )?     (    LEFTPAR  vList  RIGHTPAR    )?  
;
// R1006
w : 
intLiteralConstant
;
// R618
subscript : 
scalarIntExpr
;
// R1008
d : 
intLiteralConstant
;
// R839
outerSharedDoConstruct : 
labelDoStmt
doBody
sharedTermDoConstruct
;
// R838
doTermActionStmt : 
actionStmt
Newline
;
// R837
doBody : 
  (   executionPartConstruct  )* 
;
// R836
actionTermDoConstruct : 
labelDoStmt
doBody
doTermActionStmt
;
// R835
nonblockDoConstruct : 
actionTermDoConstruct
| outerSharedDoConstruct
;
// R834
endDoStmt : 
END DO   (   doConstructName   )?  
Newline
;
// R833
endDo : 
endDoStmt
| continueStmt
;
// R832
doBlock : 
block
;
// R831
doVariable : 
scalarIntVariable
;
// R830
loopControl : 
  (    COMMA     )?   doVariable  EQUALS  scalarIntExpr COMMA   scalarIntExpr
  (    COMMA   scalarIntExpr   )?  
|   (    COMMA     )?   WHILE  LEFTPAR  scalarLogicalExpr  RIGHTPAR 
;
// R538
parameterStmt : 
PARAMETER  LEFTPAR  namedConstantDefList  RIGHTPAR 
Newline
;
// R539
namedConstantDef : 
namedConstant  EQUALS  initializationExpr
;
// R532
dataStmtConstant : 
scalarConstant
| scalarConstantSubobject
| signedIntLiteralConstant
| signedRealLiteralConstant
| nullInit
| structureConstructor
;
// R533
intConstantSubobject : 
constantSubobject
;
// R530
dataStmtValue : 
  (   dataStmtRepeat  ASTERISK    )?   dataStmtConstant
;
// R531
dataStmtRepeat : 
scalarIntConstant
| scalarIntConstantSubobject
;
// R536
intentStmt : 
INTENT  LEFTPAR  intentSpec  RIGHTPAR    (    DOUBLECOLON    )?   dummyArgNameList
Newline
;
// R537
optionalStmt : 
OPTIONAL   (    DOUBLECOLON    )?   dummyArgNameList
Newline
;
// R534
constantSubobject : 
designator
;
// R535
dimensionStmt : 
DIMENSION   (    DOUBLECOLON    )?   arrayName  LEFTPAR  arraySpec  RIGHTPAR 
  (    COMMA   arrayName  LEFTPAR  arraySpec  RIGHTPAR   )* 
Newline
;
// R1219
procedureDesignator : 
procedureName
| procComponentRef
| dataRef  PERCENT  bindingName
;
// R1218
callStmt : 
CALL procedureDesignator   (    LEFTPAR    (   actualArgSpecList   )?    RIGHTPAR    )?  
Newline
;
// R1211
procedureDeclarationStmt : 
PROCEDURE  LEFTPAR    (   procInterface   )?    RIGHTPAR 
  (     (    COMMA   procAttrSpec  )*   DOUBLECOLON    )?   procDeclList
Newline
;
// R1210
externalStmt : 
EXTERNAL   (    DOUBLECOLON    )?   externalNameList
Newline
;
// R1213
procAttrSpec : 
accessSpec
| procLanguageBindingSpec
| INTENT  LEFTPAR  intentSpec  RIGHTPAR 
| OPTIONAL
| POINTER
| SAVE
;
// R1212
procInterface : 
interfaceName
| declarationTypeSpec
;
// R1215
interfaceName : 
name
;
// R1214
procDecl : 
procedureEntityName  (    ARROW  nullInit   )?  
;
// R1217
functionReference : 
procedureDesignator  LEFTPAR    (   actualArgSpecList   )?    RIGHTPAR 
;
// R1216
intrinsicStmt : 
INTRINSIC   (    DOUBLECOLON    )?   intrinsicProcedureNameList
Newline
;
// R406
intLiteralConstant : 
digitString   (   kindParam   )?  
;
// R407
kindParam : 
digitString
| scalarIntConstantName
;
// R404
kindSelector : 
 LEFTPAR    (   KIND  EQUALS    )?   scalarIntInitializationExpr  RIGHTPAR 
;
// R405
signedIntLiteralConstant : 
  (   sign   )?   intLiteralConstant
;
// R402
typeParamValue : 
scalarIntExpr
|  ASTERISK 
|  COLON 
;
// R403
intrinsicTypeSpec : 
INTEGER   (   kindSelector   )?  
| REAL   (   kindSelector   )?  
| DOUBLE PRECISION
| COMPLEX   (   kindSelector   )?  
| CHARACTER   (   charSelector   )?  
| LOGICAL   (   kindSelector   )?  
;
// R401
typeSpec : 
intrinsicTypeSpec
| derivedTypeSpec
;
// R408
signedDigitString : 
  (   sign   )?   digitString
;
// R409
digitString : 
digit   (   digit  )* 
;
// R712
level4Expr : 
  (   level3Expr relOp   )?   level3Expr
;
// R713
relOp : 
 PERIOD EQ PERIOD 
|  PERIOD NE PERIOD 
|  PERIOD LT PERIOD 
|  PERIOD LE PERIOD 
|  PERIOD GT PERIOD 
|  PERIOD GE PERIOD 
|  DOUBLEEQUALS 
|  SLASHEQUALS 
|  LESS 
|  LESSEQUALS 
|  GREATER 
|  GREATEREQUALS 
;
// R710
level3Expr : 
  level2Expr (   concatOp  level3Expr  )?
;
// R711
concatOp : 
 DOUBLESLASH 
;
// R716
equivOperand : 
  orOperand (   orOp  equivOperand )?
;
// R717
level5Expr : 
  equivOperand (  equivOp level5Expr )?
;
// R714
andOperand : 
  (   notOp   )?   level4Expr
;
// R715
orOperand : 
  andOperand ( andOp  orOperand )? 
;
// R718
notOp : 
 PERIOD NOT PERIOD 
;
// R719
andOp : 
 PERIOD AND PERIOD 
;
// R309
charConstant : 
constant
;
// R308
intConstant : 
constant
;
// R301
character : 
alphanumericCharacter
| specialCharacter
;
// R303
underscore : 
 UNDERSCORE 
;
// R302
alphanumericCharacter : 
letter
| digit
| underscore
;
// R305
constant : 
literalConstant
| namedConstant
;
// R307
namedConstant : 
name
;
// R306
literalConstant : 
intLiteralConstant
| realLiteralConstant
| complexLiteralConstant
| logicalLiteralConstant
| charLiteralConstant
| bozLiteralConstant
;
// R756
forallBodyConstruct : 
forallAssignmentStmt
| whereStmt
| whereConstruct
| forallConstruct
| forallStmt
;
// R757
forallAssignmentStmt : 
assignmentStmt
| pointerAssignmentStmt
Newline
;
// R754
forallHeader : 
 LEFTPAR forallTripletSpecList   (   COMMA   scalarMaskExpr  )?    RIGHTPAR 
;
// R755
forallTripletSpec : 
indexName  EQUALS  subscript  COLON  subscript   (    COLON  stride  )?  
;
// R752
forallConstruct : 
forallConstructStmt
  (  forallBodyConstruct  )* 
endForallStmt
;
// R753
forallConstructStmt : 
  (  forallConstructName  COLON   )?   FORALL forallHeader
Newline
;
// R750
elsewhereStmt : 
ELSEWHERE   (  whereConstructName  )?  
Newline
;
// R751
endWhereStmt : 
END WHERE   (  whereConstructName  )?  
Newline
;
// R758
endForallStmt : 
END FORALL   (  forallConstructName   )?  
Newline
;
// R759
forallStmt : 
FORALL forallHeader forallAssignmentStmt
Newline
;
// R601
variable : 
designator
;
// R459
componentDataSource : 
expr
| dataTarget
| procTarget
;
// R458
componentSpec : 
  (   keyword  EQUALS    )?   componentDataSource
;
// R455
derivedTypeSpec : 
typeName   (    LEFTPAR  typeParamSpecList  RIGHTPAR    )?  
;
// R454
finalBinding : 
FINAL   (    DOUBLECOLON    )?   finalSubroutineNameList
;
// R457
structureConstructor : 
derivedTypeSpec  LEFTPAR    (   componentSpecList   )?    RIGHTPAR 
;
// R456
typeParamSpec : 
  (   keyword  EQUALS    )?   typeParamValue
;
// R451
specificBinding : 
PROCEDURE   (    LEFTPAR interfaceName RIGHTPAR    )?  
  (     (    COMMA   bindingAttrList   )?    DOUBLECOLON    )?  
bindingName   (    ARROW  procedureName   )?  
;
// R450
procBindingStmt : 
specificBinding
| genericBinding
| finalBinding
Newline
;
// R453
bindingAttr : 
PASS   (    LEFTPAR argName RIGHTPAR    )?  
| NOPASS
| NON OVERRIDABLE
| DEFERRED
| accessSpec
;
// R452
genericBinding : 
GENERIC
  (   COMMA   accessSpec   )?    DOUBLECOLON  genericSpec  ARROW  bindingNameList
;
// R602
variableName : 
name
;
// R605
defaultLogicalVariable : 
variable
;
// R606
charVariable : 
variable
;
// R913
ioControlSpec : 
  (   UNIT  EQUALS    )?   ioUnit
|   (   FMT  EQUALS    )?   fformat
|   (   NML  EQUALS    )?   namelistGroupName
| ADVANCE  EQUALS  scalarDefaultCharExpr
| ASYNCHRONOUS  EQUALS  scalarCharInitializationExpr
| BLANK  EQUALS  scalarDefaultCharExpr
| DECIMAL  EQUALS  scalarDefaultCharExpr
| DELIM  EQUALS  scalarDefaultCharExpr
| END  EQUALS  label
| EOR  EQUALS  label
| ERR  EQUALS  label
| ID  EQUALS  scalarIntVariable
| IOMSG  EQUALS  iomsgVariable
| IOSTAT  EQUALS  scalarIntVariable
| PAD  EQUALS  scalarDefaultCharExpr
| POS  EQUALS  scalarIntExpr
| REC  EQUALS  scalarIntExpr
| ROUND  EQUALS  scalarDefaultCharExpr
| SIGN  EQUALS  scalarDefaultCharExpr
| SIZE  EQUALS  scalarIntVariable
;
// R603
designator : 
objectName
| arrayElement
| arraySection
| structureComponent
| substring
;
// R622
vectorSubscript : 
intExpr
;
// R623
allocateStmt : 
ALLOCATE  LEFTPAR    (   typeSpec  DOUBLECOLON    )?   allocationList
  (   COMMA   allocOptList   )?    RIGHTPAR 
Newline
;
// R620
subscriptTriplet : 
  (   subscript   )?    COLON    (   subscript   )?     (    COLON  stride   )?  
;
// R621
stride : 
scalarIntExpr
;
// R626
errmsgVariable : 
scalarDefaultCharVariable
;
// R627
sourceExpr : 
expr
;
// R624
allocOpt : 
STAT  EQUALS  statVariable
| ERRMSG  EQUALS  errmsgVariable
| SOURCE  EQUALS  sourceExpr
;
// R625
statVariable : 
scalarIntVariable
;
// R628
allocation : 
allocateObject   (    LEFTPAR  allocateShapeSpecList  RIGHTPAR    )?  
;
// R629
allocateObject : 
variableName
| structureComponent
;
// R930
inquireSpec : 
  (   UNIT  EQUALS    )?   fileUnitNumber
| FILE  EQUALS  fileNameExpr
| ACCESS  EQUALS  scalarDefaultCharVariable
| ACTION  EQUALS  scalarDefaultCharVariable
| ASYNCHRONOUS  EQUALS  scalarDefaultCharVariable
| BLANK  EQUALS  scalarDefaultCharVariable
| DECIMAL  EQUALS  scalarDefaultCharVariable
| DELIM  EQUALS  scalarDefaultCharVariable
| DIRECT  EQUALS  scalarDefaultCharVariable
| ENCODING  EQUALS  scalarDefaultCharVariable
| ERR  EQUALS  label
| EXIST  EQUALS  scalarDefaultLogicalVariable
| FORM  EQUALS  scalarDefaultCharVariable
| FORMATTED  EQUALS  scalarDefaultCharVariable
| ID  EQUALS  scalarIntExpr
| IOMSG  EQUALS  iomsgVariable
| IOSTAT  EQUALS  scalarIntVariable
| NAME  EQUALS  scalarDefaultCharVariable
| NAMED  EQUALS  scalarDefaultLogicalVariable
| NEXTREC  EQUALS  scalarIntVariable
| NUMBER  EQUALS  scalarIntVariable
| OPENED  EQUALS  scalarDefaultLogicalVariable
| PAD  EQUALS  scalarDefaultCharVariable
| PENDING  EQUALS  scalarDefaultLogicalVariable
| POS  EQUALS  scalarIntVariable
| POSITION  EQUALS  scalarDefaultCharVariable
| READ  EQUALS  scalarDefaultCharVariable
| READWRITE  EQUALS  scalarDefaultCharVariable
| RECL  EQUALS  scalarIntVariable
| ROUND  EQUALS  scalarDefaultCharVariable
| SEQUENTIAL  EQUALS  scalarDefaultCharVariable
| SIGN  EQUALS  scalarDefaultCharVariable
| SIZE  EQUALS  scalarIntVariable
| STREAM  EQUALS  scalarDefaultCharVariable
| UNFORMATTED  EQUALS  scalarDefaultCharVariable
| WRITE  EQUALS  scalarDefaultCharVariable
;
// R1017
roundEditDesc : 
RU
| RD
| RZ
| RN
| RC
| RP
;
// R850
stopCode : 
scalarCharConstant
| digit   (   digit   (   digit   (   digit   (   digit   )?     )?     )?     )?  
;
// R902
fileUnitNumber : 
scalarIntExpr
;
// R1013
positionEditDesc : 
T n
| TL n
| TR n
| n X
;
// R1012
k : 
signedIntLiteralConstant
;
// R1101
mainProgram : 
  programStmt  
  specificationPart  
  (executionPart)?
  (internalSubprogramPart)?
endProgramStmt
;
// R1103
endProgramStmt : 
END   (   PROGRAM   (   programName   )?     )?  
Newline
;
// R1102
programStmt : 
PROGRAM programName
Newline
;
// R1105
moduleStmt : 
MODULE moduleName
Newline
;
// R1104
module : 
moduleStmt
  specificationPart
  moduleSubprogramPart
endModuleStmt
;
// R1107
moduleSubprogramPart : 
containsStmt
moduleSubprogram
  (   moduleSubprogram  )* 
;
// R1106
endModuleStmt : 
END   (   MODULE   (   moduleName   )?     )?  
Newline
;
// R1109
useStmt : 
USE   (     (    COMMA   moduleNature   )?    DOUBLECOLON    )?   moduleName   (    COMMA   renameList   )?  Newline
| USE   (     (    COMMA   moduleNature   )?    DOUBLECOLON    )?   moduleName  COMMA  
ONLY  COLON    (   onlyList   )?  
Newline
;
// R1108
moduleSubprogram : 
functionSubprogram
| subroutineSubprogram
;
// R808
caseConstruct : 
selectCaseStmt
  (   caseStmt
block  )* 
endSelectStmt
;
// R809
selectCaseStmt : 
  (   caseConstructName  COLON    )?   SELECT CASE  LEFTPAR  caseExpr  RIGHTPAR 
Newline
;
// R802
ifConstruct : 
ifThenStmt
block
  (   elseIfStmt
block  )* 
  (   elseStmt
block   )?  
endIfStmt
;
// R803
ifThenStmt : 
  (   ifConstructName  COLON    )?   IF  LEFTPAR  scalarLogicalExpr  RIGHTPAR  THEN
Newline
;
// R801
block : 
  (   executionPartConstruct  )* 
;
// R806
endIfStmt : 
END IF   (   ifConstructName   )?  
Newline
;
// R807
ifStmt : 
IF  LEFTPAR  scalarLogicalExpr  RIGHTPAR  actionStmt
Newline
;
// R804
elseIfStmt : 
ELSE IF  LEFTPAR  scalarLogicalExpr  RIGHTPAR  THEN   (   ifConstructName   )?  
Newline
;
// R805
elseStmt : 
ELSE   (   ifConstructName   )?  
Newline
;
// R525
dataStmtSet : 
dataStmtObjectList  FORWARDSLASH  dataStmtValueList  FORWARDSLASH 
;
// R734
assignmentStmt : 
variable  EQUALS  expr
Newline
;
// R527
dataImpliedDo : 
 LEFTPAR  dataIDoObjectList  COMMA   dataIDoVariable  EQUALS 
scalarIntExpr  COMMA   scalarIntExpr   (    COMMA   scalarIntExpr   )?    RIGHTPAR 
;
// R526
dataStmtObject : 
variable
| dataImpliedDo
;
// R521
asynchronousStmt : 
ASYNCHRONOUS   (    DOUBLECOLON    )?   objectNameList
Newline
;
// R520
allocatableStmt : 
ALLOCATABLE   (    DOUBLECOLON    )?  
objectName   (    LEFTPAR  deferredShapeSpecList  RIGHTPAR    )?  
  (    COMMA   objectName   (    LEFTPAR  deferredShapeSpecList  RIGHTPAR    )?    )* 
Newline
;
// R523
bindEntity : 
entityName
|  FORWARDSLASH  commonBlockName  FORWARDSLASH 
;
// R735
pointerAssignmentStmt : 
dataPointerObject   (    LEFTPAR boundsSpecList RIGHTPAR    )?    ARROW  dataTarget
| dataPointerObject  LEFTPAR boundsRemappingList  RIGHTPAR   ARROW  dataTarget
| procPointerObject  ARROW  procTarget
Newline
;
// R529
dataIDoVariable : 
scalarIntVariable
;
// R528
dataIDoObject : 
arrayElement
| scalarStructureComponent
| dataImpliedDo
;
// R921
waitStmt : 
WAIT  LEFTPAR waitSpecList RIGHTPAR 
Newline
;
// R1208
dtioGenericSpec : 
READ  LEFTPAR FORMATTED RIGHTPAR 
| READ  LEFTPAR UNFORMATTED RIGHTPAR 
| WRITE  LEFTPAR FORMATTED RIGHTPAR 
| WRITE  LEFTPAR UNFORMATTED RIGHTPAR 
;
// R1209
importStmt : 
IMPORT   (    (    DOUBLECOLON    )?   importNameList   )?  
Newline
;
// R634
pointerObject : 
variableName
| structureComponent
| procPointerName
;
// R1202
interfaceSpecification : 
interfaceBody
| procedureStmt
;
// R1203
interfaceStmt : 
INTERFACE   (   genericSpec   )?  
| ABSTRACT INTERFACE
Newline
;
// R1201
interfaceBlock : 
interfaceStmt
  (   interfaceSpecification  )* 
endInterfaceStmt
;
// R1206
procedureStmt : 
  (   MODULE   )?   PROCEDURE procedureNameList
Newline
;
// R1207
genericSpec : 
genericName
| OPERATOR  LEFTPAR  definedOperator  RIGHTPAR 
| ASSIGNMENT  LEFTPAR   EQUALS   RIGHTPAR 
| dtioGenericSpec
;
// R1204
endInterfaceStmt : 
END INTERFACE   (   genericSpec   )?  
Newline
;
// R1205
interfaceBody : 
functionStmt
  specificationPart
endFunctionStmt
| subroutineStmt
  specificationPart
endSubroutineStmt
;
// R636
deallocOpt : 
STAT  EQUALS  statVariable
| ERRMSG  EQUALS  errmsgVariable
;
// R925
rewindStmt : 
REWIND fileUnitNumber
| REWIND  LEFTPAR  positionSpecList  RIGHTPAR 
Newline
;
// R739
dataTarget : 
variable
| expr
;
// R411
bozLiteralConstant : 
binaryConstant
| octalConstant
| hexConstant
;
// R410
sign : 
 PLUS 
| MINUS
;
// R413
octalConstant : 
O  QUOTE  digit   (   digit  )*   QUOTE 
| O  DOUBLEQUOTE  digit   (   digit  )*   DOUBLEQUOTE 
;
// R412
binaryConstant : 
B  QUOTE  digit   (   digit  )*   QUOTE 
| B  DOUBLEQUOTE  digit   (   digit  )*   DOUBLEQUOTE 
;
// R415
hexDigit : 
digit
| A
| B
| C
| D
| E
| F
;
// R414
hexConstant : 
Z  QUOTE  hexDigit   (   hexDigit  )*   QUOTE 
| Z  DOUBLEQUOTE  hexDigit   (   hexDigit  )*   DOUBLEQUOTE 
;
// R417
realLiteralConstant : 
significand   (   exponentLetter exponent   )?     (   kindParam   )?  
| digitString exponentLetter exponent   (   kindParam   )?  
;
// R416
signedRealLiteralConstant : 
  (   sign   )?   realLiteralConstant
;
// R419
exponentLetter : 
E
| D
;
// R418
significand : 
digitString  PERIOD    (   digitString   )?  
|  PERIOD  digitString
;
// R926
positionSpec : 
  (   UNIT  EQUALS    )?   fileUnitNumber
| IOMSG  EQUALS  iomsgVariable
| IOSTAT  EQUALS  scalarIntVariable
| ERR  EQUALS  label
;
// R460
enumDef : 
enumDefStmt
enumeratorDefStmt
  (   enumeratorDefStmt  )* 
endEnumStmt
;
// R708
multOp : 
 ASTERISK 
|  FORWARDSLASH 
;
// R464
endEnumStmt : 
END ENUM
Newline
;
// R465
arrayConstructor : 
 LEFTARRAYPAR  acSpec  RIGHTARRAYPAR 
| leftSquareBracket acSpec rightSquareBracket
;
// R466
acSpec : 
typeSpec  DOUBLECOLON 
|   (  typeSpec  DOUBLECOLON   )?   acValueList
;
// R467
leftSquareBracket : 
LEFTSQUARE
;
// R709
addOp : 
 PLUS 
| MINUS
;
// R461
enumDefStmt : 
ENUM COMMA   BIND LEFTPAR C RIGHTPAR 
Newline
;
// R462
enumeratorDefStmt : 
ENUMERATOR   (    DOUBLECOLON    )?   enumeratorList
Newline
;
// R463
enumerator : 
namedConstant   (    EQUALS  scalarIntInitializationExpr   )?  
;
// R705
addOperand : 
  multOperand (   multOp  addOperand  )?
;
// R704
multOperand : 
level1Expr   (   powerOp multOperand   )?  
;
// R707
powerOp : 
 DOUBLEASTERISK 
;
// R706
level2Expr : 
  ( addOp )? addOperand ( addOp  level2Expr )?
;
// R468
rightSquareBracket : 
RIGHTSQUARE
;
// R469
acValue : 
expr
| acImpliedDo
;
// R703
definedUnaryOp : 
 PERIOD  letter   (   letter  )*   PERIOD 
;
// R702
level1Expr : 
  (   definedUnaryOp   )?   primary
;
// R1019
charStringEditDesc : 
charLiteralConstant
;
// R701
primary : 
constant
| designator
| arrayConstructor
| structureConstructor
| functionReference
| typeParamInquiry
| typeParamName
|  LEFTPAR  expr  RIGHTPAR 
;
// R1018
decimalEditDesc : 
DC
| DP
;
// R848
continueStmt : 
CONTINUE
Newline
;
// R849
stopStmt : 
STOP   (   stopCode   )?  
Newline
;
// R846
computedGotoStmt : 
GO TO  LEFTPAR  labelList  RIGHTPAR    (    COMMA     )?   scalarIntExpr
Newline
;
// R847
arithmeticIfStmt : 
IF  LEFTPAR  scalarNumericExpr  RIGHTPAR  label  COMMA   label  COMMA   label
Newline
;
// R844
exitStmt : 
EXIT   (   doConstructName   )?  
Newline
;
// R845
gotoStmt : 
GO TO label
Newline
;
// R842
doTermSharedStmt : 
actionStmt
Newline
;
// R843
cycleStmt : 
CYCLE   (   doConstructName   )?  
Newline
;
// R840
sharedTermDoConstruct : 
outerSharedDoConstruct
| innerSharedDoConstruct
;
// R841
innerSharedDoConstruct : 
labelDoStmt
doBody
doTermSharedStmt
;
// R201
program : 
programUnit
  (   programUnit  )* 
;
// R202
programUnit : 
mainProgram
| externalSubprogram
| module
| blockData
;
// R203
externalSubprogram : 
functionSubprogram
| subroutineSubprogram
;
// R204
specificationPart : 
  (   useStmt  )* 
  (   importStmt  )* 
  (   implicitPart   )?  
  (   declarationConstruct  )* 
;
// R205
implicitPart : 
  (   implicitPartStmt  )* 
implicitStmt
;
// R206
implicitPartStmt : 
implicitStmt
| parameterStmt
| formatStmt
| entryStmt
Newline
;
// R207
declarationConstruct : 
derivedTypeDef
| entryStmt
| enumDef
| formatStmt
| interfaceBlock
| parameterStmt
| procedureDeclarationStmt
| specificationStmt
| typeDeclarationStmt
| stmtFunctionStmt
;
// R208
executionPart : 
executableConstruct
  (   executionPartConstruct  )* 
;
// R209
executionPartConstruct : 
executableConstruct
| formatStmt
| entryStmt
| dataStmt
;
// R1016
blankInterpEditDesc : 
BN
| BZ
;
// R633
nullifyStmt : 
NULLIFY  LEFTPAR  pointerObjectList  RIGHTPAR 
Newline
;
// R518
accessStmt : 
accessSpec   (     (    DOUBLECOLON    )?   accessIdList   )?  
Newline
;
// R519
accessId : 
useName
| genericSpec
;
// R514
assumedShapeSpec : 
  (   lowerBound   )?    COLON 
;
// R515
deferredShapeSpec : 
 COLON 
;
// R516
assumedSizeSpec : 
  (   explicitShapeSpecList  COMMA     )?     (   lowerBound  COLON    )?    ASTERISK 
;
// R517
intentSpec : 
IN
| OUT
| INOUT
;
// R510
arraySpec : 
explicitShapeSpecList
| assumedShapeSpecList
| deferredShapeSpecList
| assumedSizeSpec
;
// R511
explicitShapeSpec : 
  (   lowerBound  COLON    )?   upperBound
;
// R512
lowerBound : 
specificationExpr
;
// R513
upperBound : 
specificationExpr
;
// R738
boundsRemapping : 
lowerBoundExpr  COLON  upperBoundExpr
;
// R1112
only : 
genericSpec
| onlyUseName
| rename
;
// R1113
onlyUseName : 
useName
;
// R1110
moduleNature : 
INTRINSIC
| NON INTRINSIC
;
// R741
procComponentRef : 
variable  PERCENT  procedureComponentName
;
// R740
procPointerObject : 
procPointerName
| procComponentRef
;
// R743
whereStmt : 
WHERE  LEFTPAR  maskExpr  RIGHTPAR  whereAssignmentStmt
Newline
;
// R742
procTarget : 
expr
| procedureName
| procComponentRef
;
// R745
whereConstructStmt : 
  (  whereConstructName COLON   )?   WHERE  LEFTPAR  maskExpr  RIGHTPAR 
Newline
;
// R744
whereConstruct : 
whereConstructStmt
  (   whereBodyConstruct  )* 
  (   maskedElsewhereStmt
  (   whereBodyConstruct  )*   )* 
  (   elsewhereStmt
  (   whereBodyConstruct  )*    )?  
endWhereStmt
;
// R747
whereAssignmentStmt : 
assignmentStmt
Newline
;
// R746
whereBodyConstruct : 
whereAssignmentStmt
| whereStmt
| whereConstruct
;
// R749
maskedElsewhereStmt : 
ELSEWHERE  LEFTPAR maskExpr RIGHTPAR    (  whereConstructName  )?  
Newline
;
// R748
maskExpr : 
logicalExpr
;
// R1111
rename : 
localName  ARROW  useName
| OPERATOR  LEFTPAR localDefinedOperator RIGHTPAR   ARROW 
OPERATOR  LEFTPAR useDefinedOperator RIGHTPAR 
;
// R428
logicalLiteralConstant : 
 PERIOD TRUE PERIOD    (   kindParam   )?  
|  PERIOD FALSE PERIOD    (   kindParam   )?  
;
// R429
derivedTypeDef : 
derivedTypeStmt
  (   typeParamDefStmt  )* 
  (   privateOrSequence  )* 
  componentPart  
  (   typeBoundProcedurePart   )?  
endTypeStmt
;
// R1114
localDefinedOperator : 
definedUnaryOp
| definedBinaryOp
;
// R420
exponent : 
signedDigitString
;
// R421
complexLiteralConstant : 
 LEFTPAR  realPart  COMMA   imagPart  RIGHTPAR 
;
// R422
realPart : 
signedIntLiteralConstant
| signedRealLiteralConstant
| namedConstant
;
// R423
imagPart : 
signedIntLiteralConstant
| signedRealLiteralConstant
| namedConstant
;
// R424
charSelector : 
lengthSelector
|  LEFTPAR  LEN  EQUALS  typeParamValue  COMMA  
KIND  EQUALS  scalarIntInitializationExpr  RIGHTPAR 
|  LEFTPAR  typeParamValue  COMMA  
  (   KIND  EQUALS    )?   scalarIntInitializationExpr  RIGHTPAR 
|  LEFTPAR  KIND  EQUALS  scalarIntInitializationExpr
  (    COMMA   LEN  EQUALS typeParamValue   )?    RIGHTPAR 
;
// R425
lengthSelector : 
 LEFTPAR    (   LEN  EQUALS    )?   typeParamValue  RIGHTPAR 
|  ASTERISK  charLength   (    COMMA     )?  
;
// R426
charLength : 
 LEFTPAR  typeParamValue  RIGHTPAR 
| scalarIntLiteralConstant
;
// R427
charLiteralConstant : 
  (   kindParam   )?    QUOTE    (   repChar  )*   QUOTE 
|   (   kindParam   )?    DOUBLEQUOTE    (   repChar  )*   DOUBLEQUOTE 
;
// R1116
blockData : 
blockDataStmt
  specificationPart
endBlockDataStmt
;
// R1117
blockDataStmt : 
BLOCK DATA   (   blockDataName   )?  
Newline
;
// R929
inquireStmt : 
INQUIRE  LEFTPAR  inquireSpecList  RIGHTPAR 
| INQUIRE  LEFTPAR  IOLENGTH  EQUALS  scalarIntVariable  RIGHTPAR 
outputItemList
Newline
;
// R928
flushSpec : 
  (  UNIT  EQUALS   )?   fileUnitNumber
| IOSTAT  EQUALS  scalarIntVariable
| IOMSG  EQUALS  iomsgVariable
| ERR  EQUALS  label
;
// R736
dataPointerObject : 
variableName
| variable  PERCENT  dataPointerComponentName
;
// R737
boundsSpec : 
lowerBoundExpr  COLON 
;
// R730
initializationExpr : 
expr
;
// R731
charInitializationExpr : 
charExpr
;
// R732
intInitializationExpr : 
intExpr
;
// R733
logicalInitializationExpr : 
logicalExpr
;
// R635
deallocateStmt : 
DEALLOCATE  LEFTPAR  allocateObjectList   (    COMMA   deallocOptList   )?    RIGHTPAR 
Newline
;
// R920
dtvTypeSpec : 
TYPE LEFTPAR  derivedTypeSpec  RIGHTPAR 
| CLASS LEFTPAR  derivedTypeSpec  RIGHTPAR 
;
// R923
backspaceStmt : 
BACKSPACE fileUnitNumber
| BACKSPACE  LEFTPAR  positionSpecList  RIGHTPAR 
Newline
;
// R922
waitSpec : 
  (   UNIT  EQUALS    )?   fileUnitNumber
| END  EQUALS  label
| EOR  EQUALS  label
| ERR  EQUALS  label
| ID  EQUALS  scalarIntExpr
| IOMSG  EQUALS  iomsgVariable
| IOSTAT  EQUALS  scalarIntVariable
;
// R631
lowerBoundExpr : 
scalarIntExpr
;
// R924
endfileStmt : 
ENDFILE fileUnitNumber
| ENDFILE  LEFTPAR  positionSpecList  RIGHTPAR 
Newline
;
// R927
flushStmt : 
FLUSH fileUnitNumber
| FLUSH  LEFTPAR  flushSpecList  RIGHTPAR 
Newline
;
// R632
upperBoundExpr : 
scalarIntExpr
;
// R910
readStmt : 
READ  LEFTPAR  ioControlSpecList  RIGHTPAR    (   inputItemList   )?  
| READ fformat   (    COMMA   inputItemList   )?  
Newline
;
// R1115
useDefinedOperator : 
definedUnaryOp
| definedBinaryOp
;
// R815
caseValue : 
scalarIntInitializationExpr
| scalarCharInitializationExpr
| scalarLogicalInitializationExpr
;
// R814
caseValueRange : 
caseValue
| caseValue  COLON 
|  COLON  caseValue
| caseValue  COLON  caseValue
;
// R817
associateStmt : 
  (   associateConstructName  COLON    )?   ASSOCIATE
 LEFTPAR associationList  RIGHTPAR 
Newline
;
// R816
associateConstruct : 
associateStmt
block
endAssociateStmt
;
// R811
endSelectStmt : 
END SELECT   (   caseConstructName   )?  
Newline
;
// R810
caseStmt : 
CASE caseSelector   (  caseConstructName  )?  
Newline
;
// R813
caseSelector : 
 LEFTPAR  caseValueRangeList  RIGHTPAR 
| DEFAULT
;
// R812
caseExpr : 
scalarIntExpr
| scalarCharExpr
| scalarLogicalExpr
;
// R1118
endBlockDataStmt : 
END   (   BLOCK DATA   (   blockDataName   )?     )?  
Newline
;
// R819
selector : 
expr
| variable
;
// R818
association : 
associateName  ARROW  selector
;
// R630
allocateShapeSpec : 
  (   lowerBoundExpr  COLON    )?   upperBoundExpr
;
// Keywords
keywordToken : NEQV FORMAT GENERIC BN EQUIVALENCE EOR PROTECTED PAD FILE UNFORMATTED TRUE POSITION BZ RU NAMED SUBROUTINE OPENED DELIM LT RZ RD SOURCE RC ACTION IMPORT RN BLOCK GT ENUM OVERRIDABLE MODULE EQV GE EXTENDS PASS GO ENTRY WHERE PROCEDURE NAME DOUBLE CONTAINS LOGICAL CLASS NEXTREC DEFERRED ONLY EXIST INTERFACE SAVE OR ADVANCE STAT RETURN READWRITE ASSIGNMENT IOSTAT FORMATTED COMPLEX ASYNCHRONOUS REC PRINT END ROUND SELECT NULLIFY KIND COMMON BLANK IOLENGTH INTEGER DEALLOCATE FUNCTION EN ENUMERATOR RECURSIVE SEQUENCE INQUIRE FLUSH ELSE INTENT RESULT OPERATOR RP EQ UNIT SIZE AND NON DC TYPE PRECISION PENDING CONTINUE NOT EXTERNAL REAL THEN STREAM NAMELIST DEFAULT STOP WHILE PROGRAM EXIT OPEN CASE ERR OPTIONAL NE ID ES FORALL CLOSE READ OUT NOPASS FMT ELEMENTAL DIRECT WRITE ELSEWHERE WAIT FALSE TARGET SS SP LEN VOLATILE REWIND BACKSPACE NML INTRINSIC PUBLIC ERRMSG DO USE RECL ENCODING ABSTRACT CHARACTER NUMBER ENDFILE DT PARAMETER DP LE DATA IMPLICIT TR POS PRIVATE FINAL TO TL SEQUENTIAL ALLOCATE DECIMAL CYCLE STATUS IOMSG FORM IS NONE VALUE IN SIGN DIMENSION IF ASSOCIATE BIND ALLOCATABLE ACCESS CALL PURE POINTER INOUT;
NEQV : N E Q V;
FORMAT : F O R M A T;
GENERIC : G E N E R I C;
BN : B N;
EQUIVALENCE : E Q U I V A L E N C E;
EOR : E O R;
PROTECTED : P R O T E C T E D;
PAD : P A D;
FILE : F I L E;
UNFORMATTED : U N F O R M A T T E D;
TRUE : T R U E;
POSITION : P O S I T I O N;
BZ : B Z;
RU : R U;
NAMED : N A M E D;
SUBROUTINE : S U B R O U T I N E;
OPENED : O P E N E D;
DELIM : D E L I M;
LT : L T;
RZ : R Z;
RD : R D;
SOURCE : S O U R C E;
RC : R C;
ACTION : A C T I O N;
IMPORT : I M P O R T;
RN : R N;
BLOCK : B L O C K;
GT : G T;
ENUM : E N U M;
OVERRIDABLE : O V E R R I D A B L E;
MODULE : M O D U L E;
EQV : E Q V;
GE : G E;
EXTENDS : E X T E N D S;
PASS : P A S S;
GO : G O;
ENTRY : E N T R Y;
WHERE : W H E R E;
PROCEDURE : P R O C E D U R E;
NAME : N A M E;
DOUBLE : D O U B L E;
CONTAINS : C O N T A I N S;
LOGICAL : L O G I C A L;
CLASS : C L A S S;
NEXTREC : N E X T R E C;
DEFERRED : D E F E R R E D;
ONLY : O N L Y;
EXIST : E X I S T;
INTERFACE : I N T E R F A C E;
SAVE : S A V E;
OR : O R;
ADVANCE : A D V A N C E;
STAT : S T A T;
RETURN : R E T U R N;
READWRITE : R E A D W R I T E;
ASSIGNMENT : A S S I G N M E N T;
IOSTAT : I O S T A T;
FORMATTED : F O R M A T T E D;
COMPLEX : C O M P L E X;
ASYNCHRONOUS : A S Y N C H R O N O U S;
REC : R E C;
PRINT : P R I N T;
END : E N D;
ROUND : R O U N D;
SELECT : S E L E C T;
NULLIFY : N U L L I F Y;
KIND : K I N D;
COMMON : C O M M O N;
BLANK : B L A N K;
IOLENGTH : I O L E N G T H;
INTEGER : I N T E G E R;
DEALLOCATE : D E A L L O C A T E;
FUNCTION : F U N C T I O N;
EN : E N;
ENUMERATOR : E N U M E R A T O R;
RECURSIVE : R E C U R S I V E;
SEQUENCE : S E Q U E N C E;
INQUIRE : I N Q U I R E;
FLUSH : F L U S H;
ELSE : E L S E;
INTENT : I N T E N T;
RESULT : R E S U L T;
OPERATOR : O P E R A T O R;
RP : R P;
EQ : E Q;
UNIT : U N I T;
SIZE : S I Z E;
AND : A N D;
NON : N O N;
DC : D C;
TYPE : T Y P E;
PRECISION : P R E C I S I O N;
PENDING : P E N D I N G;
CONTINUE : C O N T I N U E;
NOT : N O T;
EXTERNAL : E X T E R N A L;
REAL : R E A L;
THEN : T H E N;
STREAM : S T R E A M;
NAMELIST : N A M E L I S T;
DEFAULT : D E F A U L T;
STOP : S T O P;
WHILE : W H I L E;
PROGRAM : P R O G R A M;
EXIT : E X I T;
OPEN : O P E N;
CASE : C A S E;
ERR : E R R;
OPTIONAL : O P T I O N A L;
NE : N E;
ID : I D;
ES : E S;
FORALL : F O R A L L;
CLOSE : C L O S E;
READ : R E A D;
OUT : O U T;
NOPASS : N O P A S S;
FMT : F M T;
ELEMENTAL : E L E M E N T A L;
DIRECT : D I R E C T;
WRITE : W R I T E;
ELSEWHERE : E L S E W H E R E;
WAIT : W A I T;
FALSE : F A L S E;
TARGET : T A R G E T;
SS : S S;
SP : S P;
LEN : L E N;
VOLATILE : V O L A T I L E;
REWIND : R E W I N D;
BACKSPACE : B A C K S P A C E;
NML : N M L;
INTRINSIC : I N T R I N S I C;
PUBLIC : P U B L I C;
ERRMSG : E R R M S G;
DO : D O;
USE : U S E;
RECL : R E C L;
ENCODING : E N C O D I N G;
ABSTRACT : A B S T R A C T;
CHARACTER : C H A R A C T E R;
NUMBER : N U M B E R;
ENDFILE : E N D F I L E;
DT : D T;
PARAMETER : P A R A M E T E R;
DP : D P;
LE : L E;
DATA : D A T A;
IMPLICIT : I M P L I C I T;
TR : T R;
POS : P O S;
PRIVATE : P R I V A T E;
FINAL : F I N A L;
TO : T O;
TL : T L;
SEQUENTIAL : S E Q U E N T I A L;
ALLOCATE : A L L O C A T E;
DECIMAL : D E C I M A L;
CYCLE : C Y C L E;
STATUS : S T A T U S;
IOMSG : I O M S G;
FORM : F O R M;
IS : I S;
NONE : N O N E;
VALUE : V A L U E;
IN : I N;
SIGN : S I G N;
DIMENSION : D I M E N S I O N;
IF : I F;
ASSOCIATE : A S S O C I A T E;
BIND : B I N D;
ALLOCATABLE : A L L O C A T A B L E;
ACCESS : A C C E S S;
CALL : C A L L;
PURE : P U R E;
POINTER : P O I N T E R;
INOUT : I N O U T;
// Lists
equivalenceObjectList :  equivalenceObject  ( COMMA  equivalenceObject  )* ;
implicitSpecList :  implicitSpec  ( COMMA  implicitSpec  )* ;
associationList :  association  ( COMMA  association  )* ;
boundsSpecList :  boundsSpec  ( COMMA  boundsSpec  )* ;
bindEntityList :  bindEntity  ( COMMA  bindEntity  )* ;
closeSpecList :  closeSpec  ( COMMA  closeSpec  )* ;
boundsRemappingList :  boundsRemapping  ( COMMA  boundsRemapping  )* ;
savedEntityList :  savedEntity  ( COMMA  savedEntity  )* ;
assumedShapeSpecList :  assumedShapeSpec  ( COMMA  assumedShapeSpec  )* ;
deferredShapeSpecList :  deferredShapeSpec  ( COMMA  deferredShapeSpec  )* ;
bindingAttrList :  bindingAttr  ( COMMA  bindingAttr  )* ;
acValueList :  acValue  ( COMMA  acValue  )* ;
renameList :  rename  ( COMMA  rename  )* ;
intrinsicProcedureNameList :  intrinsicProcedureName  ( COMMA  intrinsicProcedureName  )* ;
procDeclList :  procDecl  ( COMMA  procDecl  )* ;
equivalenceSetList :  equivalenceSet  ( COMMA  equivalenceSet  )* ;
entityDeclList :  entityDecl  ( COMMA  entityDecl  )* ;
typeAttrSpecList :  typeAttrSpec  ( COMMA  typeAttrSpec  )* ;
outputItemList :  outputItem  ( COMMA  outputItem  )* ;
accessIdList :  accessId  ( COMMA  accessId  )* ;
deallocOptList :  deallocOpt  ( COMMA  deallocOpt  )* ;
dataStmtValueList :  dataStmtValue  ( COMMA  dataStmtValue  )* ;
typeParamDeclList :  typeParamDecl  ( COMMA  typeParamDecl  )* ;
sectionSubscriptList :  sectionSubscript  ( COMMA  sectionSubscript  )* ;
inquireSpecList :  inquireSpec  ( COMMA  inquireSpec  )* ;
formatItemList :  formatItem  ( COMMA  formatItem  )* ;
ioControlSpecList :  ioControlSpec  ( COMMA  ioControlSpec  )* ;
allocateObjectList :  allocateObject  ( COMMA  allocateObject  )* ;
flushSpecList :  flushSpec  ( COMMA  flushSpec  )* ;
namedConstantDefList :  namedConstantDef  ( COMMA  namedConstantDef  )* ;
typeParamSpecList :  typeParamSpec  ( COMMA  typeParamSpec  )* ;
commonBlockObjectList :  commonBlockObject  ( COMMA  commonBlockObject  )* ;
dataStmtObjectList :  dataStmtObject  ( COMMA  dataStmtObject  )* ;
componentDeclList :  componentDecl  ( COMMA  componentDecl  )* ;
positionSpecList :  positionSpec  ( COMMA  positionSpec  )* ;
dataIDoObjectList :  dataIDoObject  ( COMMA  dataIDoObject  )* ;
allocOptList :  allocOpt  ( COMMA  allocOpt  )* ;
vList :  v  ( COMMA  v  )* ;
allocationList :  allocation  ( COMMA  allocation  )* ;
finalSubroutineNameList :  finalSubroutineName  ( COMMA  finalSubroutineName  )* ;
typeParamNameList :  typeParamName  ( COMMA  typeParamName  )* ;
entityNameList :  entityName  ( COMMA  entityName  )* ;
caseValueRangeList :  caseValueRange  ( COMMA  caseValueRange  )* ;
labelList :  label  ( COMMA  label  )* ;
dummyArgList :  dummyArg  ( COMMA  dummyArg  )* ;
componentAttrSpecList :  componentAttrSpec  ( COMMA  componentAttrSpec  )* ;
pointerObjectList :  pointerObject  ( COMMA  pointerObject  )* ;
connectSpecList :  connectSpec  ( COMMA  connectSpec  )* ;
componentSpecList :  componentSpec  ( COMMA  componentSpec  )* ;
forallTripletSpecList :  forallTripletSpec  ( COMMA  forallTripletSpec  )* ;
externalNameList :  externalName  ( COMMA  externalName  )* ;
enumeratorList :  enumerator  ( COMMA  enumerator  )* ;
namelistGroupObjectList :  namelistGroupObject  ( COMMA  namelistGroupObject  )* ;
importNameList :  importName  ( COMMA  importName  )* ;
ioImpliedDoObjectList :  ioImpliedDoObject  ( COMMA  ioImpliedDoObject  )* ;
procedureNameList :  procedureName  ( COMMA  procedureName  )* ;
procComponentAttrSpecList :  procComponentAttrSpec  ( COMMA  procComponentAttrSpec  )* ;
bindingNameList :  bindingName  ( COMMA  bindingName  )* ;
actualArgSpecList :  actualArgSpec  ( COMMA  actualArgSpec  )* ;
explicitShapeSpecList :  explicitShapeSpec  ( COMMA  explicitShapeSpec  )* ;
pointerDeclList :  pointerDecl  ( COMMA  pointerDecl  )* ;
dummyArgNameList :  dummyArgName  ( COMMA  dummyArgName  )* ;
onlyList :  only  ( COMMA  only  )* ;
allocateShapeSpecList :  allocateShapeSpec  ( COMMA  allocateShapeSpec  )* ;
waitSpecList :  waitSpec  ( COMMA  waitSpec  )* ;
objectNameList :  objectName  ( COMMA  objectName  )* ;
letterSpecList :  letterSpec  ( COMMA  letterSpec  )* ;
inputItemList :  inputItem  ( COMMA  inputItem  )* ;
// Names
arrayName : name ;
entityName : name ;
resultName : name ;
commonBlockName : name ;
typeName : name ;
intrinsicProcedureName : name ;
bindingName : name ;
typeParamName : name ;
functionName : name ;
procEntityName : name ;
scalarVariableName : name ;
forallConstructName : name ;
entryName : name ;
dataPointerComponentName : name ;
caseConstructName : name ;
ifConstructName : name ;
selectConstructName : name ;
doConstructName : name ;
useName : name ;
indexName : name ;
procedureComponentName : name ;
componentName : name ;
scalarIntConstantName : name ;
procedureName : name ;
externalName : name ;
procedureEntityName : name ;
namelistGroupName : name ;
blockDataName : name ;
subroutineName : name ;
programName : name ;
whereConstructName : name ;
fileName : name ;
associateConstructName : name ;
importName : name ;
finalSubroutineName : name ;
moduleName : name ;
genericName : name ;
partName : name ;
associateName : name ;
parentTypeName : name ;
localName : name ;
argName : name ;
intConstantName: name;
// Scalars
scalarCharExpr :  charExpr  ;
scalarIntConstantSubobject :  intConstantSubobject  ;
scalarIntConstant :  intConstant  ;
scalarStructureComponent :  structureComponent  ;
scalarCharInitializationExpr :  charInitializationExpr  ;
scalarNumericExpr :  numericExpr  ;
scalarConstant :  constant  ;
scalarIntLiteralConstant :  intLiteralConstant  ;
scalarDefaultCharExpr :  defaultCharExpr  ;
scalarLogicalExpr :  logicalExpr  ;
scalarDefaultCharVariable :  defaultCharVariable  ;
scalarExpr :  expr  ;
scalarIntInitializationExpr :  intInitializationExpr  ;
scalarIntVariable :  intVariable  ;
scalarIntExpr :  intExpr  ;
scalarConstantSubobject :  constantSubobject  ;
scalarDefaultLogicalVariable :  defaultLogicalVariable  ;
scalarCharConstant :  charConstant  ;
scalarMaskExpr :  maskExpr  ;
scalarLogicalInitializationExpr :  logicalInitializationExpr  ;
DOUBLESLASH: '//';
DOUBLEASTERISK: '**';
SLASHEQUALS: '/=';
LESSEQUALS: '<=';
GREATEREQUALS: '>=';
RIGHTARRAYPAR: '/)';
DOUBLEEQUALS: '==';
ARROW: '=>';
LEFTARRAYPAR: '(/';
DOUBLEQUOTE: '"';
PERCENT: '%';
QUOTE: '\'';
RIGHTSQUARE: ']';
RIGHTPAR: ')';
LEFTPAR: '(';
PLUS: '+';
ASTERISK: '*';
MINUS: '-';
COMMA : ',';
FORWARDSLASH: '/';
PERIOD: '.';
DOUBLECOLON: '::';
LEFTSQUARE: '[';
SEMICOLON: ';';
COLON: ':';
EQUALS: '=';
LESS: '<';
UNDERSCORE: '_';
GREATER: '>';
// Et Cetera
A : [Aa] ;
B : [Bb] ;
C : [Cc] ;
D : [Dd] ;
E : [Ee] ;
F : [Ff] ;
G : [Gg] ;
H : [Hh] ;
I : [Ii] ;
J : [Jj] ;
K : [Kk] ;
L : [Ll] ;
M : [Mm] ;
N : [Nn] ;
O : [Oo] ;
P : [Pp] ;
Q : [Qq] ;
R : [Rr] ;
S : [Ss] ;
T : [Tt] ;
U : [Uu] ;
V : [Vv] ;
W : [Ww] ;
X : [Xx] ;
Y : [Yy] ;
Z : [Zz] ;
name: Name | keywordToken ;
Comment: '!' ~'\n'* '\n' -> skip ;
Whitespace : (' '|'\t')+ -> skip ;
Newline : ('\r'? '\n')+ ;
letter: Letter;
Letter: (A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z);
digit: Digit;
Digit: [0-9];
specialCharacter: SpecialCharacter;

SpecialCharacter: 
' ' | '=' | '+' | '-' | '*' | '/' | '\\' |
'(' | ')' | '[' | ']' | '{' | '}' | ',' |
'.' | ':' | ';' | '!' | '"' | '%' | '&' |
'~' | '<' | '>' | '?' | '\'' | '`' | '^' |
'|' | '$' | '#' | '@' 
;

AlphanumericCharacter : Letter|Digit ;
Name : Letter   (   AlphanumericCharacter  )* ;
repChar: RepChar;
RepChar: .;
