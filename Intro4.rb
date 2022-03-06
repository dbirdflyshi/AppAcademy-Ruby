################################################################################
#                                                                              #
#                                Nested Loops                                  #
#                                                                              #
################################################################################
######################################
#               Lesson               #
######################################
# 1: Simple nested loop
(1..3).each do |num1|
    (1..5).each do |num2|
        puts num1.to_s+" " +num2.to_s
    end
end

# 2: More practical example
# Building the array to loop through
arr = ['a','b','c','d']
# We will loop through the same array twice
arr.each_with_index do |ele1, idx1|
    arr.each_with_index do |ele2, idx2|
        if idx2 > idx1 # Making 1<2 they never refer to each other did in the past
            puts ele1 + ele2
            puts idx1.to_s + ' ' + idx2.to_s
            puts '------'
        end
    end
end


# 3: 2 Dimensional arrays
arr = [
    ['a','b','c'],
    ['d','e'],
    ['f','g','h']
]

print arr[0][1]
puts

arr.each do |subArr|
    print subArr
    puts
    subArr.each do |ele|
        puts ele
    end
end


######################################
#             Exercises              #
######################################
############################
#       Combinations       #
############################
# Write a method combinations that takes in an array of unique elements, the
# method should return a 2D array representing all possible combinations of 2 
# elements of the array.
def combinations(arr)
	# We will loop through the same array twice
  	newarr = []
	arr.each_with_index do |ele1, idx1|
      arr.each_with_index do |ele2, idx2|
          if idx2 > idx1 # Making 1<2 they never refer to each other did in the past
              newarr << [ele1,ele2]
          end
      end
  end
  return newarr
end

print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
puts
print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
puts

############################
#      Opposite Count      #
############################
# Write a method opposite_count that takes in an array of unique numbers. 
# The method should return the number of pairs of elements that sum to 0.
def opposite_count(nums)
  	counter = 0
	nums.each_with_index do |ele1, idx1|
      nums.each_with_index do |ele2, idx2|
          if idx2 > idx1 && ele1 + ele2 == 0
              counter += 1
          end
      end
  end
  return counter
end

puts opposite_count([ 2, 5, 11, -5, -2, 7 ]) # => 2
puts opposite_count([ 21, -23, 24 -12, 23 ]) # => 1

############################
#   Two Dimensional Sum    #
############################
# Write a method two_d_Sum that takes in a two dimensional array and returns 
# the sum of all elements in the array.

def two_d_sum(arr)
  sum = 0
  arr.each do |subArr|
      subArr.each do |ele|
          sum += ele
      end
  end
  return sum
end

array_1 = [
  [4, 5],
  [1, 3, 7, 1]
]
puts two_d_sum(array_1)    # => 21

array_2 = [
  [3, 3],
  [2],
  [2, 5]
]
puts two_d_sum(array_2)    # => 15

############################
#      Two Dimensional     #
#         Translate        #
############################
# Write a method two_d_translate that takes in a 2 dimensional array and 
# translates it into a 1 dimensional array. You can assume that the inner 
# arrays always have 2 elements. See the examples.
def two_d_translate(arr)
    repeated = []
    arr.each do |subArr|
        subArr[1].times {repeated << subArr[0]}
    end
    return repeated
end

arr_1 = [
  ['boot', 3],
  ['camp', 2],
  ['program', 0]
]
print two_d_translate(arr_1) # => [ 'boot', 'boot', 'boot', 'camp', 'camp' ]
puts

arr_2 = [
  ['red', 1],
  ['blue', 4]
]
print two_d_translate(arr_2) # => [ 'red', 'blue', 'blue', 'blue', 'blue' ]
puts

############################
#      Array Translate     #
############################
# Write a method array_translate that takes in an array whose elements alternate 
# between words and numbers. The method should return a string where each word 
# is repeated the number of times that immediately follows in the array.
def array_translate(array)
  str = ""

  i = 0
  while i < array.length
    ele = array[i]
    num = array[i + 1]
    num.times { str += ele }

    i += 2
  end

  return str
end

print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
puts

print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
puts

############################
#      Pig Latin Word      #
############################
# Write a method pig_latin_word that takes in a word string and translates 
# the word into pig latin.
# Pig latin translation uses the following rules:
# - for words that start with a vowel, add 'yay' to the end
# - for words that start with a nonvowel, move all letters before the first vowel to the end of the word and add 'ay'
def pig_latin_word(word)
	letters = word.split('')
  	if letters[0] =~/[aeiou]/
  		pig = letters.join+'yay'
    else
        pig = letters.push(letters.shift).join+'yay'
    end
  	i = 0
end

puts pig_latin_word("apple")   # => "appleyay"
puts pig_latin_word("eat")     # => "eatyay"
puts pig_latin_word("banana")  # => "ananabay"
puts pig_latin_word("trash")   # => "ashtray"

