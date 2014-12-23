#include "gtest/gtest.h"
extern "C" {
#include "print/print_fctn.h"
}

namespace testing {

class MyAppTestSuite : public testing::Test
{
	void SetUp(){
	}
 
	void TearDown(){}
};
 
TEST_F(MyAppTestSuite, basic_test_to_check_gtest) {
	EXPECT_EQ(1, 1);
}

TEST_F(MyAppTestSuite, check_print) {
	const char * kHelloString = printHello();
	ASSERT_STREQ("Hello World!\n", kHelloString);
}
} // namespace

int main(int argc, char **argv) {
  ::testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}

