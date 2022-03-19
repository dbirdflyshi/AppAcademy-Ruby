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
