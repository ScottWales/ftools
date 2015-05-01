grammar fortran03;
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
keyNAMELIST
 FORWARDSLASH  namelistGroupName  FORWARDSLASH  namelistGroupObjectList
  (     (    COMMA     )?    FORWARDSLASH  namelistGroupName  FORWARDSLASH 
namelistGroupObjectList  )* 
;
// R553
namelistGroupObject : 
variableName
;
// R554
equivalenceStmt : 
keyEQUIVALENCE equivalenceSetList
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
keyCOMMON
  (    FORWARDSLASH    (   commonBlockName   )?    FORWARDSLASH    )?   commonBlockObjectList
  (     (    COMMA     )?    FORWARDSLASH    (   commonBlockName   )?    FORWARDSLASH 
commonBlockObjectList  )* 
;
// R558
commonBlockObject : 
variableName   (    LEFTPAR  explicitShapeSpecList  RIGHTPAR    )?  
| procPointerName
;
// R1237
containsStmt : 
keyCONTAINS
;
// R1236
returnStmt : 
keyRETURN   (   scalarIntExpr   )?  
;
// R1235
entryStmt : 
keyENTRY entryName   (    LEFTPAR    (   dummyArgList   )?    RIGHTPAR    (   suffix   )?     )?  
;
// R1234
endSubroutineStmt : 
keyEND   (   keySUBROUTINE   (   subroutineName   )?     )?  
;
// R1233
dummyArg : 
dummyArgName
|  ASTERISK 
;
// R1232
subroutineStmt : 
  (   prefix   )?   keySUBROUTINE subroutineName
  (    LEFTPAR    (   dummyArgList   )?    RIGHTPAR    (   procLanguageBindingSpec   )?     )?  
;
// R1231
subroutineSubprogram : 
subroutineStmt
  (   specificationPart   )?  
  (   executionPart   )?  
  (   internalSubprogramPart   )?  
endSubroutineStmt
;
// R1230
endFunctionStmt : 
keyEND   (   keyFUNCTION   (   functionName   )?     )?  
;
// R1238
stmtFunctionStmt : 
functionName  LEFTPAR    (   dummyArgNameList   )?    RIGHTPAR   EQUALS  scalarExpr
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
keyWRITE  LEFTPAR  ioControlSpecList  RIGHTPAR    (   outputItemList   )?  
;
// R912
printStmt : 
keyPRINT fformat   (    COMMA   outputItemList   )?  
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
keySS
| keySP
| keyS
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
| k keyP
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
| endFunctionStmt
| endProgramStmt
| endSubroutineStmt
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
;
// R828
labelDoStmt : 
  (   doConstructName  COLON    )?   keyDO label   (   loopControl   )?  
;
// R829
nonlabelDoStmt : 
  (   doConstructName  COLON    )?   keyDO   (   loopControl   )?  
;
// R824
endSelectTypeStmt : 
keyEND keySELECT   (   selectConstructName   )?  
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
;
// R820
endAssociateStmt : 
keyEND keyASSOCIATE   (   associateConstructName   )?  
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
  (   selectConstructName  COLON    )?   keySELECT keyTYPE
 LEFTPAR    (   associateName  ARROW    )?   selector  RIGHTPAR 
;
// R823
typeGuardStmt : 
keyTYPE keyIS  LEFTPAR  typeSpec  RIGHTPAR    (   selectConstructName   )?  
| keyCLASS keyIS  LEFTPAR  typeSpec  RIGHTPAR    (   selectConstructName   )?  
| keyCLASS keyDEFAULT   (   selectConstructName   )?  
;
// R509
languageBindingSpec : 
keyBIND  LEFTPAR keyC   (   COMMA   keyNAME  EQUALS  scalarCharInitializationExpr   )?   RIGHTPAR 
;
// R508
accessSpec : 
keyPUBLIC
| keyPRIVATE
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
| keyALLOCATABLE
| keyASYNCHRONOUS
| keyDIMENSION  LEFTPAR  arraySpec  RIGHTPAR 
| keyEXTERNAL
| keyINTENT  LEFTPAR  intentSpec  RIGHTPAR 
| keyINTRINSIC
| languageBindingSpec
| keyOPTIONAL
| keyPARAMETER
| keyPOINTER
| keyPROTECTED
| keySAVE
| keyTARGET
| keyVALUE
| keyVOLATILE
;
// R502
declarationTypeSpec : 
intrinsicTypeSpec
| keyTYPE  LEFTPAR  derivedTypeSpec  RIGHTPAR 
| keyCLASS  LEFTPAR  derivedTypeSpec  RIGHTPAR 
| keyCLASS  LEFTPAR   ASTERISK   RIGHTPAR 
;
// R501
typeDeclarationStmt : 
declarationTypeSpec   (     (    COMMA   attrSpec  )*   DOUBLECOLON    )?   entityDeclList
;
// R439
componentDefStmt : 
dataComponentDefStmt
| procComponentDefStmt
;
// R438
componentPart : 
  (   componentDefStmt  )* 
