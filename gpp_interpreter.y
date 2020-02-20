%{
#include <stdio.h>
#include <math.h>
extern FILE *yyin;
int error=0;
int first=0;
int exit_prog=0;
int numFlag=0;
int idFlag=0;
int arr[1000]; 
int indexArr=0;
int elseFlag=0;
int printFlag=0;
int ifFlag=0;
int secondFlag=0;
void printArr(int arr[],int length){
    int i;
    for(i=0;i< length;i++){
        if(i!= length -1)
            printf("%d,",arr[i]);
        else    
             printf("%d",arr[i]);    

    }

}
int* regularAppend(int arr[],int length,int val){
    int i;
    for (i = length-1; i>=0; i--){
        arr[i+1]=arr[i];


    }
    arr[0]=val;
    return arr;

}
%}


%start START
%token IntegerValue
%token Id
%token '+' '-' '*' '/'  '(' ')' OP_DBLQUOTE 
%token KW_AND KW_OR KW_NOT KW_EQUAL KW_LESS KW_NIL  KW_APPEND KW_CONCAT KW_SET KW_DEFFUN KW_OPLIST KW_DOUBLEMULT
%token KW_FOR KW_WHILE KW_DEFVAR KW_IF KW_EXIT KW_LOAD KW_DISP KW_TRUE KW_FALSE KW_LIST
%token COMMENT



/* Rule Section */
%% 

START: | INPUT;

INPUT: EXPI { 
    if(!error)
        printf("SYNTAX OK.\n") ;
    if(ifFlag==1 && printFlag==1 && secondFlag==0 && elseFlag==0 &&!error){ 
        printf ("Result: (" );
        printArr(arr,indexArr);
        printf (")");
        indexArr=0;
        ifFlag=0;
        secondFlag=0;
        printFlag=0;
        elseFlag=0;
        numFlag=0;
    }

    else if(secondFlag==1 && printFlag==1 &&!error){ 
        printf ("Result: (" );
        indexArr=first;
        printArr(arr,indexArr);
        printf (")");
        indexArr=0;
        secondFlag=0;
        ifFlag=0;
        printFlag=0;
        elseFlag=0;
        numFlag=0;
        first=0;
    }
    else if(secondFlag==0 && elseFlag==1 &&printFlag==1 &&!error ){
        for(int i= 0; i<indexArr-first ; i++){
            arr[i]=arr[first+i];
        }
        printf ("Result: (" );
        indexArr=indexArr-first;
        printArr(arr,indexArr);
        printf (")");
        indexArr=0;
        elseFlag=0;
        secondFlag=0;
        printFlag=0;
        ifFlag=0;
        numFlag=0;
        first=0;
    }
   
    else if (ifFlag==0 && printFlag==1 && numFlag==0 &&!error){ 
        printf("Result: Nil"); 
        indexArr=0;
        printFlag=0;  
        ifFlag=0;
        secondFlag=0;
        elseFlag=0;
        numFlag=0;
        first=0;
    } 
     if(numFlag==1 && printFlag==1 && ! error){
         printf("\nResult:%d\n",$$);
         numFlag=0; 
         printFlag=0;
         ifFlag=0;
         secondFlag=0;
         elseFlag=0;
         numFlag=0;
         first=0;
    }      
}        

| EXPLISTI {
    if(printFlag==1 &&ifFlag==1 &&!error){ 
        printf("SYNTAX OK.\n");
        printf ("Result: (" );
        printArr(arr,indexArr);
        printf (")");
        indexArr=0;
        printFlag=0;
        ifFlag=0;
        secondFlag=0;
        elseFlag=0;
        numFlag=0;
        first=0;
    }    
}
| EXPB { 
    if (!error)
        printf("SYNTAX OK."); 
    if(printFlag==1 &&!error){
        printf("\nResult: ");
        if($$ == 1){
            printf ("true");
        }
        else
            printf("false");  
        printFlag=0; 
        ifFlag=0;
        secondFlag=0; 
        elseFlag=0;
        numFlag=0; 
        first=0;
    }      
}
  




LISTVALUE: KW_OPLIST VALUES ')' {  if (first==0 && !error) { first=indexArr; }}
| KW_OPLIST ')' 

;

VALUES: VALUES IntegerValue { arr[indexArr]=$2; indexArr=indexArr+1; }
| IntegerValue  { arr[indexArr]=$1 ; indexArr=indexArr+1; }

;

EXPI:'(' '+' EXPI EXPI ')' {$$=$3+$4; printFlag=1; numFlag=1; }

| '(' '-' EXPI EXPI ')' {$$=$3-$4; printFlag=1; numFlag=1;}

