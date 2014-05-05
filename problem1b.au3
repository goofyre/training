
Func SumOfMultiplesLessThan($target, $multiple) ; This function will add up all the multiples of $multiple less than $target. $target and $multiple are called Parameters.
	$divided = $target / $multiple ; Our goal is to find the integer portion of the division problem, (in our problem 999/3 = 333, and 999/5 = 199.8 and 999/15 = 66.6)
	$rounded = round( $divided )  ; but because some of our divisions have an answer that included a decimal we will find the answer rounded to the nearest integer.
	
	if ( $rounded > $divided ) Then ; if we rounded up, we will need to subtract one, but only if we rounded up.
		$rounded -= 1 ; decrement $rounded by one to account for rounding error.
	EndIf
	
	$sum = $multiple * $rounded * ( $rounded + 1 ) / 2 ; This line is the crux of this entire method. read below for why this line is what it is.

	return $sum ; a return statement will send the value stated back to the original call of the function.
EndFunc ; declare the end of a function


$answer = SumOfMultiplesLessThan(999, 3) + SumOfMultiplesLessThan(999, 5) - SumOfMultiplesLessThan(999, 15) ; set $answer to multiples of 3 less than 1000, plus 5 less than 1000, minus 15 less than 1000

ConsoleWrite( "Method 2 answer : " & $answer & @CRLF) ; write the answer to the console below. & will concatenate text and variable into a string, and @CRLF is an autoit global variable for the carrige return line feed characters used in windows to go to the next line.