;
// R433
endTypeStmt : 
keyEND keyTYPE   (   typeName   )?  
;
// R432
privateOrSequence : 
privateComponentsStmt
| sequenceStmt
;
// R431
typeAttrSpec : 
accessSpec
| keyEXTENDS  LEFTPAR  parentTypeName  RIGHTPAR 
| keyABSTRACT
| keyBIND  LEFTPAR keyC RIGHTPAR 
;
// R430
derivedTypeStmt : 
keyTYPE   (     (    COMMA   typeAttrSpecList   )?    DOUBLECOLON    )?   typeName
  (    LEFTPAR  typeParamNameList  RIGHTPAR    )?  
;
// R437
typeParamAttrSpec : 
keyKIND
| keyLEN
;
// R436
typeParamDecl : 
typeParamName   (    EQUALS  scalarIntInitializationExpr   )?  
;
// R435
typeParamDefStmt : 
keyINTEGER   (   kindSelector   )?    COMMA   typeParamAttrSpec  DOUBLECOLON 
typeParamDeclList
;
// R434
sequenceStmt : 
keySEQUENCE
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
    level5Expr (   definedBinaryOp  expr )? 
;
// R721
equivOp : 
 PERIOD keyEQV PERIOD 
|  PERIOD keyNEQV PERIOD 
;
// R720
orOp : 
 PERIOD keyOR PERIOD 
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
keySAVE   (     (    DOUBLECOLON    )?   savedEntityList   )?  
;
// R542
protectedStmt : 
keyPROTECTED   (    DOUBLECOLON    )?   entityNameList
;
// R541
pointerDecl : 
objectName   (    LEFTPAR  deferredShapeSpecList  RIGHTPAR    )?  
| procEntityName
;
// R540
pointerStmt : 
keyPOINTER   (    DOUBLECOLON    )?   pointerDeclList
;
// R547
valueStmt : 
keyVALUE   (    DOUBLECOLON    )?   dummyArgNameList
;
// R546
targetStmt : 
keyTARGET   (    DOUBLECOLON    )?   objectName   (    LEFTPAR  arraySpec  RIGHTPAR    )?  
  (    COMMA   objectName   (    LEFTPAR  arraySpec  RIGHTPAR    )?    )* 
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
keyIMPLICIT implicitSpecList
| keyIMPLICIT keyNONE
;
// R548
volatileStmt : 
keyVOLATILE   (    DOUBLECOLON    )?   objectNameList
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
  (   specificationPart   )?  
  (   executionPart   )?  
  (   internalSubprogramPart   )?  
endFunctionStmt
;
// R1224
functionStmt : 
  (   prefix   )?   keyFUNCTION functionName
 LEFTPAR    (   dummyArgNameList   )?    RIGHTPAR    (   suffix   )?  
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
| keyRECURSIVE
| keyPURE
| keyELEMENTAL
;
// R1229
suffix : 
procLanguageBindingSpec   (   keyRESULT  LEFTPAR  resultName  RIGHTPAR    )?  
| keyRESULT  LEFTPAR  resultName  RIGHTPAR    (   procLanguageBindingSpec   )?  
;
// R524
dataStmt : 
keyDATA dataStmtSet   (     (    COMMA     )?   dataStmtSet  )* 
;
// R522
bindStmt : 
languageBindingSpec   (    DOUBLECOLON    )?   bindEntityList
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
;
// R441
componentAttrSpec : 
keyPOINTER
| keyDIMENSION  LEFTPAR  componentArraySpec  RIGHTPAR 
| keyALLOCATABLE
| accessSpec
;
// R446
procComponentAttrSpec : 
keyPOINTER
| keyPASS   (    LEFTPAR argName RIGHTPAR    )?  
| keyNOPASS
| accessSpec
;
// R447
privateComponentsStmt : 
keyPRIVATE
;
// R444
componentInitialization : 
 EQUALS  initializationExpr
|  ARROW  nullInit
;
// R445
procComponentDefStmt : 
keyPROCEDURE  LEFTPAR    (   procInterface   )?    RIGHTPAR   COMMA  
procComponentAttrSpecList  DOUBLECOLON  procDeclList
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
keyPRIVATE
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
  (   keyUNIT  EQUALS    )?   fileUnitNumber
| keyIOSTAT  EQUALS  scalarIntVariable
| keyIOMSG  EQUALS  iomsgVariable
| keyERR  EQUALS  label
| keySTATUS  EQUALS  scalarDefaultCharExpr
;
// R1003
fformatItem : 
  (   r   )?   dataEditDesc
| controlEditDesc
| charStringEditDesc
|   (   r   )?    LEFTPAR  fformatItemList  RIGHTPAR 
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
  (   keyUNIT  EQUALS    )?   fileUnitNumber
