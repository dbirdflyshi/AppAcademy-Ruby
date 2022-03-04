################################################################################
#                                                                              #
#                                Enumerables                                   #
#                                                                              #
################################################################################
######################################
#               Lesson               #
######################################
############################
#   Array Manipulation     #
#         Methods          #
############################

# Building the array for the lesson
arr = ['🐶','🐱','🐸','🐷'] # The gang has arrived
puts arr
puts

#Shovel : << : adds an element to the end of an array, evaluates to the array
puts arr << '🐛' # Adding this lil stinky boy to the party
puts

# Push : array_name.push() : adds an element to the end of an array, evaluates to the array. 
# This is better than shovel << because it supports multiple at the same time
puts arr.push('🐼','🐰') # BFFs have made an entrance
puts

# Pop removes the last element from an array, evaluates to the element that was removed
puts arr.pop # Poor bunny got kicked out
puts

# Unshift adds an element to the front of an array, evaluates to the array
puts arr.unshift('🐰') # Bunny makes a triumphant return to the front of the line
puts

# Shift removes the first element of an array, evalulates to the element that was removed
puts arr.shift # Poor bunny just can't catch a break, he's out for cutting in line
puts
puts arr 
puts 

############################
#     Index & Include      #
#          Methods         #
############################
# Building the array for the lesson
wardrobe = ['🎩','👔','👟','👖']
dresser = 'sock'

# Index : array.index(item) : prints the index position of an item in the list you want
puts wardrobe.index('👔') # 1 because it's the first item in the wardrobe

# Include? : array.inclue?(item) : evaluates a boolean indicating if the item is found
puts wardrobe.include?('👘') # False because we don't have a kimono in our wardrobe, yet..
puts wardrobe.include?('🎩') # True because we have a top hat in our wardrobe
puts dresser.include?('ock') # True because the 'ock' exists as a substring in the string dresser 'sock'
puts dresser.index('soc') # 0, shows where in the index the first letter of the substring exists

############################
#      Reverse Method      #
############################
# Building the array for the lesson
forecast = ['🌤','🌦','🌧','⛈'] # This is what the weather will be today, nice and then crappy
puts forecast
puts

# Reverse : array/string.reverse : evaluates to a new reversed version of the array/string
reverse_forecast = forecast.reverse # Now our day begins crappy and ends nice
puts reverse_forecast
puts

# Reverse! : array/string.reverse! : reverses an array/string in place
reverse_forecast.reverse! # We'll bring it back to crappy in the end 
# with the '!' at the end of 'reverse' we dont need to re-declare the variable.
puts forecast
puts 

# Reversing strings
word = 'Supercalifragilisticexpialidocious'
puts word.reverse

# Palindrome checker using reverse
def is_palindrome(word)
    if word == word.reverse
        puts 'Palindrome'
    else
        puts 'Not palindrome'
    end
end

is_palindrome('apple')

################################################################################
#                                                                              #
#                                  Ranges                                      #
#                                                                              #
################################################################################
######################################
#               Lesson               #
######################################
############################
#       Range Slicing      #
#          Methods         #
############################
## Building the array for the lesson
alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
            'p','q','r','s','t','u','v','w','x','y','z']

# .. : array[start..end] : grabs elements including the end
print alphabet[1..10] # ["b", "c", "d", "e", "f", "g", "h", "i", "j", "k"]
puts 

# ... : array[start...end] : grabs elements excluding the end
print alphabet[1...10] # ["b", "c", "d", "e", "f", "g", "h", "i", "j"]
puts

## Using Strings
str = 'alphabet'
print str[1..4] # lpha
puts

# Using negative index positioning
print str[3..-1] # habet
puts 

############################
#        Split & Join      #
#          Methods         #
############################
# Building the string for the lesson
str = 'the lazy red fox jumps over the brown logs quickly'

# Split : string.split(arg) : allows you to separate the string into individual 
#                             elements of an array using a specified delimiter argument
words = str.split(' ') # This allows you to convert a string with multiple words
print words             # into an array of each word as an element
puts # '["the", "lazy", "red", "fox", "jumps", "over", "the", "brown", "logs", "quickly"]'
puts words[2] # 'red' : we're getting the 2nd index of the new words list

