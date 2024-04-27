; Program template

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

   msgforward WORD 6 DUP(?)
   msgbackward WORD 6 DUP(?)
   restore_esp DWORD ?

.code
main proc
  
  mov restore_esp, esp ; save the contents of register ESP so it can be restored before the program finishes
                       ; DO NOT REMOVE THIS

  ; clear the registers

  mov eax, 0
  mov ebx, 0
  mov ecx, 0
  mov edx, 0
  mov esi, 0
  mov edi, 0
  mov esp, 0
  mov ebp, 0

     ; store the message "Welcome Home" in reverse order across the six 16-bit registers

   mov ax, "43"
   mov bx, "21"
   mov si, " 0"
   mov di, "MV"
   mov sp, "TO"
   mov bp, "AC"


 ;PHASES 1
 ;Assing all the strings to indices within the array
 ;You have to access the indices of the array by increments of 2 because the size of each index is a word
 mov [msgforward], bp
 mov [msgforward + 2], sp
 mov [msgforward + 4], di
 mov [msgforward + 6], si

 mov [msgforward + 8], bx
 mov [msgforward + 10], ax

 ;PHASES 2
 ;Swap the letters of the strings for the general arrays using both ecx and edx since you can only
 ;access the entirety of the 16 bits
 mov cx, bp
 mov dh, cl
 mov dl, ch
 mov bp, dx

 mov cx, sp
 mov dh, cl
 mov dl, ch
 mov sp, dx

 mov cx, di
 mov dh, cl
 mov dl, ch
 mov di, dx

 mov cx, si
 mov dh, cl
 mov dl, ch
 mov si, dx

 ;Use the lower 8 bit segments to swap the letters for eax and ebx
 ;These registers aren't stirctly 16bit 
 mov cx, bx
 mov bh, cl
 mov bl, ch

 mov cx, ax
 mov ah, cl
 mov al, ch

 ;PHASES 3
 ;Assign the reversed letters to indices within the second array
 mov [msgbackward], ax
 mov [msgbackward + 2], bx
 mov [msgbackward + 4], si
 mov [msgbackward + 6], di

 mov [msgbackward + 8], sp
 mov [msgbackward + 10], bp

mov esp, restore_esp ; restore register ESP to it's original value so the program can end correctly
                     ; DO NOT REMOVE THIS

	invoke ExitProcess,0
main endp
end main
