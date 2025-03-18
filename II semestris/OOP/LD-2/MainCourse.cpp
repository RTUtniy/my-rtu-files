#include "MainCourse.h"
#include <iostream>
using namespace std;

MainCourse::MainCourse() {
	MenuItem();
}

MainCourse::MainCourse(string nosaukums, float cena, unsigned kalorijas) {
	MenuItem::SetNosaukums(nosaukums);
	MenuItem::SetCena(cena);
	MenuItem::SetKalorijas(kalorijas);
}

void MainCourse::SetCookingTime(float t) {
	this->cookingTime = t;
}

MainCourse::MainCourse(string nosaukums, float cena, unsigned kalorijas, float t) {
	MenuItem::SetNosaukums(nosaukums);
	MenuItem::SetCena(cena);
	MenuItem::SetKalorijas(kalorijas);
	MainCourse::SetCookingTime(t);
}

MainCourse::~MainCourse() {
	cout << "MainCourse \""<< GetNosaukums() << "\" dezintegrçts" << endl;
}

string MainCourse::print() const {
	return MenuItem::print() + "(MainCourse)";
}

float MainCourse::GetCookingTime() const {
	return this->cookingTime;
}