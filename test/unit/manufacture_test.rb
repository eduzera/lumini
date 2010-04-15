require 'test_helper'

class ManufactureTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Manufacture.new.valid?
  end
end