| keyACCESS  EQUALS  scalarDefaultCharExpr
| keyACTION  EQUALS  scalarDefaultCharExpr
| keyASYNCHRONOUS  EQUALS  scalarDefaultCharExpr
| keyBLANK  EQUALS  scalarDefaultCharExpr
| keyDECIMAL  EQUALS  scalarDefaultCharExpr
| keyDELIM  EQUALS  scalarDefaultCharExpr
| keyENCODING  EQUALS  scalarDefaultCharExpr
| keyERR  EQUALS  label
| keyFILE  EQUALS  fileNameExpr
| keyFORM  EQUALS  scalarDefaultCharExpr
| keyIOMSG  EQUALS  iomsgVariable
| keyIOSTAT  EQUALS  scalarIntVariable
| keyPAD  EQUALS  scalarDefaultCharExpr
| keyPOSITION  EQUALS  scalarDefaultCharExpr
| keyRECL  EQUALS  scalarIntExpr
| keyROUND  EQUALS  scalarDefaultCharExpr
| keySIGN  EQUALS  scalarDefaultCharExpr
| keySTATUS  EQUALS  scalarDefaultCharExpr
;
// R904
openStmt : 
keyOPEN  LEFTPAR  connectSpecList  RIGHTPAR 
;
// R1001
fformatStmt : 
keyFORMAT fformatSpecification
;
// R1002
fformatSpecification : 
 LEFTPAR    (   fformatItemList   )?    RIGHTPAR 
;
// R908
closeStmt : 
keyCLOSE  LEFTPAR  closeSpecList  RIGHTPAR 
;
// R1004
r : 
intLiteralConstant
;
// R1005
dataEditDesc : 
keyI w   (    PERIOD  m   )?  
| keyB w   (    PERIOD  m   )?  
| keyO w   (    PERIOD  m   )?  
| keyZ w   (    PERIOD  m   )?  
| keyF w  PERIOD  d
| keyE w  PERIOD  d   (   keyE e   )?  
| keyEN w  PERIOD  d   (   keyE e   )?  
| keyES w  PERIOD  d   (   keyE e   )?  
| keyG w  PERIOD  d   (   keyE e   )?  
| keyL w
| keyA   (   w   )?  
| keyD w  PERIOD  d
| keyDT   (   charLiteralConstant   )?     (    LEFTPAR  vList  RIGHTPAR    )?  
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
keyEND keyDO   (   doConstructName   )?  
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
|   (    COMMA     )?   keyWHILE  LEFTPAR  scalarLogicalExpr  RIGHTPAR 
;
// R538
parameterStmt : 
keyPARAMETER  LEFTPAR  namedConstantDefList  RIGHTPAR 
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
keyINTENT  LEFTPAR  intentSpec  RIGHTPAR    (    DOUBLECOLON    )?   dummyArgNameList
;
// R537
optionalStmt : 
keyOPTIONAL   (    DOUBLECOLON    )?   dummyArgNameList
;
// R534
constantSubobject : 
designator
;
// R535
dimensionStmt : 
keyDIMENSION   (    DOUBLECOLON    )?   arrayName  LEFTPAR  arraySpec  RIGHTPAR 
  (    COMMA   arrayName  LEFTPAR  arraySpec  RIGHTPAR   )* 
;
// R1219
procedureDesignator : 
procedureName
| procComponentRef
| dataRef  PERCENT  bindingName
;
// R1218
callStmt : 
keyCALL procedureDesignator   (    LEFTPAR    (   actualArgSpecList   )?    RIGHTPAR    )?  
;
// R1211
procedureDeclarationStmt : 
keyPROCEDURE  LEFTPAR    (   procInterface   )?    RIGHTPAR 
  (     (    COMMA   procAttrSpec  )*   DOUBLECOLON    )?   procDeclList
;
// R1210
externalStmt : 
keyEXTERNAL   (    DOUBLECOLON    )?   externalNameList
;
// R1213
procAttrSpec : 
accessSpec
| procLanguageBindingSpec
| keyINTENT  LEFTPAR  intentSpec  RIGHTPAR 
| keyOPTIONAL
| keyPOINTER
| keySAVE
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
keyINTRINSIC   (    DOUBLECOLON    )?   intrinsicProcedureNameList
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
 LEFTPAR    (   keyKIND  EQUALS    )?   scalarIntInitializationExpr  RIGHTPAR 
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
keyINTEGER   (   kindSelector   )?  
| keyREAL   (   kindSelector   )?  
| keyDOUBLE keyPRECISION
| keyCOMPLEX   (   kindSelector   )?  
| keyCHARACTER   (   charSelector   )?  
| keyLOGICAL   (   kindSelector   )?  
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
    level3Expr ( relOp  level3Expr   )? 
;
// R713
relOp : 
 PERIOD keyEQ PERIOD 
|  PERIOD keyNE PERIOD 
|  PERIOD keyLT PERIOD 
|  PERIOD keyLE PERIOD 
|  PERIOD keyGT PERIOD 
|  PERIOD keyGE PERIOD 
|  DOUBLEEQUALS 
|  SLASHEQUALS 
|  LESS 
|  LESSEQUALS 
|  GREATER 
|  GREATEREQUALS 
;
// R710
level3Expr : 
    level2Expr (  concatOp    level3Expr )? 
;
// R711
concatOp : 
 DOUBLESLASH 
;
// R716
equivOperand : 
    orOperand (  orOp    equivOperand )? 
;
// R717
level5Expr : 
    equivOperand (  equivOp    level5Expr )? 
;
// R714
andOperand : 
  (   notOp   )?   level4Expr
;
// R715
orOperand : 
    andOperand ( andOp     orOperand )? 
