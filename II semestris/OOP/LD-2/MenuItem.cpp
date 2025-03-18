#include "MenuItem.h"
#include <iostream>
using namespace std;

void MenuItem::SetNosaukums(string n) {
	this->nosaukums = n;
}

void MenuItem::SetCena(float c) {
	this->cena = c;
}

void MenuItem::SetKalorijas(unsigned k) {
	this->kalorijas = k;
}

MenuItem::MenuItem() {
	SetNosaukums("Bez nosaukuma");
	SetCena(0.0);
	SetKalorijas(0);
}

MenuItem::MenuItem(string nosaukums, float cena, unsigned kalorijas) {
	SetNosaukums(nosaukums);
	SetCena(cena);
	SetKalorijas(kalorijas);
}

string MenuItem::GetNosaukums() const {
	return this->nosaukums;
}

float MenuItem::GetCena() const {
	return this->cena;
}

unsigned MenuItem::GetKalorijas() const {
	return this->kalorijas;
}

string MenuItem::print() const {
	return GetNosaukums() + " (" + to_string(GetCena()) + ", " + to_string(GetKalorijas()) + " J)";
}

MenuItem::~MenuItem() {
	cout << "MenuItem \"" << GetNosaukums() << "\" dezintegreets" << endl;
}