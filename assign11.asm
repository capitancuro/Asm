.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

player1 BYTE 'R' 
player2 BYTE 'p' 
outcome BYTE ?    

.code
main proc

    mov eax, OFFSET player1
    mov ebx, eax
    call to_upper

    mov eax, OFFSET player2
    mov ebx, eax
    call to_upper

 invoke ExitProcess,0
main endp

to_upper PROC

    cmp BYTE PTR [ebx], 'a'
    jae capitalize
    jmp done

    capitalize:
        sub BYTE PTR [ebx], 020h

    done:

    ret
to_upper ENDP

RPS PROC
    mov al, player1            
    mov bl, player2

    cmp al, bl                
    je TIE                    

    cmp al, bl
    jl check1

    cmp al, bl
    ja check2

    check1:
        sub bl, al

        cmp bl, 3
        je P2

        jmp P1

    check2:
        sub al, bl

        cmp al, 3
        je P1

        jmp P2


    P1:
        mov outcome, 1
        jmp _done

    P2:
        mov outcome, 2
        jmp _done

    TIE:
        mov outcome, 3
        jmp _done

    _done:

    ret
RPS ENDP

end main