;
// R718
notOp : 
 PERIOD keyNOT PERIOD 
;
// R719
andOp : 
 PERIOD keyAND PERIOD 
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
// R304
name : 
letter   (   alphanumericCharacter  )* 
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
  (  forallConstructName  COLON   )?   keyFORALL forallHeader
;
// R750
elsewhereStmt : 
keyELSEWHERE   (  whereConstructName  )?  
;
// R751
endWhereStmt : 
keyEND keyWHERE   (  whereConstructName  )?  
;
// R758
endForallStmt : 
keyEND keyFORALL   (  forallConstructName   )?  
;
// R759
forallStmt : 
keyFORALL forallHeader forallAssignmentStmt
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
keyFINAL   (    DOUBLECOLON    )?   finalSubroutineNameList
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
keyPROCEDURE   (    LEFTPAR interfaceName RIGHTPAR    )?  
  (     (    COMMA   bindingAttrList   )?    DOUBLECOLON    )?  
bindingName   (    ARROW  procedureName   )?  
;
// R450
procBindingStmt : 
specificBinding
| genericBinding
| finalBinding
;
// R453
bindingAttr : 
keyPASS   (    LEFTPAR argName RIGHTPAR    )?  
| keyNOPASS
| keyNON keyOVERRIDABLE
| keyDEFERRED
| accessSpec
;
// R452
genericBinding : 
keyGENERIC
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
  (   keyUNIT  EQUALS    )?   ioUnit
|   (   keyFMT  EQUALS    )?   fformat
|   (   keyNML  EQUALS    )?   namelistGroupName
| keyADVANCE  EQUALS  scalarDefaultCharExpr
| keyASYNCHRONOUS  EQUALS  scalarCharInitializationExpr
| keyBLANK  EQUALS  scalarDefaultCharExpr
| keyDECIMAL  EQUALS  scalarDefaultCharExpr
| keyDELIM  EQUALS  scalarDefaultCharExpr
| keyEND  EQUALS  label
| keyEOR  EQUALS  label
| keyERR  EQUALS  label
| keyID  EQUALS  scalarIntVariable
| keyIOMSG  EQUALS  iomsgVariable
| keyIOSTAT  EQUALS  scalarIntVariable
| keyPAD  EQUALS  scalarDefaultCharExpr
| keyPOS  EQUALS  scalarIntExpr
| keyREC  EQUALS  scalarIntExpr
| keyROUND  EQUALS  scalarDefaultCharExpr
| keySIGN  EQUALS  scalarDefaultCharExpr
| keySIZE  EQUALS  scalarIntVariable
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
keyALLOCATE  LEFTPAR    (   typeSpec  DOUBLECOLON    )?   allocationList
  (   COMMA   allocOptList   )?    RIGHTPAR 
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
keySTAT  EQUALS  statVariable
| keyERRMSG  EQUALS  errmsgVariable
| keySOURCE  EQUALS  sourceExpr
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
  (   keyUNIT  EQUALS    )?   fileUnitNumber
| keyFILE  EQUALS  fileNameExpr
| keyACCESS  EQUALS  scalarDefaultCharVariable
| keyACTION  EQUALS  scalarDefaultCharVariable
| keyASYNCHRONOUS  EQUALS  scalarDefaultCharVariable
| keyBLANK  EQUALS  scalarDefaultCharVariable
| keyDECIMAL  EQUALS  scalarDefaultCharVariable
| keyDELIM  EQUALS  scalarDefaultCharVariable
| keyDIRECT  EQUALS  scalarDefaultCharVariable
| keyENCODING  EQUALS  scalarDefaultCharVariable
| keyERR  EQUALS  label
| keyEXIST  EQUALS  scalarDefaultLogicalVariable
| keyFORM  EQUALS  scalarDefaultCharVariable
| keyFORMATTED  EQUALS  scalarDefaultCharVariable
| keyID  EQUALS  scalarIntExpr
| keyIOMSG  EQUALS  iomsgVariable
| keyIOSTAT  EQUALS  scalarIntVariable
| keyNAME  EQUALS  scalarDefaultCharVariable
| keyNAMED  EQUALS  scalarDefaultLogicalVariable
| keyNEXTREC  EQUALS  scalarIntVariable
| keyNUMBER  EQUALS  scalarIntVariable
| keyOPENED  EQUALS  scalarDefaultLogicalVariable
| keyPAD  EQUALS  scalarDefaultCharVariable
| keyPENDING  EQUALS  scalarDefaultLogicalVariable
| keyPOS  EQUALS  scalarIntVariable
| keyPOSITION  EQUALS  scalarDefaultCharVariable
| keyREAD  EQUALS  scalarDefaultCharVariable
| keyREADWRITE  EQUALS  scalarDefaultCharVariable
| keyRECL  EQUALS  scalarIntVariable
| keyROUND  EQUALS  scalarDefaultCharVariable
| keySEQUENTIAL  EQUALS  scalarDefaultCharVariable
| keySIGN  EQUALS  scalarDefaultCharVariable
| keySIZE  EQUALS  scalarIntVariable
| keySTREAM  EQUALS  scalarDefaultCharVariable
| keyUNFORMATTED  EQUALS  scalarDefaultCharVariable
| keyWRITE  EQUALS  scalarDefaultCharVariable
;
// R1017
roundEditDesc : 
keyRU
| keyRD
| keyRZ
| keyRN
| keyRC
| keyRP
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
keyT n
| keyTL n
| keyTR n
| n keyX
;
// R1012
k : 
signedIntLiteralConstant
;
// R1101
mainProgram : 
  (   programStmt   )?  
  (   specificationPart   )?  
  (   executionPart   )?  
  (   internalSubprogramPart   )?  
