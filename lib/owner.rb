require 'pry'
class Owner
  attr_reader :name, :species
  
  
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.select do |dog|
      if dog.owner == self
        dog.mood = "happy"
      end
    end
  end

  def feed_cats
    Cat.all.select do |cat|
      if cat.owner == self
        cat.mood = "happy"
      end
    end
  end
  
  def sell_pets
    Dog.all.select do |dog|
      if dog.owner == self
        dog.mood = "nervous"
        dog.owner = nil
      end
    end
    Cat.all.select do |cat|
      if cat.owner == self
        cat.mood = "nervous"
        cat.owner = nil
      end
    end
  end

  def list_pets
    # dogs = 0
    # cats = 0
    # Dog.all.each do |dog|
    #   if dog.owner == self
    #     dogs += 1
    #   end
    # end
    # Cat.all.each do |cat|
    #   if cat.owner == self
    #     cats += 1
    #   end
    # end
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end

# jake = Owner.new("Jake")
# b = Owner.new("B")
# binding.pry
0