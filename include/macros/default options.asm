; --------------------------------------------------------------
; Default Options
; --------------------------------------------------------------

Default_COM macro com

	move.b	#com, com_level					; VS. COM Level (Scenario Mode)
		
	endm

; --------------------------------------------------------------

Default_Matches macro matches

	move.b	#matches, game_matches			; # Game Matches (1P VS 2P Mode
		
	endm

; --------------------------------------------------------------

Default_Sampling macro Sampling

	move.b	#Sampling, disable_samples		; Use Voice Samples
		
	endm

; --------------------------------------------------------------

Default_1P macro A_1P, B_1P, C_1P

	move.b	#A_1P, player_1_a				; Action for Button A (1P)
	move.b	#B_1P, player_1_b				; Action for Button B (1P)
	move.b	#C_1P, player_1_c				; Action for Button C (1P)
		
	endm

; --------------------------------------------------------------

Default_2P macro A_2P, B_2P, C_2P

	move.b	#A_2P, player_2_a				; Action for Button A (2P)
	move.b	#B_2P, player_2_b				; Action for Button B (2P)
	move.b	#C_2P, player_2_c				; Action for Button C (2P)
		
	endm

; --------------------------------------------------------------
