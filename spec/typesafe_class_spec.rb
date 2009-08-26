require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe TypeSafe, ".must_be_kind_of" do
  it "should recognize ClassA as kind of Object" do
    lambda{ClassA.must_be_kind_of(Object)}.should_not raise_error(TypeCheckError)
  end
  it "should recognize ClassB as kind of ClassA" do
    lambda{ClassB.must_be_kind_of(ClassA)}.should_not raise_error(TypeCheckError)
  end
  it "should not recognize ClassC as kind of ClassA" do
    lambda{ClassC.must_be_kind_of(ClassA)}.should raise_error(TypeCheckError)
  end
  it "should not recognize ClassC as kind of ModA" do
    lambda{ClassC.must_be_kind_of(ModA)}.should raise_error(TypeCheckError)
  end
  it "should recognize ClassD as kind of ModA" do
    lambda{ClassD.must_be_kind_of(ModA)}.should_not raise_error(TypeCheckError)
  end
end
