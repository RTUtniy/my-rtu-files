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
	MenuItem(): nosaukums("B/N"), cena(0), kalorijas(0){}
	MenuItem(string n, float c, unsigned k): nosaukums(n), cena(c), kalorijas(k){}
	virtual ~MenuItem();
	virtual string print() const;
	float    GetCena()      const {return cena;}
	string   GetNosaukums() const {return nosaukums;}
	unsigned GetKalorijas() const {return kalorijas;}
	void SetCena(float c)         {cena = c;}
	void SetNosaukums(string n)   {nosaukums = n;}
	void SetKalorijas(unsigned k) {kalorijas = k;}
	void SetAttr(string n, float c, unsigned k) {
        nosaukums = n;
        cena = c;
        kalorijas = k;
    }
};