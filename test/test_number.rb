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
end
