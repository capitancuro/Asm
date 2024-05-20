#pragma once
#include <iostream>

class Longest {														//The class that processes the array to find the longest sequence

	
	long Sequence(long array[], unsigned ARRAY_SIZE) {				//The function that steps through the array of 
		long count = 0, temp = 0, limit = ARRAY_SIZE - 1;			//numbers to find the length of the longest sequence

		//The inline assembly code to step through the array, 
		// comaring adjacent indices, to find the longest increasing sequence
		__asm
		{
			mov eax, array
			mov ebx, 0
			mov edx, 0

			mov ecx, ARRAY_SIZE
			longestSeq :

				cmp ebx, limit
				jl check

				next:
					inc ebx

			loop longestSeq											//Steps through the array

			jmp done

			check:													//Checks if right operand is largest
				mov edx, [eax + ebx*4 + 4]
				cmp [eax + ebx*4], edx
				jl track
				jmp reset

			track:													//Tracks all times the right operand is largest
				mov edx, count
				cmp temp, edx
				jl track_longest

				add count, 1
				jmp next

			reset:													//Resets if the right operand is not largest
				mov edx, count
				cmp temp, edx
				jl reset_longest

				mov count, 0
				jmp next

			track_longest:
				mov temp, edx
				add count, 1
				jmp next

			reset_longest:
				mov temp, edx
				mov count, 0
				jmp next

			last:
				add temp, 1
				jmp finish

			done:
				cmp temp, 0
				jne last

			finish:
				mov edx, temp
				mov count, edx
		}
		return count;
	}

public:
	long length = 0;

	Longest(long array[], unsigned ARRAY_SIZE) {					//Constructor function that calls the private function 
		length = Sequence(array, ARRAY_SIZE);						//to find the length of the longest increasing sequence
	}

};
