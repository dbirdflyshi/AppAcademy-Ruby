################################################################################
#                                                                              #
#                               Syntax Shortcuts                               #
#                                                                              #
################################################################################
###### Implicit returns allow you to automatically return something from a function
# Less preferred
def get_avg(num_1, num2)
    return (num_1 + num2) / 2
end 

# Preferred by a Rubyist
def get_avg(num_1, num_2)
    (num_1 + num_2 ) / 2
end 

###### Omitting Perehtneses for methods
def say_hi
    puts 'hi'
end

# less preferred
say_hi()

# Preferred by a Rubyist
say_hi

####### Single line conditionals
raining = true

# Less preferred
if raining
    puts "don't forget an umbrella"
end 

# Preferred by a Rubyist
puts "Don't forget an umbrella!" if raining 

###### Using built-in methods
# These are methods pre-installed in the language to save you time with simple tasks
num = 6
# Less preferred 
p num % 2 == 0

# Preferred by a Rubyist
p num.even?

# Another example
people = ['Joey','Bex','Andrew']

# Less Preferred
p people[people.length - 1]

# Preferred by a Rubyist
p people[-1]
p people.last

###### Use Enumerables to iterate
# These built-ins allow you to avoid using your own for loops
# Less preferred
def repeat_hi(num)
    i = 0
    while i < num
        puts 'hi'
        i +=1
    end
end

# Preferred by a Rubyist
def repeat_hi(num)
    num.times {puts 'Hi'}
end

# Given a problem, not all enumerables are equal, some immediately solve the problem
# Less preferred
def all_numbers_even?(nums)
    nums.each do |num|
        return false if num % 2 !=0
    end
    true 
end 

# Preferred by a Rubyist
def all_numbers_even?(nums)
    nums.all? {|num| num.even?}
end


################################################################################
#                                                                              #
#                               More Enumerables                               #
#                                                                              #
################################################################################
###### any? returns true when at least one element is true
p [3,4,7].any?{|el| el.even?} # => true
p [3,5,7].any?{|el| el.even?} # => false

###### none? returns true when no elements result in true 
p [1,3,5].none?{|el| el.even?} # => true
p [1,4,5].none?{|el| el.even?} # => false

###### count returns a number representing the count of elements that result in true
p [1, 2, 3, 4, 5, 6].count { |el| el.even? }    # => 3
p [1, 3, 5].count { |el| el.even? }             # => 0

###### sum returns the total sum of all elements
p [1, -3, 5].sum   # => 3

###### max and min returns the maxmimum and minimum element in the array
p [1, -3, 5].min    # => -3
p [1, -3, 5].max    # => 5
p [].max            # => nil

###### flatten returns the 1 dim array version of a multi dim array
multi_d = [
    [["a", "b"], "c"],
    [["d"], ["e"]],
    "f"
]
p multi_d.flatten   # => ["a", "b", "c", "d", "e", "f"]

################################################################################
#                                                                              #
#                                    Symbols                                   #
#                                                                              #
################################################################################
# Ruby has an additional data type called symbol. In ruby, you denote a symbol
# with a ":" before writing characters. A string is wrapped in wrotes, a symbol
# simply has a colon. Both strings and symbols contain many characters, but they
# are not equivalent

# Delcaring 
str = 'hello'
sym = :hello 

# Finding the character count
p str.length
p sym.length 

# Splicing
p str[1]
p sym[1]

# Comparing
p str == sym # => false

# Symbols are immutable. They cannot be changed unlike strings
str = "hello"
sym = :hello

str[0] = "x"
sym[0] = "x"

p str   # => "xello"
p sym   # => :hello

# Symbols usefulness comes from the fact it can never change over time.
# A symbol only needs to be created once. Operations like comparisons of symbols 
# perform very well and efficiently compared to regular strings.

# When you make a string, each time you make one, even if it's the same thing
# it makes a new memory ID

