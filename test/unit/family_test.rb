require 'test_helper'

class FamilyTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Family.new.valid?
  end
end
