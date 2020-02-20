Given the description of the G++ language (G++Syntax.pdf).
I implemented a syntax analyzer that accepts or rejects a given program in G++.  
Syntax analysis rules of G++ is explained in the document in G++Syntax.pdf.  
I implemented the syntax analysis in two different ways: 
1. There are tools to implement syntax analysis given the rules in a meta-grammar such as CFGs. One such tool is “Yacc” that lets me generate C code to do the syntax analysis.  
2. For this course, I implemented a syntax analysis algorithm for G++ in Lisp as well. For this,I don't use a meta-grammar to define the lexical syntax of your language.  
Both analyses tool should start the interpreter. It will read one line at a time from the user and check if the input syntax is correct while generating the parse tree for later processing.
I also implemented code for expressions as well as if statements.   

All of remain rules for project is explained in Homework 3 pdf file.
