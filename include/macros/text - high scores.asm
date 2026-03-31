; --------------------------------------------------------------
; Text - High Scores
; --------------------------------------------------------------

TEXT_SCORE macro text, score, block

	; Letters

i = 0

	while i<strlen(\text)
	
c substr 1+i,1+i,\text

	; Space
		if "\c"=" "
		dc.b	$00
			
	; .
		elseif "\c"="."
		dc.b	$1B
		
	; .
		elseif "\c"="#"
		dc.b	$FF
			
	; A-Z
		elseif ("\c">="A")&("\c"<="Z")
		dc.b	("\c"-$40)	
			
		else
		dc.b	$00
		
	endif
		
i = i+1
	endw
	
	dc.b 	$FF			; 
	dc.l	score		; Score
	dc.w 	block		; Block
	dc.l	0

	endm
	
; --------------------------------------------------------------