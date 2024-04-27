.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
   array1 DWORD 6, 7, 8, 9, 13 
   array2 DWORD 10, 12, 13, 14, 15
   array3 DWORD LENGTHOF array1 dup(?)

.code
main proc

;PHASE 1
mov eax, [array1]       ;Swap 1st element of array1 with the last element of array2
mov ebx, [array2 + 16]
mov [array1], ebx
mov [array2 + 16], eax

mov eax, [array1 + 4]   ;Swap the second outermost elements of each array
mov ebx, [array2 + 12]
mov [array1 + 4], ebx
mov [array2 + 12], eax

mov eax, [array1 + 8]   ;Swap the center elements
mov ebx, [array2 + 8]
mov [array1 + 8], ebx
mov [array2 + 8], eax

mov eax, [array1 + 12]  ;Swap the second outermost elements of each array
mov ebx, [array2 + 4]
mov [array1 + 12], ebx
mov [array2 + 4], eax

mov eax, [array1 + 16]  ;Swap last element of array1 with the 1st element of array2
mov ebx, [array2 ]
mov [array1 + 16], ebx
mov [array2], eax

;PHASE 2
mov eax, [array1]       ;Subtracts the first element of array2 from array1
sub eax, [array2]
mov [array3], eax

mov eax, [array1 + 4]   ;Subtracts the second element of array2 from array1
sub eax, [array2 + 4]
mov [array3 + 4], eax

mov eax, [array1 + 8]   ;Subtracts the third element of array2 from array1
sub eax, [array2 + 8]
mov [array3 + 8], eax

mov eax, [array1 + 12]  ;Subtracts the fourth element of array2 from array1
sub eax, [array2 + 12]
mov [array3 + 12], eax

mov eax, [array1 + 16]  ;Subtracts the five element of array2 from array1
sub eax, [array2 + 16]
mov [array3 + 16], eax

    invoke ExitProcess,0
main endp
end main