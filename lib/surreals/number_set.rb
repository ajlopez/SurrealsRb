
require 'set'

module Surreals

class NumberSet < Set
	def notGreaterOrEqual(x)
		if self.empty?
			return true
		end
	end
end

end