require 'surreals'
require 'test/unit'

class TestNumber < Test::Unit::TestCase
	def test_creates_zero
		zero = Surreals::Number.new
		assert zero.valid?
		assert zero.zero?
		assert zero.left.empty?
		assert zero.right.empty?
	end
	
	def test_creates_one
		one = Surreals::Number.new Surreals::NumberSet.new [ Surreals::Number.new ]
		assert one.valid?
		assert_equal false, one.zero?
	end
	
	def test_zero_less_or_equal_than_zero
		zero = Surreals::Number.new
		
		assert zero.lessOrEqual(zero)
	end
	
	def test_zero_less_or_equal_than_one
		zero = Surreals::Number.new
		one = Surreals::Number.new Surreals::NumberSet.new [ Surreals::Number.new ]
		
		assert zero.less(one)
		assert one.greater(zero)
		assert (not one.less(zero))
		assert (not zero.greater(one))
		
		assert zero.lessOrEqual(one)
		assert (not one.lessOrEqual(zero))
	end
	
	def test_zero_equal_zero
		zero = Surreals::Number.new
		
		assert zero.equal(zero)
	end
	
	def test_one_equal_one
		one = Surreals::Number.new Surreals::NumberSet.new [ Surreals::Number.new ]
		
		assert one.equal(one)
	end
end