endProgramStmt
;
// R1103
endProgramStmt : 
keyEND   (   keyPROGRAM   (   programName   )?     )?  
;
// R1102
programStmt : 
keyPROGRAM programName
;
// R1105
moduleStmt : 
keyMODULE moduleName
;
// R1104
module : 
moduleStmt
  (   specificationPart   )?  
  (   moduleSubprogramPart   )?  
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
keyEND   (   keyMODULE   (   moduleName   )?     )?  
;
// R1109
useStmt : 
keyUSE   (     (    COMMA   moduleNature   )?    DOUBLECOLON    )?   moduleName   (    COMMA   renameList   )?  
| keyUSE   (     (    COMMA   moduleNature   )?    DOUBLECOLON    )?   moduleName  COMMA  
keyONLY  COLON    (   onlyList   )?  
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
  (   caseConstructName  COLON    )?   keySELECT keyCASE  LEFTPAR  caseExpr  RIGHTPAR 
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
  (   ifConstructName  COLON    )?   keyIF  LEFTPAR  scalarLogicalExpr  RIGHTPAR  keyTHEN
;
// R801
block : 
  (   executionPartConstruct  )* 
;
// R806
endIfStmt : 
keyEND keyIF   (   ifConstructName   )?  
;
// R807
ifStmt : 
keyIF  LEFTPAR  scalarLogicalExpr  RIGHTPAR  actionStmt
;
// R804
elseIfStmt : 
keyELSE keyIF  LEFTPAR  scalarLogicalExpr  RIGHTPAR  keyTHEN   (   ifConstructName   )?  
;
// R805
elseStmt : 
keyELSE   (   ifConstructName   )?  
;
// R525
dataStmtSet : 
dataStmtObjectList  FORWARDSLASH  dataStmtValueList  FORWARDSLASH 
;
// R734
assignmentStmt : 
variable  EQUALS  expr
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
keyASYNCHRONOUS   (    DOUBLECOLON    )?   objectNameList
;
// R520
allocatableStmt : 
keyALLOCATABLE   (    DOUBLECOLON    )?  
objectName   (    LEFTPAR  deferredShapeSpecList  RIGHTPAR    )?  
  (    COMMA   objectName   (    LEFTPAR  deferredShapeSpecList  RIGHTPAR    )?    )* 
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
keyWAIT  LEFTPAR waitSpecList RIGHTPAR 
;
// R1208
dtioGenericSpec : 
keyREAD  LEFTPAR keyFORMATTED RIGHTPAR 
| keyREAD  LEFTPAR keyUNFORMATTED RIGHTPAR 
| keyWRITE  LEFTPAR keyFORMATTED RIGHTPAR 
| keyWRITE  LEFTPAR keyUNFORMATTED RIGHTPAR 
;
// R1209
importStmt : 
keyIMPORT   (    (    DOUBLECOLON    )?   importNameList   )?  
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
keyINTERFACE   (   genericSpec   )?  
| keyABSTRACT keyINTERFACE
;
// R1201
interfaceBlock : 
interfaceStmt
  (   interfaceSpecification  )* 
endInterfaceStmt
;
// R1206
procedureStmt : 
  (   keyMODULE   )?   keyPROCEDURE procedureNameList
;
// R1207
genericSpec : 
genericName
| keyOPERATOR  LEFTPAR  definedOperator  RIGHTPAR 
| keyASSIGNMENT  LEFTPAR   EQUALS   RIGHTPAR 
| dtioGenericSpec
;
// R1204
endInterfaceStmt : 
keyEND keyINTERFACE   (   genericSpec   )?  
;
// R1205
interfaceBody : 
functionStmt
  (   specificationPart   )?  
endFunctionStmt
| subroutineStmt
  (   specificationPart   )?  
endSubroutineStmt
;
// R636
deallocOpt : 
keySTAT  EQUALS  statVariable
| keyERRMSG  EQUALS  errmsgVariable
;
// R925
rewindStmt : 
keyREWIND fileUnitNumber
| keyREWIND  LEFTPAR  positionSpecList  RIGHTPAR 
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
| 
;
// R413
octalConstant : 
keyO  QUOTE  digit   (   digit  )*   QUOTE 
| keyO  DOUBLEQUOTE  digit   (   digit  )*   DOUBLEQUOTE 
;
// R412
binaryConstant : 
keyB  QUOTE  digit   (   digit  )*   QUOTE 
| keyB  DOUBLEQUOTE  digit   (   digit  )*   DOUBLEQUOTE 
;
// R415
hexDigit : 
digit
| keyA
| keyB
| keyC
| keyD
| keyE
| keyF
;
// R414
hexConstant : 
keyZ  QUOTE  hexDigit   (   hexDigit  )*   QUOTE 
| keyZ  DOUBLEQUOTE  hexDigit   (   hexDigit  )*   DOUBLEQUOTE 
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
keyE
| keyD
;
// R418
significand : 
digitString  PERIOD    (   digitString   )?  
|  PERIOD  digitString
;
// R926
positionSpec : 
  (   keyUNIT  EQUALS    )?   fileUnitNumber
