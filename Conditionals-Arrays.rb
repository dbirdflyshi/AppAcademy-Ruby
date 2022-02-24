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
