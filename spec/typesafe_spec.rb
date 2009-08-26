require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

{:must_be_kind_of => false, :must_be_a => false, :must_be_nil_or_kind_of => true}.each do |method, nil_allowed|
  describe TypeSafe, ".#{method}" do
    it "should be included in Object class" do
      Object.new.should respond_to(method)
    end
    it "should recognize a simple type" do
      lambda{1.send method, Fixnum}.should_not raise_error(TypeCheckError)
    end
    it "should recognize parent classes" do
      lambda{self.send method, Object}.should_not raise_error(TypeCheckError)
    end
    it "should raise a TypeCheckError for mismatching types" do
      lambda{"1".send method, Fixnum}.should raise_error(TypeCheckError)
    end
    it "should not raise a TypeCheckError for mismatching types if a block was given" do
      lambda{"1".send method, Fixnum do |clss|
        clss.should be_a Class
        clss.should == String
        end}.should_not raise_error(TypeCheckError)
    end
    it "should execute the given block for mismatching types" do
      executed = false
      lambda{"1".send method, Fixnum do |clss|
        clss.should be_a Class
        clss.should == String
        executed = true
        end}.should_not raise_error(TypeCheckError)
        executed.should == true
    end
    it "should not execute the given block for matching types" do
      executed = false
      lambda{1.send method, Fixnum do |clss|
        clss.should be_a Class
        clss.should == Fixnum
        executed = true
        end}.should_not raise_error(TypeCheckError)
        executed.should == false
    end
    
    it "should raise a RuntimeError if the given match is not a Class" do
      lambda{"1".send method, "Fixnum"}.should raise_error(RuntimeError)
      lambda{"1".send method, "Fixnum"}.should_not raise_error(TypeCheckError)
    end
    
    it "should #{nil_allowed ? 'not ' : ''}raise a TypeCheckError for mismatching types on nil" do
      lambda{nil.send method, Fixnum}.send nil_allowed ? :should_not : :should, raise_error(TypeCheckError)
    end
    
    it "should recognize included modules" do
      module TestModule ; end
      class TestClass
        include TestModule
      end
      o = TestClass.new
      lambda{o.send method, TestModule}.should_not raise_error(TypeCheckError)
    end
  end
end