;;
;; Title: 8x8 monochrome 1bpp font.
;;
;; The alphabet for this font is: 
;; >!"#$%&'()*+,-./
;; >0123456789:;>=<?
;; >@ABCDEFGHIJKLMNO
;; >PQRSTUVWXYZ[\]^_
;; > abcdefghijklmno
;; >pqrstuvwxyz{|}~

;;
;; ubyte: FONT_8x8_COUNT
;; Number of characters embedded in the font.
FONT_8x8_COUNT=$60

;;
;; ubyte: FONT_8x8_ASCII_FIRST
;; ASCII code of the first font character.
;;
FONT_ASCII_FIRST=$20
;;
;; ubyte: FONT_8x8_ASCII_LAST
;; ASCII code of the last font character.
;;
FONT_ASCII_LAST =$7e

;;
;; ubyte: FONT_DIGIT_INDEX
;; Tile index of the first digit character ('0').
;;
FONT_DIGIT_INDEX=$10
;;
;; ubyte: FONT_UPPER_CASE_INDEX
;; Tile index of the first uppercase character ('A').
;;
FONT_UPPER_CASE_INDEX=$21
;;
;; ubyte: FONT_LOWER_CASE_INDEX
;; Tile index of the first lowercase character ('a').
;;
FONT_LOWER_CASE_INDEX=$41

