require 'surreals'
require 'test/unit'

class TestNumber < Test::Unit::TestCase
	@@zero = Surreals::Number.new
	@@one = Surreals::Number.new.next
	@@minusone = Surreals::Number.new.previous
	
	def test_creates_zero
		assert @@zero.valid?
		assert @@zero.zero?
		assert @@zero.left.empty?
		assert @@zero.right.empty?
	end
	
	def test_zero_to_s
		assert_equal "0", @@zero.to_s
	end
	
	def test_creates_one
		assert @@one.valid?
		assert_equal false, @@one.zero?
	end
	
	def test_zero_next_is_one
		assert_equal "1", @@one.to_s
	end
	
	def test_one_next_is_two
		two = @@one.next
		assert_equal "2", two.to_s
	end
	
	def test_one_to_s
		assert_equal "1", @@one.to_s
	end

	def test_minus_one_to_s
		assert_equal "-1", @@minusone.to_s
	end

	def test_minus_two_to_s
		assert_equal "-2", @@minusone.previous.to_s
	end
	
	def test_zero_less_or_equal_than_zero
		assert @@zero.lessOrEqual(@@zero)
	end
	
	def test_zero_less_or_equal_than_one
		assert @@zero.less(@@one)
		assert @@one.greater(@@zero)
		assert (not @@one.less(@@zero))
		assert (not @@zero.greater(@@one))
		
		assert @@zero.lessOrEqual(@@one)
		assert (not @@one.lessOrEqual(@@zero))
	end
	
	def test_zero_equal_zero
		assert @@zero.lessOrEqual(@@zero)
		assert @@zero.eqv?(@@zero)
	end
	
	def test_one_equal_one
		assert @@one.lessOrEqual(@@one)
		assert @@one.eqv?(@@one)
	end
end