letters = str.split('') # Quotes without a space in the argument allows you to 
print letters           # make each element a letter in the string
puts 

# Join : string.join(arg) : allows you to concatenate an array into a single 
#                           element using a specified delimiter argument
puts words.join(' ') # 'the lazy red fox jumps over the brown logs quickly'

# What if we want to find and replace text or characters in a string? These two
# methods allow us to do this with relative ease
def find_and_replace(string,find,replace)
    split = string.split(find)
    rejoined = split.join(replace)
    return rejoined
end
puts find_and_replace('hello darkness my old friend',' ','-')

############################
#         Enumerable       #
#          Methods         #
############################
# Building the array for the lesson
months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec']

# Use this if you only have one line worth of code
months.each { |month| puts month }

# Use this if you have multiple lines worth of code to run
months.each do |month|
    puts month 
    puts '---'
end 

# If we want to use the index, we use 'each_with_index'
months.each_with_index do |month, idx|
    puts month 
    puts idx
    puts '---'
end 

# We can do the same with strings but we use 'each_char'
sentence = 'it is too hot here'
sentence.each_char do |char|
    puts char
end 

# If we want to use the index, we do the same but we use 'each_char.with_index'
sentence = 'it is too hot here'
sentence.each_char.with_index do |char, idx|
    puts char
    puts idx
    puts '---'
end 

############################
#     Range Enumerable     #
#          Methods         #
############################
## Building the array for the lesson
alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
            'p','q','r','s','t','u','v','w','x','y','z']

# We can use the keyword 'each' to loop through a range
arr.each { |ele| puts ele }

# But what if we want to specify the range in the loop? We use (min..max)/(min...max)
(1..10).each{ |num| puts num }

# Let's revisit the FizzBuzz challenge from the last set of arrays exercises
# Recap : write a method that takes in a number max and returns an array containing
# all numbers less than max that are divisible by 3 or by but not both.
def fizzBuzz(max)
    arr = []
    (1...max).each do |num|
        if (num % 3 == 0 || num % 5 == 0) && !(num % 3 == 0 && num % 5 == 0)
            arr << num
        end
    end
    return arr 
end
puts fizzBuzz(20)

# Making the range enumerable easier to write
# num.times {<code>}
#     -or-
# num.times do 
#   <code>
# end 

# Single line
4.times {puts 'hello'}

# Multiple lines
4.times do 
    puts 'hi'
end 

######################################
#             Exercises              #
######################################
############################
#        to Initials       #
############################
# Write a method that takes in a persons name string and returns a string
# representing their initials

def to_initials(name)
  # Constructing the array
  initials = []
  # We first want to split out the names
  name_parts = name.split(' ')
  # Once we get the first and last names separated, we want to iterate each element in the new array
  name_parts.each_with_index do |name_parts, idx|
    # with each element iterating, we want only the first letter of each element and store it into the array
  	initials << name_parts[0][0]
  end
  # Now that we have this array that looks like this ['K','B']
  # we need to make this into a full text string again, we use join for that
  initials = initials.join('')
  # Returning the final output so its now a global variable
  return initials
end

puts to_initials("Kelvin Bridges")      # => "KB"
puts to_initials("Michaela Yamamoto")   # => "MY"
puts to_initials("Mary La Grange")      # => "MLG"

# This is the instructor's version and it's much more elegant
def to_initials(name)
  parts = name.split(" ")
  initials = ""
  parts.each { |part| initials += part[0] }
  return initials
end

############################
#      First In Array      #
############################
# Write a method first_in_array that takes in an array and two elements, 
# the method should return the element that appears earlier in the array.
def first_in_array(arr, el1, el2)
  if arr.index(el1) < arr.index(el2)
    puts el1
  else
  	puts el2
  end
end

puts first_in_array(["a", "b", "c", "d"], "d", "b"); # => "b"
puts first_in_array(["cat", "bird" ,"dog", "mouse" ], "dog", "mouse"); # => "dog"

