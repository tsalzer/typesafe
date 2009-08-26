# additional features for all objects

class TypeCheckError < RuntimeError ; end

# TypeSafe module.
# This module will be included into Object to provide Object#must_be_kind_of.
module TypeSafe
  # this class or object must be kind of a given class.
  def must_be_kind_of(clss, &blk)
    if clss.kind_of?(Module) or clss.kind_of?(Class)
      matched = if self.kind_of?(Class)
        # classes are expected to "descend" from comparator
        if self != clss
          #puts "self: #{self} super: #{self.superclass}"
          self.superclass ? self.superclass.must_be_kind_of(clss) : self.kind_of?(clss)
        else
          true
        end
      else
        #puts "directly checking object"
        # objects are expected to implement comparator
        self.kind_of?(clss)
      end
      
      unless matched
        if blk
          yield self.class
        else
          raise TypeCheckError.new("#{self} must be of type #{clss}")
        end
      end
    else
      raise "class to check #{self} for must be a Class or Module, but is  #{clss}"
    end
    self
  end
  alias must_be_a must_be_kind_of

  # this class or object must be kind of a given class or nil.
  def must_be_nil_or_kind_of(clss, &blk)
    self.kind_of?(NilClass) ? true : must_be_kind_of(clss, &blk)
  end
end#TypeSafe

Object.send :include, TypeSafe
