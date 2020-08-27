require_relative './cat.rb'
require 'pry'

class Owner

  attr_reader :name, :species

  @@all_the_owners = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all_the_owners.push(self)
  end

  def say_species
    return "I am a #{self.species}."
  end

  def self.all
    return @@all_the_owners
  end

  def self.count
    return @@all_the_owners.length
  end

  def self.reset_all
    @@all_the_owners = []
  end

  def cats
    Cat.all.select do |kat|
      kat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |kat|
      kat.mood = "happy"
    end
  end

  def sell_pets
    all_pets = self.dogs + self.cats
    all_pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end