################################################################################
#                                                                              #
#                                   Hashes                                     #
#                                                                              #
################################################################################
######################################
#               Lessons              #
######################################
# Key => value pair

my_hash = {
    'school' => ['App Academy','Turing'], 
    'color' => ['red'], 
    'age' => 29,
    'isAwesome' => true,
    42 => 'hello'
}
# Printing a value
puts my_hash['school'][1]

# Changing the value
my_hash['color'] = ['blue']
puts my_hash['color']

# Adding a key-value pair to a hash
my_hash['student'] = 'Dane'
puts my_hash

# Adding a value to a key
my_hash['color'] << 'green'
puts my_hash

# Searching inside hashes
puts my_hash.has_key?('color')
puts my_hash.has_value?('green')

# Showing only one side 
puts my_hash.keys
puts my_hash.values

# Let's make a new hash 
animal = {
    'Name' => 'Giraffe',
    'Height' => 10.5,
    'Diet' => ['Plants','Bugs'],
    'Location' => 'Africa',
    'isEndangered' => false,
    'colors' => ['Brown','Yellow','Tan']
}
# Looping only the key 
animal.each_key do |k|
    puts k
end
# Looping only the value
animal.each_value do |v|
    puts v
end
# Looping everything
animal.each do |k,v|
    puts k 
    puts v 
    puts "------------"
end

# default value of a value is nil 
puts animal['domesticated'] == nil #true 

# What is Nil?
# Nil represents 'nothing' or 'empty'.
# It commonly appears as a default value


# Setting a default value 
empty_hash = Hash.new('Empty')
puts empty_hash['a']

## Take a string and make a hash that counts all unique letters
str = 'hello darkness my old friend'
counter = Hash.new(0)
str.each_char { |char| counter[char]+=1}
puts counter 

# Deconstructing it to see what it is doing
str.each_char do |char|
    puts char
    counter[char] +=1
    puts counter 
end

# Sorting this counter by key
print counter.sort_by {|k,v| k}
# sorting this counter by value
sorted = counter.sort_by {|k,v| v}

# Printing the key that came up most often
puts sorted[-1][0]


######################################
#             Exercises              #
######################################
############################
#        Double Age        #
############################
# Write a method get_double_age that takes in a hash and returns twice 
# the "age" value of the hash.

def get_double_age(hash)
	return hash['age'] * 2
end

puts get_double_age({"name"=>"App Academy", "age"=>5}) # => 10
puts get_double_age({"name"=>"Ruby", "age"=>23})       # => 46

############################
#       Get Full Name      #
############################
# Write a method get_full_name that takes in a hash containing a first, 
# last, and title. The method should return a string representing the hash's full name
def get_full_name(hash)
  
   puts hash['first']+' '+hash['last']+', the '+hash['title']
  
end

hash1 = {"first"=>"Michael", "last"=>"Jordan", "title"=> "GOAT"}
puts get_full_name(hash1) # => "Michael Jordan, the GOAT"

hash2 = {"first"=>"Fido", "last"=>"McDog", "title"=> "Loyal"}
puts get_full_name(hash2) # => "Fido McDog, the Loyal"

############################
#       Word lengths       #
############################
# Write a method word_lengths that takes in a sentence string and returns a hash
# where every key is a word of the sentence, and its' corresponding value is the 
# length of that word.
def word_lengths(sentence)
  words = sentence.split(" ")
  lengths = {}

  words.each { |word| lengths[word] = word.length}

  return lengths
end

puts word_lengths("this is fun") #=> {"this"=>4, "is"=>2, "fun"=>3}
puts word_lengths("When in doubt, leave it out") #=> {"When"=>4, "in"=>2, "doubt,"=>6, "leave"=>5, "it"=>2, "out"=>3}

############################
#     Retrieve Values      #
############################
# Write a method retrieve_values that takes in two hashes and a key. The method 
# should return an array containing the values from the two hashes that 
# correspond with the given key.
def retrieve_values(hash1, hash2, key)
	new_list = []
  	new_list << hash1[key]
  	new_list <<hash2[key]
    return new_list
end

dog1 = {"name"=>"Fido", "color"=>"brown"}
dog2 = {"name"=>"Spot", "color"=> "white"}
print retrieve_values(dog1, dog2, "name") #=> ["Fido", "Spot"]
puts
print retrieve_values(dog1, dog2, "color") #=> ["brown", "white"]
puts

############################
#     Retrieve Values      #
############################
# Write a method cat_builder that takes in a name, color, and age. The method 
# should return a hash representing a cat with those values.
def cat_builder(name_str, color_str, age_num)

  cat = {}
  cat['name'] = name_str
  cat['color'] = color_str
  cat['age'] = age_num
  return cat
  
end

print cat_builder("Whiskers", "orange", 3) #=> {"name"=>"Whiskers", "color"=>"orange", "age"=>3}
puts

print cat_builder("Salem", "black", 100) #=> {"name"=>"Salem", "color"=>"black", "age"=>100}
puts

