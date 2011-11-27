require 'surreals'
require 'test/unit'

class TestNumberSet < Test::Unit::TestCase
	def test_empty_to_s
		empty = Surreals::NumberSet.new
		assert_equal "{}", empty.to_s
	end

	def test_zero_set_to_s
		set = Surreals::NumberSet.new [Surreals::Number.new]
		assert_equal "{0}", set.to_s
	end
	
	def test_empty_set_equals_empty_set
		assert Surreals::NumberSet.new.equal? Surreals::NumberSet.new
	end
	
	def test_zero_set_includes_zero
		set = Surreals::NumberSet.new [Surreals::Number.new]
		assert set.include? set.first
		zero = Surreals::Number.new
		assert set.first.equalSets? zero
		assert set.include? zero
	end

	def test_one_set_to_s
		set = Surreals::NumberSet.new [Surreals::Number.new.next]
		assert_equal "{1}", set.to_s
	end

	def test_zero_one_set_to_s
		set = Surreals::NumberSet.new [Surreals::Number.new, Surreals::Number.new.next]
		assert_equal "{0 1}", set.to_s
	end

	def test_less_and_greatest_number
		set = Surreals::NumberSet.new [Surreals::Number.new, Surreals::Number.new.next]
		assert_equal "0", set.lessNumber.to_s
		assert_equal "1", set.greatestNumber.to_s
	end

	def test_less_and_greatest_number_empty_set
		set = Surreals::NumberSet.new
		assert_nil set.lessNumber
		assert_nil set.greatestNumber
	end
end

