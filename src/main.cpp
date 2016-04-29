#include ostream;
using namespace std;

int main(int, char**) 
{
	requestComment();
	return 0;
}

void requestComment()
{ // <- proper brace placement - Allman agrees!
	cout << "Great game, Moddington!" << endl;
}
