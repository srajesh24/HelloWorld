#include <iostream>

int main()
{
    std::cout << "Hello Rajesh!\n";
    std::cout.flush();
    if (!std::cout)
    {
        std::cerr << "Failed to write greeting to standard output.\n";
        return 1;
    }

    return 0;
}