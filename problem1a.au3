;~ Problem 1 from projectEuler.net 
;~ Posted 05 October 2001
;~ Solution by Kyle Chamberlin
;~ Solved 12 July 2012
;~ Problem 1 is stated as :
;~ If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
;~
;~ Find the sum of all the multiples of 3 or 5 below 1000.
;~
;~ Method 1:
;~ We will iterate through each number from 1 to 1000 (but not including 1000), checking to see if each number is divisable by 3 or 5. when we find a number that is divisable by three or five we will add that number to the sum.
;~ Document New Feature

$answer = 0 ; Begin with Answer at 0

For $loopindex = 1 To 999 Step 1 ; loop from 1 to 1000 in steps of 1 holding the current iteration in the variable $loopindex
	if ( Mod($loopindex,3) = 0 Or Mod($loopindex,5) = 0) Then ; check to see if the number stored in $loopindex is evenly divisable by 3 ( so the modulus of the number and 3 (e.g. 10 mod 3 = 1, or 9 mod 3 = 0)  is equal to zero ) or if the number is divisable by 5 ( so the modulus of the number and 5 (e.g. 10 mod 5 = 0, or 9 mod 5 = 4) is equal to zero )
		$answer += $loopindex ; when the above condition is met "if ( ** condition ** )" add the value stored in $loopindex to the variable answer.
	EndIf
Next ; continue the loop by incrementing $loopindex by Step (so in this case 1), and when the variable exceedes our limit (in this case 999) stop. notice that our for loop is from 1 to 999, so when we reach 1000, we do not execute the interior of the for loop. This is important to both getting the correct answer, and for understanding what is called the "off by 1" issue that commonly plagues beginner's code.

MsgBox(0,"Answer","the answer is " & $answer) ; Display the answer to the user.