;;
;; array: font_8x8
;; 8x8 1bpp font data.
;;
font_8x8:
    .byte $00,$00,$00,$00,$00,$00,$00,$00    ;SPACE
    .byte $cc,$cc,$cc,$88,$88,$00,$cc,$00    ;!
    .byte $6c,$6c,$d8,$00,$00,$00,$00,$00    ;"
    .byte $6c,$fe,$6c,$6c,$6c,$fe,$6c,$00    ;#
    .byte $10,$38,$40,$38,$04,$38,$10,$00    ;$
    .byte $42,$a4,$48,$10,$24,$4a,$84,$00    ;%
    .byte $20,$50,$20,$54,$88,$94,$62,$00    ;&
    .byte $18,$30,$60,$00,$00,$00,$00,$00    ;'
    .byte $18,$30,$60,$60,$60,$30,$18,$00    ;(
    .byte $30,$18,$0c,$0c,$0c,$18,$30,$00    ;)
    .byte $54,$38,$7c,$38,$54,$00,$00,$00    ;*
    .byte $00,$10,$10,$7c,$10,$10,$00,$00    ;+
    .byte $00,$00,$00,$18,$18,$08,$10,$00    ;,
    .byte $00,$00,$00,$78,$00,$00,$00,$00    ;-
    .byte $00,$00,$00,$00,$60,$60,$00,$00    ;.
    .byte $06,$0c,$18,$30,$60,$c0,$00,$00    ;/

    .byte $38,$4c,$c6,$c6,$c6,$64,$38,$00    ;0
    .byte $18,$78,$18,$18,$18,$18,$7e,$00    ;1
    .byte $7c,$c6,$0e,$3c,$78,$e0,$fe,$00    ;2
    .byte $fe,$0c,$18,$7c,$06,$c6,$7c,$00    ;3
    .byte $3c,$6c,$cc,$cc,$cc,$fe,$0c,$00    ;4
    .byte $fe,$c0,$fc,$06,$06,$c6,$7c,$00    ;5
    .byte $3c,$60,$c0,$fc,$c6,$c6,$7c,$00    ;6
    .byte $fe,$c6,$0c,$18,$30,$30,$30,$00    ;7
    .byte $7c,$c6,$c6,$7c,$c6,$c6,$7c,$00    ;8
    .byte $7c,$c6,$c6,$7e,$06,$0c,$78,$00    ;9
    .byte $00,$18,$18,$00,$18,$18,$00,$00    ;:
    .byte $00,$18,$18,$00,$18,$18,$30,$00    ;;
    .byte $0c,$18,$30,$60,$30,$18,$0c,$00    ;<
    .byte $00,$00,$7c,$00,$7c,$00,$00,$00    ;=
    .byte $60,$30,$18,$0c,$18,$30,$60,$00    ;>
    .byte $7c,$c6,$9e,$38,$20,$00,$30,$00    ;?

    .byte $3c,$42,$9a,$aa,$aa,$5c,$00,$00    ;@
    .byte $38,$6c,$c6,$c6,$fe,$c6,$c6,$00    ;A
    .byte $fc,$c6,$c6,$fc,$c6,$c6,$fc,$00    ;B
    .byte $3c,$66,$c0,$c0,$c0,$66,$3c,$00    ;C
    .byte $f8,$cc,$c6,$c6,$c6,$cc,$f8,$00    ;D
    .byte $fe,$c0,$c0,$fc,$c0,$c0,$fe,$00    ;E
    .byte $fe,$c0,$c0,$fc,$c0,$c0,$c0,$00    ;F
    .byte $3c,$66,$c0,$ce,$c6,$66,$3e,$00    ;G
    .byte $c6,$c6,$c6,$fe,$c6,$c6,$c6,$00    ;H
    .byte $7e,$18,$18,$18,$18,$18,$7e,$00    ;I
    .byte $06,$06,$06,$06,$06,$c6,$7c,$00    ;J
    .byte $c6,$cc,$d8,$f0,$d8,$cc,$c6,$00    ;K
    .byte $c0,$c0,$c0,$c0,$c0,$c0,$fe,$00    ;L
    .byte $82,$c6,$ee,$fe,$d6,$c6,$c6,$00    ;M
    .byte $86,$c6,$e6,$f6,$de,$ce,$c6,$00    ;N
    .byte $7c,$c6,$c6,$c6,$c6,$c6,$7c,$00    ;O

    .byte $fc,$c6,$c6,$c6,$fc,$c0,$c0,$00    ;P
    .byte $7c,$c6,$c6,$c6,$de,$cc,$76,$00    ;Q
    .byte $fc,$c6,$c6,$fc,$d8,$cc,$c6,$00    ;R
    .byte $7c,$c6,$f0,$7c,$1e,$c6,$7c,$00    ;S
    .byte $7e,$18,$18,$18,$18,$18,$18,$00    ;T
    .byte $c6,$c6,$c6,$c6,$c6,$c6,$7c,$00    ;U
    .byte $c6,$c6,$c6,$c6,$c6,$6c,$38,$00    ;V
    .byte $c6,$c6,$c6,$d6,$fe,$ee,$c6,$00    ;W
    .byte $c6,$ee,$7c,$38,$7c,$ee,$c6,$00    ;X
    .byte $66,$66,$66,$3c,$18,$18,$18,$00    ;Y
    .byte $fe,$0e,$1c,$38,$70,$e0,$fe,$00    ;Z
    .byte $78,$60,$60,$60,$60,$60,$78,$00    ;[
    .byte $c0,$60,$30,$18,$0c,$06,$00,$00    ;\
    .byte $3c,$0c,$0c,$0c,$0c,$0c,$3c,$00    ;]
    .byte $10,$28,$44,$00,$00,$00,$00,$00    ;^
    .byte $00,$00,$00,$00,$00,$00,$fe,$00    ;_

    .byte $00,$00,$00,$00,$00,$00,$00,$00    ; 
    .byte $00,$00,$3c,$06,$7e,$c6,$7e,$00    ;a
    .byte $c0,$c0,$fc,$c6,$c6,$c6,$fc,$00    ;b
    .byte $00,$00,$7c,$c6,$c0,$c6,$7c,$00    ;c
    .byte $06,$06,$7e,$c6,$c6,$c6,$7e,$00    ;d
    .byte $00,$00,$7c,$c6,$fc,$c0,$7e,$00    ;e
    .byte $3e,$60,$60,$f8,$60,$60,$60,$00    ;f
    .byte $00,$00,$7c,$c6,$c6,$7e,$06,$7c    ;g
    .byte $c0,$c0,$fc,$c6,$c6,$c6,$c6,$00    ;h
    .byte $18,$00,$18,$18,$18,$18,$18,$00    ;i
    .byte $0c,$0c,$00,$0c,$0c,$0c,$0c,$78    ;j
    .byte $c0,$c0,$d8,$f0,$e0,$f0,$d8,$00    ;k
    .byte $70,$30,$30,$30,$30,$30,$78,$00    ;l
    .byte $00,$00,$7c,$d6,$d6,$d6,$d6,$00    ;m
    .byte $00,$00,$7c,$66,$66,$66,$66,$00    ;n
    .byte $00,$00,$3c,$66,$66,$66,$3c,$00    ;o

    .byte $00,$00,$7c,$66,$66,$7c,$60,$60    ;p
    .byte $00,$00,$3e,$66,$66,$3e,$06,$06    ;q
    .byte $00,$00,$d8,$fc,$e0,$c0,$c0,$00    ;r
    .byte $00,$00,$3c,$60,$38,$0c,$78,$00    ;s
    .byte $30,$30,$78,$30,$30,$30,$1c,$00    ;t
    .byte $00,$00,$66,$66,$66,$66,$3e,$00    ;u
    .byte $00,$00,$c6,$c6,$6c,$38,$10,$00    ;v
    .byte $00,$00,$c6,$d6,$d6,$d6,$6c,$00    ;w
    .byte $00,$00,$c6,$6c,$10,$6c,$c6,$00    ;x
    .byte $00,$00,$66,$66,$66,$3e,$06,$3c    ;y
    .byte $00,$00,$fe,$0c,$38,$60,$fe,$00    ;z
    .byte $00,$00,$00,$00,$00,$00,$00,$00    ;{ [todo]
    .byte $00,$00,$00,$00,$00,$00,$00,$00    ;| [todo]
    .byte $00,$00,$00,$00,$00,$00,$00,$00    ;} [todo]
    .byte $00,$00,$00,$00,$00,$00,$00,$00    ;~ [todo]
    .byte $00,$00,$00,$00,$00,$00,$00,$00    ;

  .ifdef MAGICKIT
    .include "pceas/font.inc"
  .else
    .ifdef CA65
    .include "ca65/font.inc"
    .endif
  .endif

