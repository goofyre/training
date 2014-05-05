$answer = 0 

For $i = 1 To 999 Step 1 
	if ( Mod($i,3) = 0 Or Mod($i,5) = 0) Then 
		$answer += $i 
	EndIf
Next 

MsgBox(0,"Answer","the answer is " & $answer) 
