# additional features for all objects

class TypeCheckError < RuntimeError ; end

module TypeSafe
module ObjectTypeChecks
  # this object must be kind of a given class.
  def must_be_kind_of(clss)
    if clss.kind_of?(Module)
      raise TypeCheckError.new("#{self} must include module #{clss}") unless self.kind_of?(clss)
    elsif clss.kind_of?(Class)
      raise TypeCheckError.new("#{self} must be of type #{clss}") unless self.kind_of?(clss)
    else
      raise "class to check #{self} for must be a Class or Module, but is  #{clss}"
    end
    true
  end
  alias must_be_a must_be_kind_of

  # this object must be kind of a given class.
  def must_be_nil_or_kind_of(clss)
    self.kind_of?(NilClass) ? true : must_be_kind_of(clss)
  end

end#ObjectTypeChecks

module ClassTypeChecks
  # this object must be kind of a given class.
  def class_must_be_kind_of(clss)
    if clss.kind_of?(Module)
      raise TypeCheckError.new("#{self} must include module #{clss}") unless self.kind_of?(clss)
    elsif clss.kind_of?(Class)
      raise TypeCheckError.new("#{self} must be of type #{clss}") unless self.kind_of?(clss)
    else
      raise "class to check #{self} for must be a Class or Module, but is  #{clss}"
    end
    true
  end
  alias class_must_be_a class_must_be_kind_of
  
  # this object must be kind of a given class.
  def must_be_nil_or_kind_of(clss)
    self.kind_of?(NilClass) ? true : must_be_kind_of(clss)
  end
  
end#ClassTypeChecks

Object.send :include, ObjectTypeChecks
Class.send :include, ClassTypeChecks

end#TypeSafe
