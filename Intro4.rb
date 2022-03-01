################################################################################
#                                                                              #
#                           Nested Loops & Hashes                              #
#                                                                              #
################################################################################
######################################
#               Lesson               #
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
