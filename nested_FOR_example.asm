 
.EQU INSIDE_FOR_COUNT    = 0x03
.EQU MIDDLE_FOR_COUNT    = 0x03
.EQU OUTSIDE_FOR_COUNT   = 0x03
;--------------------------------------------------------------------
  
.CSEG
.ORG         0x40    
       
main:        MOV     R1, OUTSIDE_FOR_COUNT  ;set outside for loop count
outside_for: SUB     R1, 0x01

             MOV     R2, MIDDLE_FOR_COUNT   ;set middle for loop count
middle_for:  SUB     R2, 0x01
             
             MOV     R3, INSIDE_FOR_COUNT   ;set inside for loop count
inside_for:  SUB     R3, 0x01
             BRNE    inside_for
             
             OR      R2, 0x00               ;load flags for middle for counter
             BRNE    middle_for
             
             OR      R1, 0x00               ;load flags for outsde for counter value
             BRNE    outside_for
 


