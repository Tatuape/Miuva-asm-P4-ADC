LIST    P = 18F4550	;PIC a utilizar
INCLUDE <P18F4550.INC>

;************************************************************
;Configuración de fusibles
CONFIG  FOSC = HS   
CONFIG  PWRT = ON
CONFIG  BOR = OFF
CONFIG  WDT = OFF
CONFIG  MCLRE = ON
CONFIG  PBADEN = OFF
CONFIG  LVP = OFF
CONFIG  DEBUG = OFF
CONFIG  XINST = OFF

;***********************************************************
;Código

CBLOCK  0x000
    adclecturaH
    adclecturaL
ENDC
    
ORG 0x00    ;Iniciar el programa en el registro 0x00
    goto    INICIO


    INICIO
    movlw	0x00
    movwf	TRISB
    movlw	0x0E
    movwf	ADCON1
    movlw	0x00
    movwf	ADCON0
    movlw	0x08
    movwf	ADCON2
    bsf		ADCON0,ADON
        
    BUCLE  
    bsf		ADCON0, GO_DONE
    btfsc	ADCON0, GO_DONE
    goto	BUCLE
    movff	ADRESL,adclecturaL
    movff	ADRESH,adclecturaH
    movff	adclecturaH, PORTB
    goto	BUCLE
    
END