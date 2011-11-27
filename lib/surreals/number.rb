
require 'set'

module Surreals

class Number
	attr_reader :left
	attr_reader :right
	
    def initialize(left=NumberSet.new, right=NumberSet.new)
		@left = left
		@right = right
    end	
	
	def valid?
		if @left.empty?
			return true
		end
		
		if @right.empty?
			return true
		end
		
		return false
	end
	
	def zero?
		return (@left.empty? and @right.empty?)
	end
	
	def lessOrEqual(x)
		return (@left.notGreaterOrEqual(x) and notGreaterOrEqual(x.right))
	end
	
	def less(x)
		return (lessOrEqual(x) and not x.lessOrEqual(self))
	end
	
	def greater(x)
		return x.less(self)
	end
	
	def equal(x)
		return (lessOrEqual(x) and x.lessOrEqual(self))
	end
	
	# self ~>= x
	def notGreaterOrEqual(x)
		if x.is_a? Number
			return x.less(self)
		end
		
		x.each do |element|
			if not notGreaterOrEqual(x)
				return false
			end
		end
		
		return true
	end
end

end