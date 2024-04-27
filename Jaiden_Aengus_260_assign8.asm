.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword


; change NUM to the value that you want to run the program with 
NUM = 12

.data
    var DWORD 0
    ; do NOT change quadArray here in the data segment!!!
    ; You will be building this array with your loop

    quadArray DWORD NUM DUP(0)

.code
main proc
    
; initialize esi
mov esi, OFFSET quadArray

    mov eax, 0                                      ; Tracks index
    mov ebx, 0                                      ; Selects indices to sum
    mov ecx, NUM                                    ; Tracks loop iterations
    sub ecx, 4                                      ; Removes base iterations
    mov edx, 0                                      ; Temporarily holds value

    lessThan16:                                     ; Sets the four base cases
        mov [quadArray + eax], 1
        add eax, 4


    quad:                                           ; Yields a sequence starting with four base cases of 1
        cmp eax, 16                                 ; Checks if eax is less than the 5th index of quadArray
        jl lessThan16

        mov ebx, eax                                ; Sets ebx 4 indices down from eax before summing
        sub ebx, 16

        mov var, ecx                                ; Checks if ebx is less than the index of eax while summing
        mov ecx, 4

        _sum:                                       ; Sums indices to get values beyond base cases
            mov edx, [quadArray + ebx]
            add [quadArray + eax], edx
            add ebx, 4
        loop _sum

        mov ecx, var

        add eax, 4                                    ; Increments the index eax stores by 4

    loop quad                                        ; Loops quad

    invoke    ExitProcess,0
main endp
end main