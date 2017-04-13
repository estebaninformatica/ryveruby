require 'test_helper'

class RyverubyTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Ryveruby::VERSION
  end

  def test_it_does_something_useful
    assert false
  end

  def test_invalid_without_ryver_team_code
    byebug
    assert false
  end

  def test_invalid_without_text
    assert false
  end
end

