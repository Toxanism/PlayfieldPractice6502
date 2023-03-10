    processor 6502
    include "vcs.h"
    include "macro.h"
    seg
    org $F000
    
Reset:
	CLEAN_START
        
        ldx #$80
        stx COLUBK
        
        lda #$1C
        sta COLUPF
        
StartFrame:

	lda #02
        sta VBLANK
        STA VSYNC
       
       
       
       
       	REPEAT 3
        	sta WSYNC
       	REPEND
        lda #0
        sta VSYNC
        
        REPEAT 37
        	sta WSYNC
       	REPEND
        lda #0
        sta VBLANK
                
        ldx #1
        stx CTRLPF
        
        ldx #0
        stx PF0
        stx PF1
        stx PF2
        REPEAT 7
        	sta WSYNC
        REPEND
        
        ldx #%11100000
        stx PF0
        ldx #%11111111
        stx PF1
        stx PF2
        REPEAT 7
        	sta WSYNC
        REPEND
        
        ldx #%00100000
        stx PF0
        ldx #0
        stx PF1
        stx PF2
        REPEAT 164
        	sta WSYNC
        REPEND
        
        ldx #%11100000
        stx PF0
        ldx #%11111111
        stx PF1
        stx PF2
        REPEAT 7
        	sta WSYNC
        REPEND
        
        ldx #0
        stx PF0
        stx PF1
        stx PF2
        REPEAT 7
        	sta WSYNC
        REPEND
        
        lda #2
        sta VBLANK
        REPEAT 30
        	sta WSYNC
        REPEND
        lda #0
        sta VBLANK
        
        jmp StartFrame
        
        org $FFFC
        .word Reset
        .word Reset
