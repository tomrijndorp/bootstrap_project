#include "lib/foo.hpp"

#include <optional>

int main(int argc, char* argv[]) {
    std::optional<int> x{1};
    return foo() + *x;
}
