	.include "hudk.s"
;==============================================================================;
main:
	; load data into VDC --;
	lda #<.bank(hudson_bitmap)
	sta <_bl
	;----------------------;
	;stw #$2200,_di
	lda #<$2200
	sta <_di
	lda #>$2200
	sta <_di+1

	;stw #hudson_bitmap,_si
	lda #<hudson_bitmap
	sta <_si
	lda #>hudson_bitmap
	sta <_si+1

	;stw #((hudson_bitmap_end-hudson_bitmap)>>1),_cx
	lda #<((hudson_bitmap_end-hudson_bitmap)>>1)
	sta <_cx
	lda #>((hudson_bitmap_end-hudson_bitmap)>>1)
	sta <_cx+1

	jsr vdc_load_data

	;stw #$2e00,_di
	lda #<$2e00
	sta <_di
	lda #>$2e00
	sta <_di+1

	lda #<.bank(font_8x8)
	sta <_bl

	;stw #font_8x8,_si
	lda #<font_8x8
	sta <_si
	lda #>font_8x8
	sta <_si+1

	;stw #(FONT_8X8_COUNT*8),_cx ; "Error: Symbol `FONT_8X8_COUNT' is undefined"
	;stw #($60*8),_cx
	lda #<($60*8)
	sta <_cx
	lda #>($60*8)
	sta <_cx+1

	jsr font_load

	;-- load palette data --;
	lda #<.bank(hudson_bitmap)
	sta <_bl

	;stw #hudson_palette, _si ; source address
	lda #<hudson_palette
	sta <_si
	lda #>hudson_palette
	sta <_si+1

	jsr map_data
	cla
	ldy #$02
	jsr vce_load_palette

	;-- setup bat --;
	;stw    #$0220, _si
	lda #<$0220
	sta <_si
	lda #>$0220
	sta <_si+1

	ldx    #0
    lda    #10
    jsr    vdc_calc_addr

    ldy    #$06
@l0:
    jsr    vdc_set_write

    ;addw   #64, _di
    ; ca65 hack: ad-hoc implementation of addw/adcw
	clc
	lda <_di
	adc #<64
	sta <_di
	lda <_di+1
	adc #>64
	sta <_di+1

    ldx    #$20
@l1:
    ;vdc_data <_si
	lda <_si
	vdc_data_l
	lda <_si+1
	vdc_data_h

    ;incw   _si
	inc <_si
	bne @noWrap
	inc <_si+1

@noWrap:
    dex
    bne    @l1

    dey
    bne    @l0

    lda    #$01
    jsr    font_set_pal

    ;stw    #ascii_string, <_si
    lda #<ascii_string
	sta <_si
	lda #>ascii_string
	sta <_si+1

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
    ;stw    #(VDC_CR_BG_ENABLE), video_data
	lda #<VDC_CR_BG_ENABLE
	vdc_data_l
	lda #>VDC_CR_BG_ENABLE
	vdc_data_h

    bra    *

ascii_string:
    .byte "Lorem ipsum dolor sit amet, consectetuer adipiscing elit."
    .byte "Aenean commodo ligula eget dolor.",$0A,"Aenean massa.",$00

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
