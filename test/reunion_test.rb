require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_if_it_exists
    rt = Reunion.new("Cleveland")

    assert_instance_of Reunion, rt
  end

  def test_if_it_adds_activity
    rt = Reunion.new("Cleveland")
    assert_equal "Surfing", rt.add_activity("Surfing", 100, 50)
  end

end
