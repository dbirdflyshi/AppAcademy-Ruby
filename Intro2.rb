################################################################################
#                                                                              #
#                                Conditionals                                  #
#                                                                              #
################################################################################
######################################
#               Lesson               #
######################################
# Basic
num = 5
if num > 0
    puts "positive"
end

## If you want to do something if the condition is false, you need 'else'
if num > 0
    puts "positive"
else
    puts "negative"
end

## If you need to nest if statements, use elsif 
num = 0
if num > 0
    puts "positive"
elsif num < 0
    puts "negative"
else   
    puts 'zero'
end

################################################################################
#                                                                              #
#                                   Loops                                      #
#                                                                              #
################################################################################
######################################
#               Lesson               #
######################################
## While Loop
# Repeating text 
def repeatHello(num)
    counter = 1
    while counter <= num
        puts 'Hello'
        counter += 1
    end
end
repeatHello(5)

# Decrementing and defining your limits
def printNums(min,max)
    i = max
    while i >= min
        puts i 
        i -= 1
    end
end
printNums(5,10)

# Decrementing into an infinite loop
def printNums(num)
    i = 1
    while i <= num # while 1 is less than or equal to 5 
        puts i 
        i -= 1 # but decreases from 1....-infinity it will run forever
    end # brecause 1 will always be less than or equal to 5
end
printNums(5)

# Iterating through characters of a string
def printChars(string)
    i = 0
    while i < string.length
        puts string[i] # for each line it will display a letter in the string
        i +=1
    end
end

printChars('This is super cool')

## Using Break and next
# Iterating through characters of a string
# cutting out all vowels
def printChars(string)
    i = 0 # initiate the counter
    while i < string.length # running until each letter has been processed
        if string[i] == 'x' # we dont like the letter x, we're gonna kill the code
            break           # when we see the letter x
        end
        if (string[i] == 'a' || string[i] == 'e' || string[i] == 'i'|| 
            string[i] == 'o'|| string[i] == 'u') # is it a vowel?
            i +=1 # let's increment the counter first
            next # skipping these vowels
        else   
            print string[i] # for each iteration of the loop, it will print the letter
        end
        i +=1 # iterating because this iteration of the loop finished, lets move on
    end
end
printChars('This is super cool') # output : Ths s spr cl

######################################
#             Exercises              #
######################################
# Counting the amount of letters in a string
def count_e(letter,word)

  word = 'movie'
  is = 0
  i = 0
  while i < word.length
  
    if word[i] == letter
      is +=1
    end
  i += 1
  end
  puts is 
  
end

puts count_e('e',"movie") # => 1

# Reversing a word
def reverse(word)
    i = word.length
    while i > 0
        i -=1
  		print word[i] # for each line it will display a letter in the string
    end
end
puts reverse('cat')

# Is it a palindrome?
def is_palindrome(word)
    i = word.length
  	string = ''
    while i > 0
        i -=1
  		string += word[i]
    end
  	return string == word
end
puts is_palindrome("racecar")  # => true
puts is_palindrome("kayak")    # => true
puts is_palindrome("bootcamp") # => false

################################################################################
#                                                                              #
#                                   Arrays                                     #
#                                                                              #
################################################################################
######################################
#               Lesson               #
######################################
letters = ['a','b','c']

puts letters[0]

# Shovel Operator
letters = ['a','b','c']
letters << 'd' # this allows you to take an element and put it at the end 
print names
letters[1] = '1' # you can replace what exists at the index position

# printing an array using a function
def print_array(arr)
    i = 0
    while i < arr.length
        puts arr[i]
        i+=1
    end
end

print_array(['1','2','3'])

######################################
#             Exercises              #
######################################
# Doubling arrays 
def doubler(numbers)
  new_nums = []
  i = 0
    while i < numbers.length
	  old_num = numbers[i]
      new_num = old_num*2
      new_nums << new_num
      i+=1
    end
  return new_nums
end

print doubler([1, 2, 3, 4]) # => [2, 4, 6, 8]
print doubler([7, 1, 8])    # => [14, 2, 16]

# Yeller
def yell(words)
  new_words = []
  i = 0
    while i < words.length
	  old_word = words[i]
      new_word = old_word + '!'
      new_words << new_word
      i+=1
    end
  return new_words
end

print yell(["hello", "world"]) # => ["hello!", "world!"]
puts
print yell(["code", "is", "cool"]) # => ["code!", "is!", "cool!"]

