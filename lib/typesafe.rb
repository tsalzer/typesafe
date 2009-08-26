# additional features for all objects

# TypeSafe module.
# This module will be included into Object to provide Object#must_be_kind_of.
#
# Usage
#
# If you need e.g. an argument be of a specific type, you can simply write
#
#  def myfunc(arg)
#    arg.must_be_kind_of(MyFancyClass)
#    arg.do_fancy_stuff
#  end
#
# This would raise a TypeError in case you somehow passed in a type not matching
# your MyFancyClass, which would stop your app dead at a point you know. This is
# probably better than chasing the wrong parameter all the way down your application.
#
# However, being dynamic, you might just need to apply a special treatment to your
# argument in case it's not what you would expect:
#
#  def my2ndfunc(arg)
#    puts arg.must_be_kind_of(String) {|x| x.to_s}
#  end
# 
# In this second case, no exception is raised, but your block is executed. Most
# important, the return value of your block is returned as value from the method.
#
module TypeSafe
  # this class or object must be kind of a given class.
  # Method returns <tt>self</tt> unless it raises a TypeError.
  def must_be_kind_of(clss, &blk)
    if clss.kind_of?(Module) or clss.kind_of?(Class)
      matched = if self.kind_of?(Class)
        # classes are expected to "descend" from comparator
        if self != clss
          self.superclass ? self.superclass.must_be_kind_of(clss) : self.kind_of?(clss)
        else
          true
        end
      else
        # objects are expected to implement comparator
        self.kind_of?(clss)
      end
      
      unless matched
        if blk
          return yield self.class
        else
          raise TypeError.new("#{self} must be of type #{clss}")
        end
      end
    else
      raise "class to check #{self} for must be a Class or Module, but is  #{clss}"
    end
    self
  end
  alias must_be_a must_be_kind_of

  # this class or object must be kind of a given class or nil.
  # This method is probably a bad idea, so it will be removed.
  def must_be_nil_or_kind_of(clss, &blk)
    self.kind_of?(NilClass) ? true : must_be_kind_of(clss, &blk)
  end
end#TypeSafe

Object.send :include, TypeSafe
