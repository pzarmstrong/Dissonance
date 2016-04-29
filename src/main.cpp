int main(int, char**) 
{
	requestComment();
	return 0;
}

void requestComment()
{ // <- proper brace placement - Allman agrees!
	std::cout << "Great game, Moddington!";
}
