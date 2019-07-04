# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
    
  rescue StandardError
    puts "the argument is invalid"
    nil 
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)

  # FRUITS.include?(maybe_fruit)
  begin
    if !FRUITS.include?(maybe_fruit)
      raise StandardError
    else
      puts "OMG, thanks so much for the #{maybe_fruit}!"
    end

  rescue
    feed_me_a_fruit
    puts "I don't like that food"
    retry
  end
  
end

def feed_me_a_fruit

  puts "Hello, I am a friendly monster. :)"
  puts "Feed me a fruit! (Enter the name of a fruit:)"
  
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    raise "You have to tell us what your friends name is!!"if @name.empty?
    @yrs_known = yrs_known
    raise "You are too young to be my friend!" if @yrs_known <= 5

    @fav_pastime = fav_pastime
    raise "I know you have hobbies!!! Tell us about them." if @fav_pastime.empty?
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


