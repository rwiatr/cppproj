#include "gtest/gtest.h"

namespace cppproj {
  class TestA : public ::testing::Test {
   protected:
    TestA() {}
    virtual ~TestA() {}
    virtual void SetUp() {}
    virtual void TearDown() {}
  };
  
  TEST_F(TestA, example_test) {
	EXPECT_EQ(true, true);
  }
}