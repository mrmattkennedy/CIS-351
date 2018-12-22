#include "evens_then_odds.h"
#include "catch.hpp"

void evens_then_odds( int numbers[] , int size) {
	int* head = &numbers[0];	
	int* tail = &numbers[0] + (size - 1);

	for (int i = 0; i < (size / 2); i++) {
		while (*head % 2 == 0) //find first even number
			head++;
		while (*tail % 2 != 0) //find first odd number
			tail--;
		if (tail < head) //if even comes before odd, break.
			break;

		int temp = *tail;
		*tail = *head;
		*head = temp;
	}
}

