require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/participant'

class ActivityTest < Minitest::Test
  def test_if_it_exists
    activity_1 = Activity.new("Surfing", 100, 50)

    assert_instance_of Activity, activity_1
  end

  def test_if_activity_has_name
    activity_1 = Activity.new("Surfing", 100, 50)

    assert_equal "Surfing", activity_1.name
  end

  def test_if_friend_hash_starts_empty
    activity_1 = Activity.new("Surfing", 100, 50)

    assert_equal ({}), activity_1.friend
  end

  def test_if_add_participants
    activity_1 = Activity.new("Surfing", 100, 50)

    friend = Participant.new("Charlie", 20)

    assert_equal "Charlie", activity_1.add_participant("Charlie", 20)
    assert_equal ({"Charlie" => 20}), activity_1.friend
    assert_equal "Bobby", activity_1.add_participant("Bobby", 40)
  end

  def test_the_base_cost
    activity_1 = Activity.new("Surfing", 100, 50)
    activity_2 = Activity.new("Biking", 220, 50)

    assert_equal 100, activity_1.base_cost
  end

  def test_if_participant_cost_exists
    activity_1 = Activity.new("Surfing", 100, 50)
    activity_2 = Activity.new("Biking", 220, 50)

    assert_equal 50, activity_1.participant_cost
  end

  def test_total_cost_of_activity

    activity_1 = Activity.new("Surfing", 100, 50)
    activity_2 = Activity.new("Biking", 220, 50)

    friend = Participant.new("Charlie", 20)

    activity_1.add_participant("Charlie", 20)
    activity_2.add_participant("Bobby", 40)
    activity_1.add_participant("Kate", 60)


    assert_equal 200, activity_1.total_cost
  end

  def test_the_fair_share_of_participant

    activity_1 = Activity.new("Surfing", 100, 50)
    activity_2 = Activity.new("Biking", 220, 50)

    friend = Participant.new("Charlie", 20)

    activity_1.add_participant("Charlie", 20)
    activity_2.add_participant("Bobby", 40)
    activity_1.add_participant("Kate", 60)


    assert_equal 100, activity_1.fair_share
  end

  def test_the_amount_each_friend_owes

    activity_1 = Activity.new("Surfing", 100, 50)

    activity_1.add_participant("Charlie", 20)
    activity_1.add_participant("Bobby", 40)
    activity_1.add_participant("Kate", 60)
    activity_1.add_participant("Jenna", 180)

    expected = {"Charlie" => 55, "Bobby" => 35, "Kate" => 15, "Jenna" => -105}
    assert_equal expected, activity_1.friend_owes
  end

end
