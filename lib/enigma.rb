class Enigma
  attr_reader :num, :date_as_integer, :off_set, :all_characters
# This is the initialize method
  def (message, rotations, date_offsets, default_characters)
    @map = default_characters
    @message = message
    @offsets = [rotations, date_offsets].transpose.map { |x| x.inject 0, :+ }
  end

# This method generates 5 unique digit key
  def self.random_key_generator
    @num = [0,1,2,3,4,5,6,7,8,9].sample(5).to_a.join
  end

# This method is the current date
  def self.current_date
    date = Time.now.strftime("%m%d%y")
   @date_as_integer = date.to_i
  end

# This method gets the last four digits off the squared date
  def self.off_set(current_date)
    square_date = (current_date.to_i ** 2)
    @off_set = square_date.to_s.chars.last(4).map(&:to_i)
  end

# This method makes the character map
  def self.default_character_map
    @all_characters = (' '..'z').to_a
  end

# This method slices up the incoming message
  def self.split_by_fours(message)
    message.chars.each_slice(4).to_a
  end

# This method rotates
  def self.rotation_of_key(key)
    key.chars.each_cons(2).map(&:join).map(&:to_i)
  end

# This method breaks up message in to fours
  def self.into_fours(message) 
    message.chars.each_slice(4).to_a
  end

