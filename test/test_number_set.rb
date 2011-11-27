require 'surreals'
require 'test/unit'

class TestNumberSet < Test::Unit::TestCase
	def test_empty_to_s
		empty = Surreals::NumberSet.new
		assert_equal "{}", empty.to_s
	end
end