| keyIOMSG  EQUALS  iomsgVariable
| keyIOSTAT  EQUALS  scalarIntVariable
| keyERR  EQUALS  label
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
keyEND keyENUM
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
| 
;
// R461
enumDefStmt : 
keyENUM COMMA   keyBIND LEFTPAR keyC RIGHTPAR 
;
// R462
enumeratorDefStmt : 
keyENUMERATOR   (    DOUBLECOLON    )?   enumeratorList
;
// R463
enumerator : 
namedConstant   (    EQUALS  scalarIntInitializationExpr   )?  
;
// R705
addOperand : 
   multOperand ( multOp     addOperand )?  
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
   ( addOp )? addOperand (  addOp  level2Expr   )?  
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
keyDC
| keyDP
;
// R848
continueStmt : 
keyCONTINUE
;
// R849
stopStmt : 
keySTOP   (   stopCode   )?  
;
// R846
computedGotoStmt : 
keyGO keyTO  LEFTPAR  labelList  RIGHTPAR    (    COMMA     )?   scalarIntExpr
;
// R847
arithmeticIfStmt : 
keyIF  LEFTPAR  scalarNumericExpr  RIGHTPAR  label  COMMA   label  COMMA   label
;
// R844
exitStmt : 
keyEXIT   (   doConstructName   )?  
;
// R845
gotoStmt : 
keyGO keyTO label
;
// R842
doTermSharedStmt : 
actionStmt
;
// R843
cycleStmt : 
keyCYCLE   (   doConstructName   )?  
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
| fformatStmt
| entryStmt
;
// R207
declarationConstruct : 
derivedTypeDef
| entryStmt
| enumDef
| fformatStmt
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
| fformatStmt
| entryStmt
| dataStmt
;
// R1016
blankInterpEditDesc : 
keyBN
| keyBZ
;
// R633
nullifyStmt : 
keyNULLIFY  LEFTPAR  pointerObjectList  RIGHTPAR 
;
// R518
accessStmt : 
accessSpec   (     (    DOUBLECOLON    )?   accessIdList   )?  
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
keyIN
| keyOUT
| keyINOUT
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
keyINTRINSIC
| keyNON keyINTRINSIC
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
keyWHERE  LEFTPAR  maskExpr  RIGHTPAR  whereAssignmentStmt
;
// R742
procTarget : 
expr
| procedureName
| procComponentRef
;
// R745
whereConstructStmt : 
  (  whereConstructName COLON   )?   keyWHERE  LEFTPAR  maskExpr  RIGHTPAR 
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
;
// R746
whereBodyConstruct : 
whereAssignmentStmt
| whereStmt
| whereConstruct
;
// R749
maskedElsewhereStmt : 
keyELSEWHERE  LEFTPAR maskExpr RIGHTPAR    (  whereConstructName  )?  
;
// R748
maskExpr : 
logicalExpr
;
// R1111
rename : 
localName  ARROW  useName
| keyOPERATOR  LEFTPAR localDefinedOperator RIGHTPAR   ARROW 
keyOPERATOR  LEFTPAR useDefinedOperator RIGHTPAR 
;
// R428
logicalLiteralConstant : 
 PERIOD keyTRUE PERIOD    (   kindParam   )?  
|  PERIOD keyFALSE PERIOD    (   kindParam   )?  
;
// R429
derivedTypeDef : 
derivedTypeStmt
  (   typeParamDefStmt  )* 
  (   privateOrSequence  )* 
  (   componentPart   )?  
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
|  LEFTPAR  keyLEN  EQUALS  typeParamValue  COMMA  
keyKIND  EQUALS  scalarIntInitializationExpr  RIGHTPAR 
|  LEFTPAR  typeParamValue  COMMA  
  (   keyKIND  EQUALS    )?   scalarIntInitializationExpr  RIGHTPAR 
|  LEFTPAR  keyKIND  EQUALS  scalarIntInitializationExpr
  (    COMMA   keyLEN  EQUALS typeParamValue   )?    RIGHTPAR 
;
// R425
lengthSelector : 
 LEFTPAR    (   keyLEN  EQUALS    )?   typeParamValue  RIGHTPAR 
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
  (   specificationPart   )?  
endBlockDataStmt
;
// R1117
blockDataStmt : 
keyBLOCK keyDATA   (   blockDataName   )?  
;
// R929
inquireStmt : 
keyINQUIRE  LEFTPAR  inquireSpecList  RIGHTPAR 
| keyINQUIRE  LEFTPAR  keyIOLENGTH  EQUALS  scalarIntVariable  RIGHTPAR 
outputItemList
;
// R928
flushSpec : 
  (  keyUNIT  EQUALS   )?   fileUnitNumber
