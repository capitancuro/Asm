// main.cpp - Testing the LongestIncreasingSequence subroutine.
#include <iostream>
#include "Longest.h"

using namespace std;

int main()
{

	const unsigned ARRAY_SIZE = 18;
	long array[] = { 1, 2, 3, 4, 5, 6, 9, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4 };
	Longest sequence = Longest(array, ARRAY_SIZE);
	cout << "The longest increasing sequence is " << sequence.length << endl;
	system("PAUSE");
	return 0;
}
