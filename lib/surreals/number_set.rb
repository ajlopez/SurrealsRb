
require 'set'

module Surreals

class NumberSet < Set
	def notGreaterOrEqual(x)
		if self.empty?
			return true
		end
		
		self.each do |element|
			if not element.notGreaterOrEqual(x)
				return false
			end
		end
		
		return true
	end
	
	def greatestNumber
		result = nil
		
		self.each do |number|
			if result == nil
				result = number
			elsif result.less(number)
				result = number
			end
		end
		
		return result
	end
	
	def lessNumber
		result = nil
		
		self.each do |number|
			if result == nil
				result = number
			elsif number.less(result)
				result = number
			end
		end
		
		return result
	end
	
	def to_s
		result = "{"
		
		n = 0

		self.each do |number|
			if n > 0
				result += ' '
			end
			result = result + number.to_s
			n += 1
		end
		
		result += "}"
		
		return result
	end
end

end