| '(' '*' EXPI EXPI ')' {$$=$3*$4; printFlag=1; numFlag=1;}

| '(' '/' EXPI EXPI ')' {$$=$3/$4; printFlag=1; numFlag=1;}

| '(' KW_DOUBLEMULT EXPI EXPI ')' 

|'(' Id EXPLISTI ')' { $$= $3; ifFlag=1; printFlag=1;  }

| '(' KW_SET Id EXPI ')' { $$ = $4; printFlag=1;}

| '(' KW_DEFFUN Id IDLIST EXPLISTI ')' 

| Id 

| '(' KW_LOAD OP_DBLQUOTE Id OP_DBLQUOTE ')'

| '(' KW_DISP  OP_DBLQUOTE Id OP_DBLQUOTE  ')'

| IntegerValue  {$$=$1;  }

| COMMENT 

| '(' KW_IF EXPB EXPLISTI ')' {
    printFlag=1;
    if($3==1){ 
         ifFlag=1; 
    } else{
        ifFlag=0;
    } 
}

| '(' KW_IF EXPB EXPLISTI EXPLISTI ')' 
{ 
    printFlag=1;
    if($3==1){ 
        secondFlag=1; 
    } else { 
        secondFlag=0; 
        elseFlag=1;
    } 
}



| '(' KW_WHILE  EXPB  EXPLISTI ')'  
{ 
    printFlag=1;
    if($3==1){ 
        ifFlag=1; 
    } 
    else {
        ifFlag=0;
    } 
}

| '(' KW_FOR '(' Id EXPI EXPI ')' EXPLISTI ')' 
{ 
    printFlag=1;
    ifFlag=1;    
}

| '(' KW_DEFVAR Id EXPI ')' {  printFlag=1; numFlag=1; ifFlag=0; $$=$4; }

| '(' KW_LIST VALUES ')'



| '(' KW_EXIT ')' { exit_prog=1; return 0;  }


;

EXPB: '(' KW_AND EXPB EXPB ')'  {$$=($3 && $4);  printFlag=1;} 

|'(' KW_OR EXPB EXPB ')'   {$$=($3 || $4); printFlag=1; } 

| '(' KW_NOT EXPB  ')'  {$$=!$3;  printFlag=1;} 

| '(' KW_LESS EXPI EXPI ')'  {$$=($3 < $4);  printFlag=1; } 

| '(' KW_EQUAL EXPB EXPB ')'  {$$=($3==$4);  printFlag=1; } 

|'(' KW_EQUAL EXPI EXPI ')'  {$$=($3==$4);  printFlag=1; } 



| BinaryValue

;

BinaryValue: KW_TRUE { $$=1;}
| KW_FALSE   {$$=0; }
;

IdentifierList : IdentifierList Id 
| Id


;

EXPLISTI: '(' KW_CONCAT EXPLISTI EXPLISTI ')' 

| '(' KW_APPEND EXPI EXPLISTI ')' { regularAppend(arr,indexArr,$3); indexArr=indexArr+1; }

| LISTVALUE { ifFlag=1; printFlag=1;}  

;

IDLIST: '(' IdentifierList ')';


 

%% 
int main(){ 
    printf ("If you want to load input file,write input file name (with extention g++ or txt or etc=>For example:  inputFile.g++),\n ");
    printf ("Or if you want to write expressions on interpreter write g++ ! \n");    
    FILE *fp; 
    char filename[50];
    char selection[15]; 
    printf("$ ");
    fgets(selection,sizeof selection,stdin); //result of whether you want to load file or not.
    selection[strcspn(selection,"\n")]='\0';
    if (strlen(selection) == 3){      //for interpreter ,to terminate program write (exit) 
        printf("Write expressions on interpreter line by line..After, syntax analysis will done\n\n");   
        printf("$ g++\n"); 
        yyin = stdin; //interpreter is doing lexical analysis.
        while (exit_prog==0){
            yyparse(); 
             
        }         
        
    }      
    else{   //for reading file.
        printf("You want to use load input file,file is reading and syntax analysis is doing...\n");
      
        printf ("\n$ g++ %s\n",selection); //Interpreter write g++ filename.g++ on screen.
        fp = fopen(selection,"r");  
        yyin = fp; //file is readed and lexical analysis is doing.
        while (exit_prog==0){
            yyparse(); 
             
        }   
         
         
    }    
    return 0; 
}
int yyerror(const char * ch) { 
    printf("\nSYNTAX_ERROR Expression not recognized\n\n");
    exit_prog=1;
    error=1; 
 
    
} 





