
INCLUDE Irvine32.inc

arraySize EQU 1000

.data
array1 DWORD arraySize dup(0)

.code

main PROC

xor ecx, ecx

fillArrayLoop :
mov eax, ecx
add eax, 2
mov[array1 + 4 * ecx], eax
inc ecx
cmp ecx, arraySize
jb fillArrayLoop


xor ecx, ecx						  
loop1 :	  						 
    mov ebx, ecx					 
    inc ebx						 
    cmp[array1 + 4 * ecx], -1			
    jne loop2						
 continue1:						
    inc ecx						
    cmp ecx, arraySize				
    jb loop1						
    jmp breakLoops					

    loop2:						
    cmp[array1 + 4 * ebx], -1			
    jne loop3						
continue2 :
    inc ebx						
    cmp ebx, arraySize				
    jb loop2						
    jmp continue1

    loop3:						
    xor edx, edx					
    xor eax, eax					
    mov eax, [array1 + 4 * ebx]		
    div[array1 + 4 * ecx]			
    cmp edx, 0						
    je deleteIt
								
continue3:
    jmp continue2


    deleteIt :
    mov[array1 + 4 * ebx], -1					 
    jmp continue3

breakLoops: 
	   xor esi, esi
print:
	   cmp array1[esi] , -1
	   je skip
	   mov eax , array1[esi]
	   call WriteDec
    	   call crlf
skip:
	   add esi, type array1
	   cmp esi , arraySize * type array1
	   jb print

	   exit

    main ENDP

    END main
