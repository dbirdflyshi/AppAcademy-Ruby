################################################################################
#                                                                              #
#                           Nested Loops & Hashes                              #
#                                                                              #
################################################################################
######################################
#               Lessons              #
######################################
############################
#      Nested Loops        #
#         Methods          #
############################
# Lesson 1, simple nested loop
(1..3).each do |num1|
    (1..5).each do |num2|
        puts num1.to_s+" " +num2.to_s
    end
end

# Lesson 2, more practical example
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

############################
#      2 Dimensional       #
#          Arrays          #
############################
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

######################################
#               Lessons              #
######################################
############################
#          Hashes          #
############################
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

