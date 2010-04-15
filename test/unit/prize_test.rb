require 'test_helper'

class PrizeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Prize.new.valid?
  end
end
