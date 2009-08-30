$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'typesafe'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  
end

# a class hierarchy to check

# plain module
module ModA
  def moda_method ; end
end
# plain class
class ClassA
end
# class derived from ClassA
class ClassB < ClassA
end
# plain class, extends module ModA, thereby descending ModA
class ClassC
  extend ModA
end
# plain class, includes module ModA, thereby not descending ModA
class ClassD
  include ModA
end

