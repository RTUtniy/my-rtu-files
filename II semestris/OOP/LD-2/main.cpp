#include "./MenuItem.h"
#include "./MainCourse.h"
#include <iostream>
using namespace std;

int main(){
	const int SIZE = 2;
	MenuItem* objArray = new MenuItem[SIZE];
	cout << "===Setting objects in array===" << endl;
	
	cout << "...setting 0..." << endl;
	objArray[0].SetAttr("Ābolu sula", 0.69, 160);
	cout << "...setting 1..." << endl;
	objArray[1].SetAttr("Rīsi ar kotleti", 1.10, 220);
	// rīsi nevar būt atributēti kā MainCourse (ar 4 metodes parametriem), 
	// jo šis objekts ir tieši masīvā
	cout << "===Objects are set===" << endl;
	
	cout << "Objects: " << endl;
	for (int index = 0; index < SIZE; index++) {
		cout << objArray[index].print() << endl;
	}
	
	cout << "===Deleting object array===" << endl;
	delete[] objArray;
	cout << "===Object array is deleted===" << endl;
	
	cout << endl; // -----------------------------------------------------------
	
	MenuItem* pointerArray[SIZE];
	
	cout << "===Adding pointers in array===" << endl;
	cout << "...setting 0..." << endl;
	pointerArray[0] = new MainCourse("Rīsi ar kotleti", 1.10, 220, 35.0);
	// šeit rīsi var būt MainCourse, 
	// jo tas neatrodas masīvā – masīvā ir pointer uz rīsiem (sakrīt virsklase)
	cout << "...setting 1..." << endl;
	pointerArray[1] = new MenuItem("Ābolu sula", 0.69, 160);
	cout << "===Pointers are added===" << endl;
	
	cout << "Pointers: " << endl;
	for (int index = 0; index < SIZE; index++) {
		cout << pointerArray[index]->print() << endl;
	}
	
	cout << "===Deleting pointers===" << endl;
	for (int index = 0; index < SIZE; index++) {
		cout << "...deleting pointer on " << pointerArray[index]->GetNosaukums() << "..." << endl;
		delete pointerArray[index];
	}
	// Deletojot rīsus, deletojas arī to virsklase, tāpēc ir divi paziņojumi
	cout << "===Pointers are deleted===" << endl;
	cout << "Finish!" << endl;
	return 0;
}