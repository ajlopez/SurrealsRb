
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
		puts "lessOrEqual #{self} #{x}"
		result1 = @left.notGreaterOrEqual(x)
		result2 = notGreaterOrEqual(x.right)
		
		puts "Result1 #{result1}"
		puts "Result2 #{result2}"
		
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
			return x.less(self)
		end
		
		x.each do |element|
			if not x.less(self)
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
		
		@left.each do |number|
			return number.leftNatural?
		end
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
		
		@right.each do |number|
			return number.rightNatural?
		end
	end
	
	def to_s
		if zero?
			return "0"
		end
		
		if leftNatural?
			return (@left.to_s.to_i + 1).to_s
		end
		
		if rightNatural?
			return (@right.to_s.to_i - 1).to_s
		end
		
		return super.to_s
	end
end

end