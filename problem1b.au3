;~ Problem 1 from projectEuler.net 
;~ Posted 05 October 2001
;~ Solution by Kyle Chamberlin
;~ Solved 12 July 2012
;~ Problem 1 is stated as :
;~ If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
;~
;~ Find the sum of all the multiples of 3 or 5 below 1000.
;~
;~ Method 2:
;~ Here we will take a different approach. We will do a few things differently, some for illustrative purposes, and some for efficiency's sake. 
;~ Firstly, we will make use of a function. If you look at the code above, we execute commands in order, as might be expected. However, this
;~ this is not our only option. When we have a set of commands that we would like to utilize frequently, we can create a function that will
;~ house these instructions and execute them when we call the function. To do this we declare to the program that we are starting a function
;~ by using the term "Func" and once we have finished compiling our instructions into the body of our function we declare the end or our 
;~ function to the program with the term "EndFunc." we will need to name our function, use something descriptive, so that we can reference it
;~ elsewhere in our code. The function we are going to make will be called "SumOfMultiplesLessThan()" the opening and closing parentheses 
;~ are a good identifier of functions and function calls. inside of the parentheses is where you pass the function information. We can 
;~ observe this in action above, the "if" statement we used is a function that is already defined. if() takes a boolean (true or false) value 
;~ as a parameter, and when the parameter is true if if statement executes the body of the then portion. Here is our function:

Func SumOfMultiplesLessThan($target, $multiple) ; This function will add up all the multiples of $multiple less than $target. $target and $multiple are called Parameters.
	$divided = $target / $multiple ; Our goal is to find the integer portion of the division problem, (in our problem 999/3 = 333, and 999/5 = 199.8 and 999/15 = 66.6)
	$rounded = round( $divided )  ; but because some of our divisions have an answer that included a decimal we will find the answer rounded to the nearest integer.
	
	if ( $rounded > $divided ) Then ; if we rounded up, we will need to subtract one, but only if we rounded up.
		$rounded -= 1 ; decrement $rounded by one to account for rounding error.
	EndIf
	
	$sum = $multiple * $rounded * ( $rounded + 1 ) / 2 ; This line is the crux of this entire method. read below for why this line is what it is.

	return $sum ; a return statement will send the value stated back to the original call of the function.
EndFunc ; declare the end of a function

;~ Now is a good time to note that none of this code will be executed if we stop here. a function is only executed when called, and nowhere above 
;~ this point have we called the function SumOfMultiplesLessThan(). So, how does this function find the sum of multiples less than a target value 
;~ you may be asking. Well if we note that the sum could be found by adding each multiple of a number (for illustration we will use multiples of 
;~ 3 up to 15), (e.g 3+6+9+12+15) we can show that if we factor out a 3 from each term we get:
;~ 			
;~ 			3 + 6 + 9 + 12 + 15 = 3 * ( 1 + 2 + 3 + 4 + 5 )
;~ 			
;~ Now we will also note that:
;~ 			
;~ 			5 = 15 / 3 
;~ 			
;~ and that:
;~ 			
;~ 			1 + 2 + 3 + 4 + 5 + ... + n = n * ( n + 1 ) / 2
;~ 			
;~ So,
;~ 			
;~ 			( 1 + 2 + 3 + 4 + 5 ) = 5 * 6 / 2 = 15
;~ 
;~ Therefore, we have all together :
;~ 			
;~ 			3 + 6 + 9 + 12 + 15 = 45 
;~ 			3 * ( 1 + 2 + 3 + 4 + 5 ) = 3 * ( 5 * 6 / 2 ) 
;~ 			3 * ( 5 * 6 / 2 ) = 3 * 15
;~ 			3 * 15 = 45
;~ 			
;~ More generally, we have shown that for any multiple m and highest value t such that m * n is less than or equal to t:
;~ 			
;~ (1)		n = t / m  (rounded down)
;~ 			m + ( m * 2 ) + ( m * 3 ) + ... ( m * n ) = m * ( 1 + 2 + ... + n )
;~ 			m * ( 1 + 2 + ... + n ) = m * ( n * ( n + 1 ) / 2 )
;~ (2)		m * ( n * ( n + 1 ) / 2 )
;~ 
;~ So we now know that the sum of all the multiples of m less than or equal to t can be found using the above equations (1) and (2).
;~ Now we need to utilize the function we have created. so to find the solution to our problem we need to know the sum of all the
;~ multiples of 3 less than or equal to 999 and the sum of all the multiples of 5 less than or equal to 999 and subtract the ones 
;~ we got twice, or all the multiples of 15. so we will get the code below.

$answer = SumOfMultiplesLessThan(999, 3) + SumOfMultiplesLessThan(999, 5) - SumOfMultiplesLessThan(999, 15) ; set $answer to multiples of 3 less than 1000, plus 5 less than 1000, minus 15 less than 1000

ConsoleWrite( "Method 2 answer : " & $answer & @CRLF) ; write the answer to the console below. & will concatenate text and variable into a string, and @CRLF is an autoit global variable for the carrige return line feed characters used in windows to go to the next line.