| keyIOSTAT  EQUALS  scalarIntVariable
| keyIOMSG  EQUALS  iomsgVariable
| keyERR  EQUALS  label
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
keyDEALLOCATE  LEFTPAR  allocateObjectList   (    COMMA   deallocOptList   )?    RIGHTPAR 
;
// R920
dtvTypeSpec : 
keyTYPE LEFTPAR  derivedTypeSpec  RIGHTPAR 
| keyCLASS LEFTPAR  derivedTypeSpec  RIGHTPAR 
;
// R923
backspaceStmt : 
keyBACKSPACE fileUnitNumber
| keyBACKSPACE  LEFTPAR  positionSpecList  RIGHTPAR 
;
// R922
waitSpec : 
  (   keyUNIT  EQUALS    )?   fileUnitNumber
| keyEND  EQUALS  label
| keyEOR  EQUALS  label
| keyERR  EQUALS  label
| keyID  EQUALS  scalarIntExpr
| keyIOMSG  EQUALS  iomsgVariable
| keyIOSTAT  EQUALS  scalarIntVariable
;
// R631
lowerBoundExpr : 
scalarIntExpr
;
// R924
endfileStmt : 
keyENDFILE fileUnitNumber
| keyENDFILE  LEFTPAR  positionSpecList  RIGHTPAR 
;
// R927
flushStmt : 
keyFLUSH fileUnitNumber
| keyFLUSH  LEFTPAR  flushSpecList  RIGHTPAR 
;
// R632
upperBoundExpr : 
scalarIntExpr
;
// R910
readStmt : 
keyREAD  LEFTPAR  ioControlSpecList  RIGHTPAR    (   inputItemList   )?  
| keyREAD fformat   (    COMMA   inputItemList   )?  
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
  (   associateConstructName  COLON    )?   keyASSOCIATE
 LEFTPAR associationList  RIGHTPAR 
;
// R816
associateConstruct : 
associateStmt
block
endAssociateStmt
;
// R811
endSelectStmt : 
keyEND keySELECT   (   caseConstructName   )?  
;
// R810
caseStmt : 
keyCASE caseSelector   (  caseConstructName  )?  
;
// R813
caseSelector : 
 LEFTPAR  caseValueRangeList  RIGHTPAR 
