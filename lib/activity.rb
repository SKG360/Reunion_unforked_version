require 'pry'

class Activity

  attr_reader :name, :friend, :action, :base_cost, :participant_cost
  def initialize(name, base_cost, participant_cost)
    @name = name
    @base_cost = base_cost
    @participant_cost = participant_cost
    @friend = Hash.new(0)
  end

  def add_participant(name, amount)
    @friend[name] = amount
    name
  end

  def total_cost
    @base_cost + (@participant_cost * @friend.count)

  end

  def fair_share
    (total_cost / @friend.count)
  end

  def friend_owes
    @friend.transform_values do |amount|
      fair_share - amount
    end
    
  end

end
