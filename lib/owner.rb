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

end