	.include "hudk.s"
;==============================================================================;
main:
	; load data into VDC --;
	lda #<.bank(hudson_bitmap)
	sta _bl
	;----------------------;
	stw #$2200,_di
	stw #hudson_bitmap,_si
	stw #((hudson_bitmap_end-hudson_bitmap)>>1),_cx
	jsr vdc_load_data

	stw #$2e00,_di
	lda #<.bank(font_8x8)
	sta _bl
	stw #font_8x8,_si
	;stw #(FONT_8X8_COUNT*8),_cx ; "Error: Symbol `FONT_8X8_COUNT' is undefined"
	stw #($60*8),_cx
	jsr font_load

	;-- load palette data --;
	lda #<.bank(hudson_bitmap)
	sta _bl

	stw #hudson_palette, _si ; source address
	jsr map_data
	cla
	ldy #$02
	jsr vce_load_palette

	;-- setup bat --;
	stw    #$0220, _si

	ldx    #0
    lda    #10
    jsr    vdc_calc_addr

    ldy    #$06
@l0:
    jsr    vdc_set_write
    addw   #64, _di

    ldx    #$20
@l1:
    vdc_data <_si
    incw   _si
    dex
    bne    @l1

    dey
    bne    @l0

    lda    #$01
    jsr    font_set_pal

    stw    #ascii_string, <_si
    lda    #18
    sta    <_al
    lda    #7
    sta    <_ah
    ldx    #7
    lda    #1
    jsr    print_string

    lda    #18
    sta    <_al
    lda    #5
    sta    <_ah
    lda    #'#'
    sta    <_bl
    ldx    #02
    lda    #17
    jsr    print_fill

    ; enable background display
    vdc_reg #VDC_CR
    stw    #(VDC_CR_BG_ENABLE), video_data

    bra    *

ascii_string:
    .byte "Lorem ipsum dolor sit amet, consectetuer adipiscing elit."
    .byte "Aenean commodo ligula eget dolor.\nAenean massa.",$00

;==============================================================================;
; bank 01, position $6000
	.segment "BANK01"

hudson_palette:
	.incbin "example/data/hudson.pal"
	.word $0000, $01ff, $0007, $0000, $0000, $0000, $0000, $0000
    .word $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000

hudson_bitmap:
	.incbin "example/data/hudson.dat"
hudson_bitmap_end:

	.include "font.inc"
