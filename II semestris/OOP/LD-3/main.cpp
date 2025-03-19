#include "Menu.h"
#include <iostream>
using namespace std;

int main(){
	MainCourse item1("eediens", 2, 2.0, 500);
	MainCourse item2;
	item2.SetNosaukums("Cits eediens");
	cout << "******Two local Auditorium objects:" << endl;
	item1.Print();
	item2.Print();

	// Register of Classrooms
	cout << "Default max size of the Classrooms Register: " << ClassroomRegister::GetDefaultMaxSize() << endl;
	Menu MyMenu(3);
	cout << "****** Classrooms Register for maximum " << MyMenu.GetMaxSize() << " items created" << endl;

	try {
		MyMenu.append(item1);
		MyMenu.append(item2);
		Auditorium* pa = new Auditorium("Zunda krastmala 8", "Zkr8-302", 652, 550);
		MyMenu.Add(*pa);
		delete pa;
		MyMenu.Add(*(new Auditorium("P. Valdena 5", "Val5-101", 284, 200)));

		cout << endl << "******Items of the Classrooms Register:" << endl;
		MyMenu.printAll();
	}
	catch (MenuSizeException) {
		cout << endl << "====== ERROR: Maximum size exceeded! ======" << endl;
	}
	catch (...) {
		cout << endl << "====== ERROR: Unknown exception! ======" << endl;
	}

	cout << "The lagest classroom has " << MyMenu.MaxSeats() << " seats" << endl;
	return 0;
}