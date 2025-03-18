#pragma once
#include <string>
#include <iostream>
using namespace std;
class MenuItem
{
protected:
	string nosaukums;
	float cena;
	unsigned kalorijas;
public:
	MenuItem();
	MenuItem(string, float, unsigned);
	virtual ~MenuItem();
	virtual string print() const;
	inline float GetCena() const;
	inline string GetNosaukums() const;
	inline unsigned GetKalorijas() const;
	inline void SetCena(float c);
	inline void SetNosaukums(string n);
	inline void SetKalorijas(unsigned k);
};