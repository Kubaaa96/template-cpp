#include <gtest/gtest.h>
#include <fmt/core.h>

struct ExampleTest : testing::Test {
};

TEST_F(ExampleTest, test){
    fmt::print("Wow");
    ASSERT_TRUE(true);
}