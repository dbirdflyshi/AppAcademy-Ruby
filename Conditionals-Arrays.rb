### Conditionals

## Basic
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

### Loops
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