#include "gtest/gtest.h"
extern "C" {
#include "print/print_fctn.h"
}

namespace testing {

class GtestForC : public testing::Test
{
	void SetUp(){
	}
 
	void TearDown(){}
};
 
TEST_F(GtestForC, basic_test_to_check_gtest) {
	EXPECT_EQ(1, 1);
}

TEST_F(GtestForC, check_hello_world_string_from_c) {
	const char * kHelloString = printHello();
	ASSERT_STREQ("Hello World!\n", kHelloString);
}
} // namespace

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}

