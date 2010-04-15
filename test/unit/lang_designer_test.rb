require 'test_helper'

class LangDesignerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert LangDesigner.new.valid?
  end
end
