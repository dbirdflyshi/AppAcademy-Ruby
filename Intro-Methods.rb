# Writing to the console
puts "this text goes in the console" # always breaks the line after 
print 'this text goes in the console' # doesnt break the line after
p 'this text goes in the console' # encapsulates it in double quotes 
print "\tthis text goes in the console\n" # \t tabs \n makes a new line

# Comparison Operators
puts 5 == 4 # False
puts 5 != 4 # True
puts 5 > 4 # True
puts 5 < 4 # False
puts 5 >= 4 # True
puts 5 >= 4 # False

# Mathematical Operators
puts 5 + 4 # 9
puts 5 - 4 # 1
puts 5 * 4 # 20
puts 5 / 4 # 1
puts 5 / 4.0 # 1.25
puts 5 % 4 # 1
puts 5 % 4.0 #.0
# PMDAS Operation Flow
puts 5 + (3 + 4) # 12
puts 5 + 3 / 4 # 5

# Boolean Type Operators
# ! (not)
# && (and)
# || (or)
puts true # True
puts false # False
puts !true # False
puts true && false # False
puts true && true # True
puts false && false #  True
puts true || true # True
puts true || false # True
puts false || false # False
puts true || false && !true # True

# Strings
puts "Hello World!" # Writes a string
puts "Hello World!".length # Output : 12 : Writes the length of the string
# Index Positioning
puts "Hello World!"[0] # Output : H : Index starts at 0
puts "Hello World!"["Hello World".length] # Grabbing the last character
puts "Hello World!"[-1] # Grabbing the last character another way 

# Concatenate
puts "Hello " + " World " + ", I love you"

# Variables
var1 = "Hello"
var2 = 10
var3 = "5"
var4 = var2 + 1
var5 = 100
var5 +=1
var6 = var2 % 2 == 0 # Variables with booleans (is it even)

puts var1 # Hello
puts var2 # 10
puts var3 # 5
puts var2 > 4 # True
puts var1 + var3 # Hello5
puts var2 + var4 # 21
puts var5 # 11
puts var6 # Reuw

# Methods

# Defining the method 
def sayMessage
    puts "Hey Programmers"
    puts "What's for lunch?"
end 
# Calling the method
sayMessage

# Defining the method and feeding a parameters into it 
def sayMessage2(text)
    puts text
end 
# Calling the method
sayMessage2('Youre a wizard')

# Defining the method and feeding a variable into it another way
def sayMessage2(text)
    return text
end 
# Calling the method
puts sayMessage2('Im A WOT??')

# Methods with multiple parameters
def adding_them_together(num1,num2,num3)
    sum = num1+num2+num3
    return sum
end
# Calling the method
puts adding_them_together(1,2,3) # output 6
summation = adding_them_together(4,5,6)
puts summation # output 15
# You don't need parentheses 
puts adding_them_together 7,8,9 # output 24

# Vocabulary construced
# Variables are names that can hold data
# Arguments are the concrete data values we pass into method calls. 
# Parameters are the "placeholders" that we use to write a general method.
def function_name(parameter1,parameter2)
    variable = parameter1 / parameter2
end
argument1 = 100 # also a variable
argument2 = 50 # also a variable
puts function_name argument1, argument2 # output : 2