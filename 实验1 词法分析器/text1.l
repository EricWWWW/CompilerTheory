%{  
    #include <stdio.h>  
    #include <stdlib.h>   
    int count = 0;  
%}   

delim [" "\n\t]   
whitespace {delim}+ 
identfier [A-Za-z_]([A-Za-z0-9_])*
eight  0([0-9])+
ten ([0-9])+
sixteen 0x([0-9])+
error (0|0x)?([0-9])+([A-Za-z_])+
chartype '[A-Za-z]'
str \"([A-Za-z])+\"
reserved int|char|void|if|else|switch|case|default|while|do|for|break|continue|return
operator \+|-|\*|\/|%|\+\+|--|!|&&|\|\||=|>|>=|<|<=|==|!=
delimiter [,:;\(\)\{\}] 

%%  
{error}	{count++;printf("error!\t\n");} 
{reserved} {count++;printf("%d\t(3,‘%s’)\n",count,yytext);}  
{eight} {count++;printf("%d\t(2.1.1,‘%s’)\n",count,yytext);} 
{ten} {count++;printf("%d\t(2.1.2,‘%s’)\n",count,yytext);} 
{sixteen} {count++;printf("%d\t(2.1.3,‘%s’)\n",count,yytext);}
{chartype} {count++;printf("%d\t(2.2,‘%s’)\n",count,yytext);}
{str} {count++;printf("%d\t(2.3,‘%s’)\n",count,yytext);}
{identfier} {count++;printf("%d\t(1,‘%s’)\n",count,yytext);}   
{operator} {count++;printf("%d\t(4,‘%s’)\n",count,yytext);}  
{delimiter} {count++;printf("%d\t(5,‘%s’)\n",count,yytext);}   
{whitespace} { /* do    nothing*/ }   
  
%%  

void main()   
{  
    printf("词法分析器输出类型说明:\n");  
    printf("1：标识符\n");  
    printf("2.1.1：8进制数字\n");  
    printf("2.1.2：10进制数字\n"); 
    printf("2.1.3：16进制数字\n"); 
    printf("2.2：字符类型\n"); 
    printf("2.3：字符串类型\n"); 
    printf("3：关键字\n");  
    printf("4：运算符\n");  
    printf("5：分界符\n");  
    printf("\n");  
    yyin=fopen("1.txt","r");   
        yylex(); /* start the analysis*/   
    fclose(yyin);  
    system("PAUSE");/*暂停停,  使DOS窗口停住*/  
}   
 int yywrap()   
 {   
    return 1;   
 }   