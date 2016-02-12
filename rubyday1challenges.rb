# Write a program which takes a number a number and prints "Valid" if the number is between 1 and 10 (inclusive) and "Invalid" otherwise.

def validInvalid(x)
  if x <= 10 && x > 0
    puts "valid"
  else
    puts "invalid"
  end
end


# Write a program that prints the numbers from 1 to 100. But for multiples of three print Fizz instead of the number and for the multiples of five print Buzz. For numbers which are multiples of both three and five print FizzBuzz

def FizzBuzz()
  x=0
  while x < 100
    x += 1
    if x % 3 == 0 && x % 5 !=0
      puts "Fizz"
    elsif x % 5 == 0 && x% 3 !=0
      puts "Buzz"
    elsif x % 15 == 0
      puts "FizzBuzz"
    else puts x
    end
  end
end


# Create a method called sum_these_numbers which takes two integers as an argument and prints their sum to the screen.

def sum_these_numbers(x,y)
  sum = x + y
  puts sum
end

# Create a method called is_even, which takes a single integer, and which then returns true if the number is even, and false otherwise.

def is_even(x)
  if x % 2 == 0
    puts "true"
  else
    puts "false"
  end
end

# Create an array of words. Iterate through the array using .each and a block, then print each of those words in all capitals.

words = ["the", "and", "that", "this", "those", "mine", "yours"]
words.each {|e| puts e.upcase}


# Write a method which calls another method, then uses its return value.

def methodCallingMethod(str)
  puts "#{str}".upcase
  str
end

# You are writing the user registration page for a secure web site.
# On the registration page, the user has to enter a user ID and a password, which has to adhere to the to following criteria:
#
# User ID and password cannot be the same
# User ID and password have to be at least six characters long
# Password has to contain at least one of: !#$
# User ID cannot contain the following characters: !#$ and space
# Password cannot contain "password" in a capitalization
# Proceed as follows:
#
# Task: Write a function called same that takes a user ID and a password, and returns true if they are, and false otherwise.
# Tests:
#
# same("joe", joe") -> true
# same("joe", "joe1") -> false

def Same(userID, password)
  if userID != password
    puts "true"
  else
    puts "false"
  end
end

# Task: Write a function called longEnough that checks whether a String is at least six characters long, and returns true if it is, and false otherwise.
# Tests:
#
# longEnough(12345) -> false
# longEnough(123456) - > true

def longEnough(userID, password)
  if userID.length >= 6 && password.length >= 6
    puts "true"
  elsif userID.length < 6 && password.length < 6
    puts "false"
  elsif userID.length < 6 && password.length >= 6
    puts "userID false"
  elsif userID.length >= 6 && password.length < 6
    puts "password false"
  end
end



# Task: Write a function called doesNotContainSpecial which checks to see if !, #, $ is not contained in a given String.
# Tests:
#
# doesNotContainSpecial (Hello Friend) -> true
# doesNotContainSpecial ("A#C") -> false
# doesNotContainSpecial ("A!C") -> false
# doesNotContainSpecial ("A$C") -> false

def doesNotContainSpecial(userID)
  if !userID.include?("!") && !userID.include?("#") && !userID.include?("$")
    puts "true"
  else
    puts "false"
  end
end



# Task: Write a method called containsSpecial which checks to see if !, #, $ is contained in a given String.
# Tests:
#
# containsSpecial("Hello Friend") -> false
# containsSpecial("A#C") -> true
# containsSpecial("A!C") -> true
# containsSpecial("A$C") -> true

def containsSpecial(password)
  if password.include?("!") || password.include?("$") || password.include?("#")
    puts "true"
  else
    puts "false"
  end
end

# Task: Write a method that inputs user ID and password from the user, and then tells the user if the they are acceptable.
# Write a main method called validatePassword that:
def validatePassword(userID, password)

# First lets a user input both user ID and password,
puts "Please enter userID?"
userID = gets.chomp
puts "Please enter password"
password = gets.chomp
# Then use the methods above to evaluate if the user ID and password combination is acceptable or not
Same(userID, password)
longEnough(userID, password)
doesNotContainSpecial(userID)
containsSpecial(password)
# Tells user what the result is.

if same(userID, password) = "false"
  puts "UserID and password cannot be the same"
elsif longEnough(userID, password) = "false"
  puts "UserID and password must both be 6 characters or longer"
elsif longEnough(userID, password) = "userID false"
  puts "UserID must be 6 characters or longer"
elsif longEnough(userID, password) = "userID false"
  puts "UserID must be 6 characters or longer"
