$answer = 0 

For $loopindex = 1 To 999 Step 1 
	if ( Mod($loopindex,3) = 0 Or Mod($loopindex,5) = 0 ) Then 
		$answer += $loopindex
	EndIf
Next 

MsgBox(0,"Answer","the answer is " & $answer)
