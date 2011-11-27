
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
	
	def next
		return Number.new NumberSet.new [self]
	end
	
	def previous
		return Number.new NumberSet.new, NumberSet.new([self])
	end
	
	def lessOrEqual(x)
		result1 = @left.notGreaterOrEqual(x)
		result2 = notGreaterOrEqual(x.right)
		
		return (result1 and result2)
	end
	
	def less(x)
		return (lessOrEqual(x) and not x.lessOrEqual(self))
	end
	
	def greater(x)
		return x.less(self)
	end
	
	def eqv?(x)
		return (lessOrEqual(x) and x.lessOrEqual(self))
	end
	
	# self ~>= x
	def notGreaterOrEqual(x)
		if x.is_a? Number
			return less(x)
		end
		
		x.each do |element|
			if not notGreaterOrEqual(element)
				return false
			end
		end
		
		return true
	end
	
	def leftNatural?
		if not @right.empty?
			return false
		end
		
		if @left.empty?
			return true
		end
		
		if @left.length > 1
			return false
		end

		return @left.first.leftNatural?
	end
	
	def rightNatural?
		if not @left.empty?
			return false
		end
		
		if @right.empty?
			return true
		end

		if @right.length > 1
			return false
		end
		
		return @right.first.rightNatural?
	end
	
	def equalSets?(x)
		return (left.equal?(x.left) and right.equal?(x.right))
	end
	
	def equal?(x)
		return equalSets?(x)
	end
	
	def to_s
		if zero?
			return "0"
		end
		
		if leftNatural?
			return (@left.first.to_s.to_i + 1).to_s
		end
		
		if rightNatural?
			return (@right.first.to_s.to_i - 1).to_s
		end
	
		return "<" + @left.to_s + ":" + @right.to_s + ">"
	end
end

end