# Some of the most popular places to use symbols are with hash keys. 
# The old way when building hashes
my_bootcamp = { :name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"] }
p my_bootcamp           # => {:name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"]}
p my_bootcamp[:color]   #=> "red"

# When initializing a hash with symbol keys, there is a shortcut. Drop the rocket
# and move the colon to the right of the symbol 
# Here's the new way 
my_bootcamp = { name:"App Academy", color:"red", locations:["NY", "SF", "ONLINE"] }
p my_bootcamp           # => {:name=>"App Academy", :color=>"red", :locations=>["NY", "SF", "ONLINE"]}
p my_bootcamp[:color]   #=> "red

# This shortcut is only allowed when building the symbols in the hash. When you 
# get the value, you must always put the colon on the left like normal.
## GOOD
hash[:key]
## BAD
hash[key:]

################################################################################
#                                                                              #
#                               Default Arguments                              #
#                                                                              #
################################################################################
# When writing methods or functions, you might need to make an argument optional.
# You can make what are called default arguments by assigning it a value on
# creation.

def repeat(message,num=1)
    message * num
end
p repeat('hi') # =>'hi'
p repeat('hi',3) # => 'hihihi'

# You can use any default value for an optional argument. It's common to set an
# argument to 'nil' by default and have logic based on that scenario.
# In the example below, we're using an if statement to see if person 2 is used or not
# if it is not used, nil? will return true and do one thing, otherwise it will do the other
## Protip: Put your optional arguments at the end ## 
def greet(person_1, person_2=nil)
    if person_2.nil?
        p "Hey " + person_1
    else
        p "Hey " + person_1 + " and " + person_2
    end
end

greet("Dane") # => "Hey Chao"
greet("Dane", "Cami") # => "Hey Chao and Arittro"


################################################################################
#                                                                              #
#                                 Option Hashes                                #
#                                                                              #
################################################################################
# If you have a method that accepts a hash as an argument, you can omit the
# braces when passing in the hash.
def method(hash)
    p hash
end

# here's the proper way to put a hash in a method
method({"location"=>"SF", "color"=>"red", "size"=>100})

# Here's a better way
method("location"=>"SF", "color"=>"red", "size"=>100)

# This allows you to clean things up when you have other arguments before the hash
def modify_string(str, options)
    str.upcase! if options["upper"]
    p str * options["repeats"]
end

# less readable
modify_string("bye", {"upper"=>true, "repeats"=>3}) # => "BYEBYEBYE"

# more readable
modify_string("bye", "upper"=>true, "repeats"=>3)   # => "BYEBYEBYE"

# Putting it all together, with default arguments and hashes, you can make even
# cooler more elegant code

def modify_string(str, options = {'upper' => false, 'repeats' =>1})
    str.upcase! if options['upper']
    p str * options['repeats']
end

modify_string('bye')
modify_string('bye','upper'=>true,'repeats'=>3)

################################################################################
#                                                                              #
#                                 Splat Operator                               #
#                                                                              #
################################################################################
# Splat operator is the * symbol.

# We can use it to accept additional arguments
# Normally, without the splat operator, your could would look like this 
def method(arg_1, arg_2)
    p arg_1
    p arg_2
end

method("a", "b", "c", "d", "e") # ArgumentError: wrong number of arguments

# It is good coding practice to make your scripts foolproof. To do this is to use
# the splat. in this example, it turns the rest of the arguments into an array.
# this can prevent the code from breaking if the user decides to put too many 
# arguments inside of the function.
def method(arg_1, arg_2, *other_args)
    p arg_1         # "a"
    p arg_2         # "b"
    p other_args    # ["c", "d", "e"]
end

method("a", "b", "c", "d", "e") 

method("a", "b") # => 'a' 'b' []

## Protip: Similarly to default arguments, put the splat operator argument at the end

# You can also use a splat to decompose an array.
# This example will give an error
def greet(first_name, last_name)
    p "Hey " + first_name + ", your last name is " + last_name
end

names = ["grace", "hopper"]
greet(names)    # ArgumentError: wrong number of arguments (given 1, expected 2)

# Use a splat like this and it will work!
def greet(first_name, last_name)
    p "Hey " + first_name + ", your last name is " + last_name
end

names = ["Grace", "Hopper"]
greet(*names)    # => "Hey Grace, your last name is Hopper"

# Another example: unpack an array using *, imagine using * to remove the 
# square brackets from the array. 
arr_1 = ["a", "b"]
arr_2 = ["d", "e"]
arr_3 = [ *arr_1, "c", *arr_2 ]
p arr_3 # => ["a", "b", "c", "d", "e"]

# You can also splat decompose hashes! But careful, this one requires double splat
old_hash = { a: 1, b: 2 }
new_hash = { **old_hash, c: 3 }
p new_hash # => {:a=>1, :b=>2, :c=>3}