############################
#   Abbreviate Sentence    #
############################
# Write a method abbreviate_sentence that takes in a sentence string and 
# returns a new sentence where every word longer than 4 characters has all
# of it's vowels removed.
def abbreviate_sentence(sent)
	parts = sent.split(" ")
  	parts.each_with_index do |part, idx|
      	if part.length > 4
            split = part.split(/[aeiou]/)
    		rejoined = split.join('')
          	parts[idx] = rejoined          	
        end
    end
    return parts.join(' ')
end

puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"


############################
#        Format Name       #
############################
# Write a method format_name that takes in a name string and returns the 
# name properly capitalized.
def format_name(str)
    parts = str.split(' ')
    parts.each_with_index do |part,idx|
        part = part.downcase
        letters = part.split('')
        letters[0] = letters[0].upcase
        part = letters.join('')
        parts[idx] = part
	end
  	return parts.join(' ') 
end

puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"

# The solution provided is a big more elegant 
def format_name(str)
  parts = str.split(" ")
  new_parts = []

  parts.each do |part|
    new_parts << part[0].upcase + part[1..-1].downcase
  end

  return new_parts.join(" ")
end

############################
#        Valid Name        #
############################
# Write a method is_valid_name that takes in a string and returns a boolean 
# indicating whether or not it is a valid name.
# A name is valid is if satisfies all of the following:
# - contains at least a first name and last name, separated by spaces
# - each part of the name should be capitalized
#
# Hint: use str.upcase or str.downcase
# "a".upcase # => "A"
def is_valid_name(str)
	parts = str.split(" ")
  	new_parts = []
  	parts.each do |part|
    	new_parts << part[0].upcase + part[1..-1].downcase
  	end
  	valid_name = new_parts.join(" ")
  	if str == valid_name && str.split(' ').length >=2
       true
    else
      false
    end
end

puts is_valid_name("Kush Patel")       # => true
puts is_valid_name("Daniel")           # => false
puts is_valid_name("Robert Downey Jr") # => true
puts is_valid_name("ROBERT DOWNEY JR") # => false

############################
#        Valid Email       #
############################
# Write a method is_valid_email that takes in a string and returns a boolean 
# indicating whether or not it is a valid email address.

# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

def is_valid_email(str) 
  if str.scan(/[@]/).count !=1 || 
     str.scan(/[.]/).count !=1 ||
     str.split('@')[0].scan(/[1234567890]/).count >=1
	  crit1 = false
  else
      crit1 = true
  end
end

 puts is_valid_email("abc@xy.z")         # => true
 puts is_valid_email("jdoe@gmail.com")   # => true
 puts is_valid_email("jdoe@g@mail.com")  # => false
 puts is_valid_email("jdoe42@gmail.com") # => false
 puts is_valid_email("jdoegmail.com")    # => false
 puts is_valid_email("az@email")         # => false

############################
#        Valid Email       #
############################
# Write a method reverse_words that takes in a sentence string and returns the 
# sentence with the order of the characters in each word reversed. Note that we 
# need to reverse the order of characters in the words, do not reverse the order 
# of words in the sentence.
 def reverse_words(sent)
  	parts = sent.split(" ")
  	new_parts = []
  	parts.each do |part|
    	new_parts << part.reverse
    end
    return new_parts.join(' ')
end

puts reverse_words('keep coding') # => 'peek gnidoc'
puts reverse_words('simplicity is prerequisite for reliability') # => 'yticilpmis si etisiuqererp rof ytilibailer'

############################
#        Valid Email       #
############################
# Write a method rotate_array that takes in an array and a number. The method 
# should return the array after rotating the elements the specified number of 
# times. A single rotation takes the last element of the array and moves it to 
# the front.
def rotate_array(arr, num)
  	num.times {arr.unshift(arr.pop)}
  	return arr 
end

print rotate_array([ "Matt", "Danny", "Mashu", "Matthias" ], 1) # => [ "Matthias", "Matt", "Danny", "Mashu" ]
puts

print rotate_array([ "a", "b", "c", "d" ], 2) # => [ "c", "d", "a", "b" ]
puts