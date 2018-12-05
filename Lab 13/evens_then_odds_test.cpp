/*
	Composition Lab:

	Lab is intended to examine the difference between coding a C++ version and assembly version
	while also examining how a compiler might generate assembly code.

	Commands to run:
	Mac OSX: clang++ -std=c++11 -stdlib=libc++ evens_then_odds_test.cpp evens_then_odds.cpp -o evens_then_odds
	EOS: g++ -std=c++11 evens_then_odds_test.cpp evens_then_odds.cpp -o evens_then_odds
*/

#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file
#include "catch.hpp"
#include "evens_then_odds.h"

// Arrays for different test cases.
int test_1[] = {1,2,3,4,5,6,7,8,9};
int final_test_1[] = {8,2,6,4,5,3,7,1,9};

int test_2[] = {1,3,5,7,9,2,4,6,8};
int final_test_2[] = {8,6,4,2,9,7,5,3,1};

int test_3[] = {1,2,3,9,8,7,4,5,6};
int final_test_3[] = {6,2,4,8,9,7,3,5,1};

int test_4[] = {2, 4, 6, 4, 1, 3, 7};
int final_test_4[] = {2, 4, 6, 4, 1, 3, 7};

int test_5[] = {1, 3, 5, 7, 9};
int final_test_5[] = {1, 3, 5, 7, 9};

// Checks the total number of differences between 
// two arrays.
int check_num_diffs(int test[], int check[], int size) {
	int num_diff = 0;
	// Ensure the elements are the same.
	for(int i = 0; i < size; ++i) {
		if(test[i] != check[i]) {
			num_diff++;
		}
	}
	return num_diff;
}

TEST_CASE( "Test Sequential.", "[evens_then_odds]" ) {
	// Test Sequential.
	evens_then_odds(test_1, 9);
	REQUIRE( check_num_diffs(test_1, final_test_1, 9) == 0);
}

TEST_CASE( "Test Opposite.", "[evens_then_odds]" ) {
	// Test Opposite.
	evens_then_odds(test_2, 9);
	REQUIRE( check_num_diffs(test_2, final_test_2, 9) == 0);
}

TEST_CASE( "Test Triplets.", "[evens_then_odds]" ) {
	// Test Triplets
	evens_then_odds(test_3, 9);
	REQUIRE( check_num_diffs(test_3, final_test_3, 9) == 0);
}

TEST_CASE( "Test Already Ordered.", "[evens_then_odds]" ) {
	// Test Already Ordered
	evens_then_odds(test_4, 7);
	REQUIRE( check_num_diffs(test_4, final_test_4, 7) == 0);
}

TEST_CASE( "Test Odds.", "[evens_then_odds]" ) {
	// Test Odds
	evens_then_odds(test_5, 5);
	REQUIRE( check_num_diffs(test_5, final_test_5, 5) == 0);	
}
