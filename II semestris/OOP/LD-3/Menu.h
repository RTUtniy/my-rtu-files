#pragma once
#include "MainCourse.h"

class MenuSizeException {};

class Menu
{
private:
	MainCourse** Items = NULL;
	static const unsigned DEFAULT_MAX_SIZE = 5;
	unsigned maxSize;
	unsigned size;
public:
	Menu(): maxSize(DEFAULT_MAX_SIZE), size(0){
		Items = new MainCourse*[maxSize];
	}
	Menu(unsigned maxSize_inputted) : maxSize(maxSize_inputted), size(0) {
		Items = new MainCourse*[maxSize];
	}
	~Menu();
	static unsigned GetDefaultMaxSize() { return DEFAULT_MAX_SIZE; }
	int GetMaxSize() const { return maxSize; }
	int GetSize() const { return size; }
	void append(MainCourse& a);
	void printAll() const;
	float GetMinPrice();
};