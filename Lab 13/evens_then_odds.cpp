//#include "catch.hpp"
#include "evens_then_odds.h"

int main(int argc, char** argv) {
	int test_1[] = {1,2,3,4,5,6,7,8,9};
	int final_test_1[] = {8,2,6,4,5,3,7,1,9};
	evens_then_odds(test_1, 9);
	return 1;
}

void evens_then_odds( int numbers[] , int size) {
	int* head = &numbers[0];	
	int* tail = &numbers[0] + (size - 1);

	for (int i = 0; i < (size / 2); i++) {
		if ((*head % 2 != 0) && (*tail % 2 == 0)) {
			numbers[i] = numbers[size - 1 - i] + numbers[i];
			numbers[size - 1 - i] = numbers[size - 1 - i] - numbers[i];
			numbers[i] = numbers[size - 1 - i] - numbers[i];
		}
		head++;
		tail--;
	}

	printf("%d : %d\n", *head, *tail);

	for (int i = 0; i < size; i++)
		std::cout << numbers[i] << ", ";
	std::cout << "\n";
}
