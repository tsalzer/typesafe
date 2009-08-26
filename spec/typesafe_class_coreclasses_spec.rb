require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe TypeSafe, ".must_be_kind_of" do
  it "should recognize Class as kind of Object" do
    lambda{Class.must_be_kind_of(Object)}.should_not raise_error(TypeCheckError)
  end
  it "should recognize Object as kind of Class" do
    lambda{Object.must_be_kind_of(Class)}.should_not raise_error(TypeCheckError)
  end
  it "should recognize Fixnum as kind of Integer" do
    lambda{Fixnum.must_be_kind_of(Integer)}.should_not raise_error(TypeCheckError)
  end
  it "should recognize Bignum as kind of Integer" do
    lambda{Bignum.must_be_kind_of(Integer)}.should_not raise_error(TypeCheckError)
  end
end
