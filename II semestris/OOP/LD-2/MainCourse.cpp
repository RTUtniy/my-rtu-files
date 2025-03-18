#include "MainCourse.h"
#include <iostream>
using namespace std;

string MainCourse::print() const {
	return MenuItem::print() + ", " + to_string(GetCookingTime()) + " m";
}

MainCourse::~MainCourse() {
	cout << "MainCourse \""<< GetNosaukums() << "\" dezintegrēts" << endl;
}