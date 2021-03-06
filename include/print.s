;;
;; Title: Text output routines.
;;
;; Example:
;; >    ; setup VDC write offset and register
;; >    ldx    #$08  ; BAT x = 8
;; >    lda    #$0A  ; BAT y = 10
;; >    jsr    vdc_calc_addr
;; >    jsr    vdc_set_write
;; >    ; output the string "Yo"
;; >    lda    #'Y'
;; >    jsr    print_char
;; >    lda    #'o'
;; >    jsr    print_char

;;
;; function: print_char
;; Output an ASCII character at the current BAT location.
;;
;; Remarks:
;;   * The VDC write register must point to a valid BAT location.
;;   * Only a subset of the ASCII character set is supported
;;     (see <8x8 monochrome 1bpp font>).
;;
;; Parameters:
;;   A - ASCII character
;;
print_char:
    sec
    sbc    #FONT_ASCII_FIRST
    bcc    @unknown 
    cmp    #FONT_8x8_COUNT
    bcc    @go 
@unknown:
      lda    #$1f        ; '?'
@go:
    clc
    adc     <font_base
    vdc_data_l
    cla
    adc     <font_base+1
    vdc_data_h
    rts

;;
;; function: print_digit
;; Output a decimal digit at the current BAT location.
;;
;; Remark:
;; The VDC write register must point to a valid BAT location.
;;
;; Parameters:
;;   A - Digit value between 0 and 9.
;;
print_digit:
    cmp    #10
    bcc    @l0
        ; The digit is out of bound.
        lda    #$0f     ; '?'
@l0:
    clc
    adc    #FONT_DIGIT_INDEX
    clc
    adc     <font_base
    vdc_data_l
    cla
    adc     <font_base+1
    vdc_data_h
    rts

;;
;; function: print_string
;; Display a null (0) terminated string.
;;              
;; The characters must have been previously converted to fit to current font. 
;; Currently line feed and carriage return are not supported. No clamping is 
;; performed either. 
;;
;; Remark:
;; The VDC write register must point to a valid BAT location.
;;
;; Parameters:
;;   _si - string address.
;;     X - textarea x tile position.
;;     A - textarea y tile position.
;;   _al - textarea width.
;;   _ah - textarea height.
;;
;; Return:
;;   _cl
;;   _ch
;;
print_string:
    jsr    vdc_calc_addr 

    ldx    <_ah
@print_loop:
    jsr    vdc_set_write
    addw   vdc_bat_width, <_di    

    cly
@print_line:
        lda    [_si], Y
        beq    @end             ; end of line
        iny
        cmp    #$0a             ; newline
        beq    @next_line
        jsr    print_char
       
        cpy    <_al
        bne    @print_line
@next_line:
    dex
    beq    @end

    tya
    clc
    adc    <_si
    sta    <_si
    bcc    @l0
        inc    <_si+1
@l0:
    bra    @print_loop
@end:
    rts

;;
;; function: print_fill
;; Fill an area with a given character.
;;
;; Parameters:
;;   X - BAT x position.
;;   A - BAT y position.
;;   _al - BAT area width. 
;;   _ah - BAT area height.
;;   _bl - ASCII code.
;;
print_fill:
    jsr    vdc_calc_addr

    lda    <_bl
    sec
    sbc    #FONT_ASCII_FIRST
    bcc    @unknown 
    cmp    #FONT_8x8_COUNT
    bcc    @go 
@unknown:
      cla
@go:
    clc
    adc     <font_base
    pha
    cla
    adc     <font_base+1
    sta     <_si+1

    pla
    jmp    vdc_fill_bat_ex
