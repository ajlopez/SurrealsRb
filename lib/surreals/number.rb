
require 'set'

module Surreals

class Number
	attr_reader :left
	attr_reader :right
	
    def initialize(left=Set.new, right=Set.new)
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
end

end