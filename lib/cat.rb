require 'pry'

class Cat

  attr_accessor :owner, :mood
  attr_reader :name

  @@all_cats = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all_cats.push(self)
  end

  def self.all
    return @@all_cats
  end


end

# my_cat = Cat.new("monks", "hyrum")
# puts my_cat.owner