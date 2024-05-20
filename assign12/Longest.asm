.586
.model flat,C
export LongestIncreasingSequence
LongestIncreasingSequence PROTO, array: PTR DWORD, n: DWORD

MAX_INT = 2147483647

.code
LongestIncreasingSequence PROC,  array:PTR DWORD, n:DWORD
	push ecx
	push esi
	push edi
	push ebp

	mov esi, array						;Array pointer
	mov edi, 0							;Array indexer

	mov ebp, n
	mov ecx, ebp						;Length of the array
	sub ebp, 1							;Bounds limits for comparisons

	mov eax, 0							;Counter			
	mov ebx, 0							;Temp
	mov edx, 0							


	longestSeq:

		cmp edi, ebp					;Checks as long as edi is less than the index of the last element
		jl check

		next:
			inc edi

	loop longestSeq

	jmp done

	check:
		mov edx, [esi + edi*4 + 4]		;Checks to see if the next number in the sequence is greater than the one before it
		cmp [esi + edi*4], edx
		jl track
		jmp reset


	track:								;Increments count by 1 if the next number is greater than the one before it
		cmp ebx, eax					
		jl track_longest

		add eax, 1
		jmp next

	reset:								;Resets count to 0 if the next number is less than or equal to the one before it
		cmp ebx, eax
		jl reset_longest

		mov eax, 0
		jmp next

	track_longest:
		mov ebx, eax
		add eax, 1
		jmp next

	reset_longest:
		mov ebx, eax
		mov eax, 0
		jmp next

	last:
		add ebx, 1
		jmp finish

	done:
		cmp ebx, 0
		jne last

	finish:
		mov eax, ebx

	pop ebp
	pop edi
	pop esi
	pop ecx
	ret
LongestIncreasingSequence ENDP

END

