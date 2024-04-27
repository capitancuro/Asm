.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	var1 BYTE 'W'
	var2 BYTE 'X'
	var3 BYTE 'Y'
	var4 BYTE 'Z'
	
.code
main proc
				;PHASE 1
mov ah, var1	;We use the specialized reigsters for eax and ebx to work with the variables b/c they are each a byte
mov al, var4	;The speicalized registers are used to temporarily store the value of the variables to be overwritten
mov var1, al
mov al, var2
mov var2, ah
mov ah, var3
mov var3, al
mov var4, ah
				;PHASE 2
mov eax, 0		;We start by initializing eax to 00000000
add ah, var1	;We then use the sub-registers of ax to store var1 and var2
add al, var2

add eax, eax	;We shift the value of EAX leftward using the add instruction
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax
add eax, eax

add ah, var3	;We overwrtie the value of the lower 16 bits with var3 and var4
add al, var4

				;PHASE 3
mov ebx, 0		;We start by initializing ebx to 0
sub bh, var1	;We then subtract the hex values for each character fromt he sub-registers of bx
sub bl, var2	;A 16 borrowed for each since the value ebx is initialized ot is 00000000

add ebx, ebx	;We shift the value stored in bx to the upper 16 bits of the register
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx
add ebx, ebx

sub bh, var3 ;We find the two's complement of the remaining values by subtracting the varibles from bx (0000)
sub bl, var4

	invoke ExitProcess,0
main endp
end main
