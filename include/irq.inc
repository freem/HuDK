; IRQ ports
irqport = $1400
; Interrupts disable.
irq_disable = irqport+2
; Interrupts status.
irq_status  = irqport+3

; IRQ interrupt bitfield
INT_IRQ2  = 1
INT_IRQ1  = 1<<1
INT_TIMER = 1<<2

; Timer port
timerport = $0c00
; Timer counter register.
; Only the first 6 bits are used. A value of $00 counts as 1, $7f as 128.
timer_cnt  = timerport
; Timer control register.
; Only the first bit is used. The timer is enabled if it is set to 0.
timer_ctrl = timerport+1

; [todo] include compiler specific