| keyDEFAULT
;
// R812
caseExpr : 
scalarIntExpr
| scalarCharExpr
| scalarLogicalExpr
;
// R1118
endBlockDataStmt : 
keyEND   (   keyBLOCK keyDATA   (   blockDataName   )?     )?  
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
keyNEQV : N E Q V;
keyFORMAT : F O R M A T;
keyGENERIC : G E N E R I C;
keyBN : B N;
keyEQUIVALENCE : E Q U I V A L E N C E;
keyEOR : E O R;
keyPROTECTED : P R O T E C T E D;
keyPAD : P A D;
keyFILE : F I L E;
keyENTRY : E N T R Y;
keyUNFORMATTED : U N F O R M A T T E D;
keyTRUE : T R U E;
keyPOSITION : P O S I T I O N;
keyBZ : B Z;
keyRU : R U;
keyNAMED : N A M E D;
keySUBROUTINE : S U B R O U T I N E;
keyOPENED : O P E N E D;
keyDELIM : D E L I M;
keyLT : L T;
keyRZ : R Z;
keyRD : R D;
keySOURCE : S O U R C E;
keyRC : R C;
keyACTION : A C T I O N;
keyIMPORT : I M P O R T;
keyRN : R N;
keyBLOCK : B L O C K;
keyGT : G T;
keyD : D;
keyENUM : E N U M;
keyOVERRIDABLE : O V E R R I D A B L E;
keyL : L;
keyMODULE : M O D U L E;
keyEQV : E Q V;
keyP : P;
keyGE : G E;
keyEXTENDS : E X T E N D S;
keyT : T;
keyPASS : P A S S;
keyGO : G O;
keyX : X;
keyWHERE : W H E R E;
keyPROCEDURE : P R O C E D U R E;
keyNAME : N A M E;
keyDOUBLE : D O U B L E;
keyCONTAINS : C O N T A I N S;
keyLOGICAL : L O G I C A L;
keyCLASS : C L A S S;
keyNEXTREC : N E X T R E C;
keyDEFERRED : D E F E R R E D;
keyONLY : O N L Y;
keyEXIST : E X I S T;
keyINTERFACE : I N T E R F A C E;
keySAVE : S A V E;
keyOR : O R;
keyADVANCE : A D V A N C E;
keySTAT : S T A T;
keyRETURN : R E T U R N;
keyREADWRITE : R E A D W R I T E;
keyASSIGNMENT : A S S I G N M E N T;
keyIOSTAT : I O S T A T;
keyFORMATTED : F O R M A T T E D;
keyCOMPLEX : C O M P L E X;
keyA : A;
keyPRINT : P R I N T;
keyENUMERATOR : E N U M E R A T O R;
keyROUND : R O U N D;
keySELECT : S E L E C T;
keyEXIT : E X I T;
keyNULLIFY : N U L L I F Y;
keyKIND : K I N D;
keyCOMMON : C O M M O N;
keyBLANK : B L A N K;
keyIOLENGTH : I O L E N G T H;
keyINTEGER : I N T E G E R;
keyDEALLOCATE : D E A L L O C A T E;
keyFUNCTION : F U N C T I O N;
keyC : C;
keyEN : E N;
keyEND : E N D;
keyRECURSIVE : R E C U R S I V E;
keyG : G;
keySEQUENCE : S E Q U E N C E;
keyINQUIRE : I N Q U I R E;
keyFLUSH : F L U S H;
keyO : O;
keyELSE : E L S E;
keyS : S;
keyINTENT : I N T E N T;
keyRESULT : R E S U L T;
keyOPERATOR : O P E R A T O R;
keyRP : R P;
keyEQ : E Q;
keyES : E S;
keySIZE : S I Z E;
keyAND : A N D;
keyNON : N O N;
keyDC : D C;
keyTYPE : T Y P E;
keyPRECISION : P R E C I S I O N;
keyPENDING : P E N D I N G;
keySEQUENTIAL : S E Q U E N T I A L;
keyNOT : N O T;
keyEXTERNAL : E X T E R N A L;
keyREAL : R E A L;
keyTHEN : T H E N;
keySTREAM : S T R E A M;
keyNAMELIST : N A M E L I S T;
keyDEFAULT : D E F A U L T;
keySTOP : S T O P;
keyWHILE : W H I L E;
keyPROGRAM : P R O G R A M;
keyREC : R E C;
keyOPEN : O P E N;
keyCASE : C A S E;
keyERR : E R R;
keyOPTIONAL : O P T I O N A L;
keyNE : N E;
keyID : I D;
keyUNIT : U N I T;
keyFORALL : F O R A L L;
keyCLOSE : C L O S E;
keyREAD : R E A D;
keyOUT : O U T;
keyNOPASS : N O P A S S;
keyB : B;
keyF : F;
keyFMT : F M T;
keyELEMENTAL : E L E M E N T A L;
keyDIRECT : D I R E C T;
keyWRITE : W R I T E;
keyELSEWHERE : E L S E W H E R E;
keyZ : Z;
keyWAIT : W A I T;
keyFALSE : F A L S E;
keyTARGET : T A R G E T;
keySS : S S;
keySP : S P;
keyLEN : L E N;
keyVOLATILE : V O L A T I L E;
keyREWIND : R E W I N D;
keyASYNCHRONOUS : A S Y N C H R O N O U S;
keyNML : N M L;
keyINTRINSIC : I N T R I N S I C;
keyPUBLIC : P U B L I C;
keyERRMSG : E R R M S G;
keyDO : D O;
keyUSE : U S E;
keyRECL : R E C L;
keyENCODING : E N C O D I N G;
keyABSTRACT : A B S T R A C T;
keyCHARACTER : C H A R A C T E R;
keyNUMBER : N U M B E R;
keyBACKSPACE : B A C K S P A C E;
keyENDFILE : E N D F I L E;
keyDT : D T;
keyPARAMETER : P A R A M E T E R;
keyDP : D P;
keyLE : L E;
keyDATA : D A T A;
keyIMPLICIT : I M P L I C I T;
keyTR : T R;
keyPOS : P O S;
keyPRIVATE : P R I V A T E;
keyFINAL : F I N A L;
keyTO : T O;
keyTL : T L;
keyCONTINUE : C O N T I N U E;
keyALLOCATE : A L L O C A T E;
keyDECIMAL : D E C I M A L;
keyCYCLE : C Y C L E;
keySTATUS : S T A T U S;
keyIOMSG : I O M S G;
keyE : E;
keyFORM : F O R M;
keyI : I;
keyIS : I S;
keyNONE : N O N E;
keyVALUE : V A L U E;
keyIN : I N;
keySIGN : S I G N;
keyDIMENSION : D I M E N S I O N;
keyIF : I F;
keyASSOCIATE : A S S O C I A T E;
keyBIND : B I N D;
keyALLOCATABLE : A L L O C A T A B L E;
keyACCESS : A C C E S S;
keyCALL : C A L L;
keyPURE : P U R E;
keyPOINTER : P O I N T E R;
keyINOUT : I N O U T;
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
fformatItemList :  fformatItem  ( COMMA  fformatItem  )* ;
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
localName : name ;
useName : name ;
indexName : name ;
procedureComponentName : name ;
componentName : name ;
scalarIntConstantName : name ;
argName : name ;
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

Comment: '!' ~'\n'* '\n' -> skip ;
Newline: '\r'? '\n' -> skip ;
Whitespace: (' '|'\t')+ -> skip ;

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
letter: Letter;
Letter: (A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z);
digit: Digit;
Digit: [0-9];
repChar: RepChar;
RepChar: .;
specialCharacter: SpecialCharacter;

SpecialCharacter: 
' ' | '=' | '+' | '-' | '*' | '/' | '\\' |
'(' | ')' | '[' | ']' | '{' | '}' | ',' |
'.' | ':' | ';' | '!' | '"' | '%' | '&' |
'~' | '<' | '>' | '?' | '\'' | '`' | '^' |
'|' | '$' | '#' | '@' 
;

