#pragma once
#include "MenuItem.h"
using namespace std;

class MainCourse: public MenuItem
{
protected:
	float cookingTime;
public:
	MainCourse();
	MainCourse(string, float, unsigned);
	virtual ~MainCourse();
	virtual string print() const;
	inline float GetCookingTime() const;
	inline void SetCookingTime(float t);
};

