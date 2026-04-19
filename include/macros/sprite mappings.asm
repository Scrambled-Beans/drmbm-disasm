; --------------------------------------------------------------
; mappingsTable	
; --------------------------------------------------------------

mappingsTable: macro *
\*:
.current_mappings_table = *
    endm
	
; --------------------------------------------------------------
; mappingsTableEntry	
; --------------------------------------------------------------

mappingsTableEntry: macro ptr
	dc.\0 \ptr
    endm
	
; --------------------------------------------------------------
; spriteHeader	
; --------------------------------------------------------------

spriteHeader: macro *
\*:
		dc.w ((\*_End-\*_Begin)/8)
\*_Begin:
    endm
	
; --------------------------------------------------------------
; spriteHeaderEnter	
; --------------------------------------------------------------

spriteHeaderEnter: macro number
	dc.w 	number
    endm
	
; --------------------------------------------------------------
; spritePiece	
; --------------------------------------------------------------

	; X, Y, Width, Height, Tile, X Flip, Y Flip, Palette, Priority, Link

spritePiece: macro xpos, ypos, width, height, tile, xflip, yflip, pal, pri, lnk
	dc.w	ypos
	dc.b	(((width-1)&3)<<2)|((height-1)&3)
	dc.b	lnk
	dc.b	((pri&1)<<7)|((pal&3)<<5)|((yflip&1)<<4)|((xflip&1)<<3)|((tile&$700)>>8)
	dc.b	tile&$FF
	dc.w	xpos
	endm

; --------------------------------------------------------------