# Element * index
def element_times_index(numbers)
  new_nums = []
  i = 0
    while i < numbers.length
	  old_num = numbers[i]
      new_num = old_num*i
      new_nums << new_num
      i+=1
    end
  return new_nums
end

print element_times_index([4, 7, 6, 5])       # => [0, 7, 12, 15]
puts
print element_times_index([1, 1, 1, 1, 1, 1]) # => [0, 1, 2, 3, 4, 5]

# Printing Even Nums
def even_nums(max)
	i = 0
  	new_nums = []
  	while i <= max
      if i % 2 == 0
        new_nums << i
      end
      i+=1
    end
    return new_nums
end

print even_nums(10) # => [0, 2, 4, 6, 8, 10]
puts
print even_nums(5)  # => [0, 2, 4]

# Print ranges
def range(min, max)
	i = min
  	new_nums = []
  	while i <= max
      new_nums << i
      i+=1
    end
    return new_nums
end

print range(2, 7)   # => [2, 3, 4, 5, 6, 7]
puts
print range(13, 20) # => [13, 14, 15, 16, 17, 18, 19, 20]

# Printing odd number range
def odd_range(min, max)
	i = min
  	new_nums = []
  	while i <= max
      if i % 2 != 0
        new_nums << i
      end
      i+=1
    end
    return new_nums
end

print odd_range(11, 18) # => [11, 13, 15, 17]
puts
print odd_range(3, 7)   # => [3, 5, 7]

# Print reverse range
def reverse_range(min, max)
  i = max-1
  new_nums = []
  while i >= min
    new_nums << i
    i-=1
  end
  return new_nums
end

print reverse_range(10, 17) # => [16, 15, 14, 13, 12, 11]
puts
print reverse_range(1, 7)   # => [6, 5, 4, 3, 2]

# Printing the first half of an array
def first_half(array)
  	i = 0
  	new_arr = []
  	while i < array.length/2.0
      new_arr << array[i]
      i+=1
    end
    return new_arr
end

print first_half(["Brian", "Abby", "David", "Ommi"]) # => ["Brian", "Abby"]
puts
print first_half(["a", "b", "c", "d", "e"])  # => ["a", "b", "c"]

# Factors of 
def factors_of(num)
  new_nums = []

  i = 1
  while i <= num
    if num % i == 0
      new_nums << i
    end
    
    i += 1
  end
  return new_nums
end

print factors_of(3)   # => [1, 3]
puts
print factors_of(4)   # => [1, 2, 4]
puts
print factors_of(8)   # => [1, 2, 4, 8]
puts
print factors_of(9)   # => [1, 3, 9]
puts
print factors_of(16)  # => [1, 2, 4, 8, 16]

# Selecting the odd numbers
def select_odds(numbers)
  new_nums = []

  i = 0
  while i < numbers.length
    if numbers[i] % 2 != 0
      new_nums << numbers[i]
    end
    i+=1
  end
  return new_nums
end

print select_odds([13, 4, 3, 7, 6, 11]) # => [13, 3, 7, 11]
puts
print select_odds([2, 4, 6])            # => []

# Selecting long words
def select_long_words(words)
  new_words = []

  i = 0
  while i < words.length
    if words[i].length > 4
      new_words << words[i]
    end
    i+=1
  end
  return new_words
end

print select_long_words(["what", "are", "we", "eating", "for", "dinner"]) # => ["eating", "dinner"]
puts
print select_long_words(["keep", "coding"])                               # => ["coding"]

# Sum elements in 2 arrays
def sum_elements(arr1, arr2)
  sum = []

  i = 0
  while i < arr1.length
    sum << arr1[i] + arr2[i]
    i += 1
  end
  return sum
  
end

print sum_elements([7, 4, 4], [3, 2, 11])                            # => [10, 6, 15]
puts
print sum_elements(["cat", "pizza", "boot"], ["dog", "pie", "camp"]) # => ["catdog", "pizzapie", "bootcamp"]

# Idk why they call this fizzbuzz
# we're only printing numbers divisible 4 or 6 but not both
def fizz_buzz(max)
  new_nums = []

  i = 1
  while i < max
    if (i % 4 == 0 || i % 6 == 0) &&
      !(i % 4 == 0 && i % 6 == 0)
      new_nums << i
    end
    
    i += 1
  end
  return new_nums
end

print fizz_buzz(20) # => [4, 6, 8, 16, 18]
puts
print fizz_buzz(15) # => [4, 6, 8]