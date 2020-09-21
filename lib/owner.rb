require "pry"

class Owner
  # code goes here

  attr_reader :name, :species

  @@all = []

  def initialize(name, species = "human")
    @name = name 
    @species = species

    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{species}."
  end


  def cats
    Cat.all.select {|cat| cat.owner == self} 
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self} 
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(cat)
    Dog.new(cat, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.cats + self.dogs
    pets.each do |pet|
      pet.owner = nil
      pet.mood = "nervous" 
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
 

end