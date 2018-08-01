require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/participant'

class ParticipantTest < Minitest::Test
  def test_if_it_exists
    friend = Participant.new("Charlie", 20)

    assert_instance_of Participant, friend
  end

end
