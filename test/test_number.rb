require 'surreals'
require 'test/unit'

class TestNumber < Test::Unit::TestCase
	@@zero = Surreals::Number.new
	@@one = Surreals::Number.new.next
	@@minusone = Surreals::Number.new.previous
	
	def test_zero
		assert @@zero.valid?
		assert @@zero.zero?
		assert @@zero.left.empty?
		assert @@zero.right.empty?
		assert @@zero.leftNatural?
	end
	
	def test_zero_to_s
		assert_equal "0", @@zero.to_s
	end
	
	def test_one
		assert @@one.valid?
		assert (not @@one.zero?)
		assert @@one.leftNatural?
	end
	
	def test_minus_one
		assert @@minusone.valid?
		assert (not @@minusone.zero?)
		assert @@minusone.rightNatural?
	end
	
	def test_two
		two = @@one.next
		assert two.valid?
		assert (not two.zero?)
		assert two.leftNatural?
	end
	
	def test_zero_next_is_one
		assert_equal "1", @@one.to_s
	end
	
	def test_one_next_is_two
		two = @@one.next
		assert_equal "{1}", two.left.to_s
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
		assert @@zero.equalSets?(@@zero)
	end
	
	def test_one_equal_one
		assert @@one.lessOrEqual(@@one)
		assert @@one.eqv?(@@one)
		assert @@one.equalSets?(@@one)
		assert @@one.equalSets?(@@zero.next)
	end
	
	def test_minusone_compare_zero
		assert @@minusone.less(@@zero)
		assert @@zero.greater(@@minusone)
		assert @@minusone.notGreaterOrEqual(@@zero)
		assert (not @@zero.notGreaterOrEqual(@@minusone))
	end
	
	def test_composed_to_s
		set = Surreals::NumberSet.new [@@zero, @@one]
		number = Surreals::Number.new set
		assert number.valid?
		assert_equal "<{0 1}:{}>", number.to_s
	end
	
	def test_equivalence_to_zero_left_empty
		number = Surreals::Number.new Surreals::NumberSet.new, Surreals::NumberSet.new([@@one])
		assert @@zero.eqv? number
	end
	
	def test_equivalence_to_zero_right_empty
		number = Surreals::Number.new Surreals::NumberSet.new([@@minusone]), Surreals::NumberSet.new
		assert @@zero.eqv? number
	end
	
	def test_element_in_set
		assert_equal 1, @@one.left.length
		assert_equal "0", @@one.left.first.to_s
		assert @@one.left.include? @@zero
	end
end

