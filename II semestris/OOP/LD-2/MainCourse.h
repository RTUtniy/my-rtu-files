#pragma once
#include "MenuItem.h"
using namespace std;

class MainCourse: public MenuItem
{
protected:
	float cookingTime;
public:
	float GetCookingTime() const {return cookingTime;}
	void SetCookingTime(float t) {cookingTime = t;}
	MainCourse():MenuItem(), cookingTime(0) {}
	MainCourse(string n, float c, unsigned k, float t):MenuItem(n, c, k){cookingTime = t;}
	void SetAttr(string n, float c, unsigned k, float t) {
        MenuItem::SetAttr(n, c, k);
        cookingTime = t;
    }
	virtual ~MainCourse();
	virtual string print() const;
};