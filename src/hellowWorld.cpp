#include <iostream>

/**
 * Writes a greeting to standard output.
 *
 * A non-zero exit code indicates that standard output rejected the greeting,
 * so callers can detect and handle command-line output failures.
 */
int main()
{
    // Write the greeting once and flush it explicitly before checking the stream.
    std::cout << "Hello Rajesh!\n";
    std::cout.flush();

    // A failed output stream may be caused by a broken pipe or unavailable output device.
    if (!std::cout)
    {
        std::cerr << "Failed to write greeting to standard output.\n";
        return 1;
    }

    return 0;
}