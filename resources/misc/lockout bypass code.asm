; ---------------------------------------------------------------------------
; Lockout Bypass Code
; ---------------------------------------------------------------------------

	; A A ↑ → ↓ ← B B → ↓ ← ↑ C C ↓ ← ↑ → S S
										
	dc.b	btn_A
	dc.b	btn_A
	dc.b	btn_U
	dc.b	btn_R
	dc.b	btn_D
	dc.b	btn_L
	dc.b	btn_B
	dc.b	btn_B
	dc.b	btn_R
	dc.b	btn_D
	dc.b	btn_L
	dc.b	btn_U
	dc.b	btn_C
	dc.b	btn_C
	dc.b	btn_D
	dc.b	btn_L
	dc.b	btn_U
	dc.b	btn_R
	dc.b	btn_S 
	dc.b	btn_S
					
	dc.b	End_Code

; ---------------------------------------------------------------------------

	even