
require 'set'

module Surreals

class NumberSet < Set
	def notGreaterOrEqual(x)
		puts "notGreaterOrEqual #{self} #{x}"
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