############################
#         AE Count         #
############################
# Write a method ae_count that takes in a string and returns a hash containing 
# the number of a's and e's in the string. Assume the string contains only 
# lowercase characters.

def ae_count(str)
  letters = str.split("")
  lengths = Hash.new(0)
  letters.each do |letter| 
    if letter == 'a'|| letter == 'e'
    	lengths[letter] = lengths[letter]+1
    end
  end
  return lengths
end

puts ae_count("everyone can program") #=> {"a"=>2, "e"=>3}
puts ae_count("keyboard") #=> {"a"=>1, "e"=>1}

############################
#      Element Count       #
############################
# Write a method element_count that takes in an array and returns a hash 
# representing the count of each element in the array.
def element_count(arr)
      
  count = Hash.new(0)
  arr.each { |ele| count[ele] += 1 }
  return count
  
end

puts element_count(["a", "b", "a", "a", "b"]) #=> {"a"=>3, "b"=>2}
puts element_count(["red", "red", "blue", "green"]) #=> {"red"=>2, "blue"=>1, "green"=>1}

############################
#    Select Upcase Keys    #
############################
# Write a method select_upcase_keys that takes in a hash and returns a new hash 
# containing key-value pairs of the original hash that had uppercase keys. 
# You can assume that the keys will always be strings.
def select_upcase_keys(hash)
  selected = {}

  hash.each do |k, v|
    if k == k.upcase
      selected[k] = v
    end
  end

  return selected
end

print select_upcase_keys({"make"=> "Tesla", "MODEL"=> "S", "Year"=> 2018, "SEATS"=> 4})
# => {"MODEL"=>"S", "SEATS"=>4}
puts

print select_upcase_keys({"DATE"=>"July 4th","holiday"=> "Independence Day", "type"=>"Federal"}) # => {"DATE"=>"July 4th"}
puts

############################
#        Hand Score        #
############################
# Write a method hand_score that takes in a string representing a hand of cards 
# and returns it's total score. You can assume the letters in the string are 
# only A, K, Q, J. A is worth 4 points, K is 3 points, Q is 2 points, and J is 
# 1 point. The letters of the input string not necessarily uppercase.
def hand_score(hand)
  points = {
    "A"=>4,
    "K"=>3,
    "Q"=>2,
    "J"=>1
  }

  score = 0
  hand.each_char { |char| score += points[char.upcase] }
  return score
end

puts hand_score("AQAJ") #=> 11
puts hand_score("jJka") #=> 9

############################
#     Frequent Letters     #
############################
# Write a method frequent_letters that takes in a string and returns an array 
# containing the characters that appeared more than twice in the string.
def frequent_letters(string)
  count = Hash.new(0)
  string.each_char { |char| count[char] += 1 }

  frequents = []
  count.each do |char, num|
    if num > 2
      frequents << char
    end
  end
  return frequents
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts

############################
#       Has To Pairs       #
############################
# Write a method hash_to_pairs that takes in a hash and returns a 2D array 
# representing each key-value pair of the hash.
def hash_to_pairs(hash)
  pairs = []
  hash.each { |key, val| pairs << [key, val] }
  return pairs
end

print hash_to_pairs({"name"=>"skateboard", "wheels"=>4, "weight"=>"7.5 lbs"}) #=> [["name", "skateboard"], ["wheels", 4], ["weight", "7.5 lbs"]]
puts

print hash_to_pairs({"kingdom"=>"animalia", "genus"=>"canis", "breed"=>"German Shepherd"}) #=> [["kingdom", "animalia"], ["genus", "canis"], ["breed", "German Shepherd"]]
puts

############################
#     Unique Elements      #
############################
# Write a method unique_elements that takes in an array and returns a new array 
# where all duplicate elements are removed. Solve this using a hash.
def unique_elements(arr)
  hash_elements = {}
  arr.each { |ele| hash_elements[ele] = true }
  return hash_elements.keys
end

print unique_elements(['a', 'b', 'a', 'a', 'b', 'c']) #=> ["a", "b", "c"]
puts

############################
#     Element Replace      #
############################
# Write a method element_replace that takes in an array and a hash. The method 
# should return a new array where elements of the original array are replaced
# with their corresponding values in the hash.
def element_replace(arr, hash)
  new_arr = []

  arr.each do |ele|
    if hash.has_key?(ele)
      new_arr << hash[ele]
    else
      new_arr << ele
    end
  end

  return new_arr
end

arr1 = ["LeBron James", "Lionel Messi", "Serena Williams"]
hash1 = {"Serena Williams"=>"tennis", "LeBron James"=>"basketball"}
print element_replace(arr1, hash1) # => ["basketball", "Lionel Messi", "tennis"]
puts

arr2 = ["dog", "cat", "mouse"]
hash2 = {"dog"=>"bork", "cat"=>"meow", "duck"=>"quack"}
print element_replace(arr2, hash2) # => ["bork", "meow", "mouse"]
puts