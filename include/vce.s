;;
;; Title: VCE Functions.
;;

;;
;; function: vce_init
;; Set VCE dot clock, edge blur and background color.
;;
;; Parameters:
;; *none*
;;
vce_init:
	; set VCE dot clock based on the default resolution.
	; enable edge blur in the same time.
  .if (VDC_DEFAULT_XRES < 268)
    lda    #(VCE_BLUR_ON | VCE_DOT_CLOCK_5MHZ)
  .else
    .if (VDC_DEFAULT_XRES < 356)
    lda    #(VCE_BLUR_ON | VCE_DOT_CLOCK_7MHZ)
    .else
    lda    #(VCE_BLUR_ON | VCE_DOT_CLOCK_10MHZ)
    .endif
  .endif
    sta    color_ctrl

	; set background color to black
	stwz   color_reg
    stwz   color_data
    stw    #256, color_reg
    stwz   color_data
   
    rts

;;
;; function: vce_load_palette
;;
;; Parameters:
;;   A - index of the first sub-palette (0-31)
;;   Y - number of sub-palette to copy
;;   _si - address of the sub-palette data
;;
vce_load_palette:
    ; convert sub-palette index to color index
    asl    A
    asl    A
    asl    A
    asl    A
    ; set VCE color index register
    sta    color_reg_lo
    cla
    rol    A
    sta    color_reg_hi
    
    ; copy sub-palette using tia by chunks of 32 bytes
    memcpy_mode #SOURCE_INC_DEST_ALT
    memcpy_args <_si, #color_data, #32
@l0:
	.ifdef MAGICKIT
    jsr    memcpy
	addw   #32, memcpy_src
	.else
		.ifdef CA65
			; SUPER HACKY HACK
			jsr $2000 ; memcpy getz copied to the very beginning of ZP

			;addw   #32, memcpy_src
			; ca65 hack: ad-hoc implementation of addw/adcw
			; among other hacks

			clc
			;lda memcpy_src
			; SUPER HACKY HACKS COMING UP
			lda $2001
			adc #<32
			sta $2001
			lda $2002
			adc #>32
			sta $2002
		.endif
	.endif
    dey
    bne    @l0

    rts
