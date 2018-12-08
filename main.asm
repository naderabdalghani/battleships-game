INCLUDE YOSRY.INC
INCLUDE AHMAD.INC
INCLUDE NADER.INC
.MODEL LARGE
.386
.STACK 64
.DATA

;---------------- STARTING PAGE -------------------------
WELCOME_MSG                 DB   24,'Welcome To Battleships !'
CONTROLLERS_MSG             DB   10,'Controls: '
ARROWS_MSG                  DB   60,'ARROWS: For navigation (in the grid and power ups selection)'
TAB_MSG                     DB   46,'TAB: To enter and exit the power ups selection'
SPACE_MSG                   DB   47,'SPACE: To select a column or control the slider'
ENTER_MSG                   DB   37,'ENTER: To move throughout game stages'

;---------------- GENERAL MESSAGES -------------------------
PLAYER_TURN         DB      35,"'s turn ! Press ENTER to continue !"
CHOOSE_LEVEL_MSG    DB      33,"- Press ENTER to choose a level !"
ATTACK_TIME_MSG     DB      41,"- Attack time ! Press ENTER to continue !"
VIEW_SHIPS_MSG      DB      97,"- Take a look at your ships to see the effect of your opponent's attack !"
                    DB      " Press ENTER to ATTACK !"

;---------------- ATTACK -----------------------------------
SELECT_ATTACK_COLUMN_MSG                DB  84,"- Navigate through columns and press SPACE "
                                        DB  "to select the column of the attacked cell"
FIRE_SLIDER_MSG                         DB  64,"- Press SPACE to stop the slider at the row of the attacked cell"
CELL_ALREADY_ATTACKED_MSG               DB  81,"- You attacked the cell that you already attacked before! Press ENTER to continue"
GRID_MISSED_MSG                         DB  47,"- You missed the grid ! Press ENTER to continue"
ON_TARGET_MSG                           DB  61,"- Your attack hit a ship ! Good job ! Press ENTER to continue"
NOT_ON_TARGET_MSG                       DB  69,"- Your attack didn't hit a ship ! Hard Luck ! Press ENTER to continue"
ATTACKX                                 DW ?        
ATTACKY                                 DW ?               
IS_EVEN                                 DB ?
IS_ONTARGET                             DB ?
IS_ATTACKED_BEFORE                      DB ?
IS_ON_GRID                              DB ?
PLAYER_ATTACKING                        DB 1
PLAYER_ATTACKED                         DB 2
GAME_END                                DB 0
SHIP_INDEX                              DB 0
SHIP_SIZE                               DW ?

;---------------- STATISTICS MENU - ------------------------; 
TO_RESTART_GAME                         DB  33,"- To restart the game press ENTER"
TO_QUIT_GAME                            DB  28,"- To quit the game press ESC"
;---------------- STATUS BAR - ------------------------; 
SCORE_CONSTANT_TEXT                     DB  10,"'s score: "
EMPTY_STRING                            DB  100,100 DUP(' ')
CONCATENATED_STRING                     DB  100,"- ",98 DUP(' ')
;----------------------- NADER (EXPERIMENTAL) - ------------------------; 

STATUS_TEST1                            DB  35," is a good person and hates oatmeal"
STATUS_TEST2                            DB  68,"- Please select the orientation of the highlighted ship on the right"
                         
;---------------- CELLS SELECTOR------------------------;
SELECTOR_INITIAL_X1                     EQU 20
SELECTOR_INITIAL_Y1                     EQU 19
SELECTOR_INITIAL_X2                     EQU 20
SELECTOR_INITIAL_Y2                     EQU 19
SELECTOR_X1                             DW  ?
SELECTOR_Y1                             DW  ?
SELECTOR_X2                             DW  ?
SELECTOR_Y2                             DW  ?
SELECTOR_GRID_INITIAL_X1                EQU 0
SELECTOR_GRID_INITIAL_Y1                EQU 0
SELECTOR_GRID_X1                        DW  ?
SELECTOR_GRID_Y1                        DW  ?
SELECTOR_GRID_X2                        DW  ?
SELECTOR_GRID_Y2                        DW  ?
JUMP_COUNTER                            DW  1
UP_ORIENTATION                          DB  ?   ;ORIENTATION = 0 : INVALID
DOWN_ORIENTATION                        DB  ?   ;            = 1 : VALID
LEFT_ORIENTATION                        DB  ?
RIGHT_ORIENTATION                       DB  ?
SELECTED_PLAYER_SHIPS                   DB  ?
SELECTOR_STARTING_MSG                   DB  84,"- Please select the starting cell of the highlighted ship on the right (Press ENTER)"
ORIENTATION_SELECTION_MSG               DB  82,"- Please select the orientation of the highlighted ship on the right (Press ENTER)"
NO_POSSIBLE_ORIENTATION                 DB  96,"- Sorry there is no possible orientation on this cell, press ENTER and choose another valid cell"
START_PLACING_SHIPS_MSG                 DB  88,"- You are going to place your ships (on the right) on the grid now, press ENTER to start"
ALL_SHIPS_PLACED_MSG                    DB  53,"- You placed all your ships ! Press ENTER to continue"
;---------------- COORDINATES TRANSFER PARAMETERS ----------
GRID1_X            DW  ?
GRID2_X            DW  ?
GRID1_Y            DW  ?
GRID2_Y            DW  ?
PIXELS1_X          DW  ?
PIXELS2_X          DW  ?
PIXELS1_Y          DW  ?
PIXELS2_Y          DW  ?
;---------------- GAME SCREEN ------------------------------ DONE
GAME_SCREEN_MAX_X   EQU 799
GAME_SCREEN_MAX_Y   EQU 479
;---------------- GRID  ------------------------------------
GRID_SIZE_MAX                   EQU 400
GRID_SQUARE_SIZE_MAX            EQU 44
GRID_SQUARE_SIZE                DW  ?
GRID_MAX_COORDINATE_MIN         EQU 16
GRID_MAX_COORDINATE             DW  ?
GRID_CORNER1_X                  EQU 20
GRID_CORNER1_Y                  EQU 19
GRID_CORNER2_X                  EQU 460
GRID_CORNER2_Y                  EQU 459
GRID_CELLS_MAX_COORDINATE_MIN   EQU 9 
GRID_CELLS_MAX_COORDINATE       DW  ?

;---------------- COLUMN SELECTOR -------------------------- DONE
COLUMN_SELECTOR_ROW                 EQU GRID_CORNER2_Y+2
COLUMN_SELECTOR_CURRENT_COLUMN      DW  ?
COLUMN_SELECTOR_MIN_COLUMN          DW  ?
COLUMN_SELECTOR_MAX_COLUMN          DW  ?

;---------------- COLORS ----------------------------------------
VARIABLE_COLOR      DB  ?
BLACK               DB  00H
BLUE                DB  01H
GREEN               DB  02H
CYAN                DB  03H
RED                 DB  04H
MAGENTA             DB  05H
BROWN               DB  06H
LIGHT_GRAY          DB  07H
DARK_GRAY           DB  08H
LIGHT_BLUE          DB  09H
LIGHT_GREEN         DB  0AH
LIGHT_CYAN          DB  0BH
LIGHT_RED           DB  0CH
LIGHT_MAGENTA       DB  0DH
YELLOW              DB  0EH
WHITE               DB  0FH
;---------------- DRAW RECTANGLE PARAMETERS ----------------------
X1                  DW  ?
X2                  DW  ?
Y1                  DW  ?
Y2                  DW  ?
;---------------- SLIDER DATA ------------------------------------ DONE
SLIDER_BAR_COLUMN   EQU 470
SLIDER_COLUMN       EQU 480
SLIDER_INITIAL_ROW  EQU 473
SLIDER_CURRENT_ROW  DW  SLIDER_INITIAL_ROW
SLIDER_DIRECTION    DB  0   ; 0 UP, 1 DOWN
SLIDER_MAX_UP       EQU  5
SLIDER_MAX_DOWN     EQU 473

;---------------- KEY SCAN CODES ------------------------------- DONE
SPACE_SCANCODE      EQU 39H
F2_SCANCODE         EQU 3CH
EXIT_SCANCODE       EQU 01H
ENTER_SCANCODE      EQU 1CH
UP_SCANCODE         EQU 48H
DOWN_SCANCODE       EQU 50H
RIGHT_SCANCODE      EQU 4DH
LEFT_SCANCODE       EQU 4BH
BACK_SCANCODE       EQU 0EH
P_SCANCODE          EQU 19H
TAB_SCANCODE        EQU 0FH

;---------------- POWER UPS --------------------------------
POWER_UPS_CARD_WIDTH             EQU 89     ; WITHOUT BORDERS
POWER_UPS_CARD_HEIGHT            EQU 133    ; WITHOUT BORDERS
POWER_UPS_CARD_MARGIN            EQU 15
POWER_UPS_CARD_X1                DW  ?
POWER_UPS_CARD_Y1                DW  ?
POWER_UPS_CARD_X2                DW  ?
POWER_UPS_CARD_Y2                DW  ?
; CARDS CORNERS (WITHOUT BORDERS)
POWER_UPS_CARD1_X1               EQU  GRID_CORNER2_X +((GAME_SCREEN_MAX_X - GRID_CORNER2_X - POWER_UPS_CARD_WIDTH) / 2)
POWER_UPS_CARD1_X2               EQU  POWER_UPS_CARD1_X1 + POWER_UPS_CARD_WIDTH - 1
POWER_UPS_CARD1_Y1               EQU  GRID_CORNER1_Y + 2
POWER_UPS_CARD1_Y2               EQU  POWER_UPS_CARD1_Y1 + POWER_UPS_CARD_HEIGHT - 1
POWER_UPS_CARD2_Y1               EQU  POWER_UPS_CARD1_Y1 +  POWER_UPS_CARD_HEIGHT + POWER_UPS_CARD_MARGIN + 4  
POWER_UPS_CARD2_Y2               EQU  POWER_UPS_CARD2_Y1 + POWER_UPS_CARD_HEIGHT - 1
POWER_UPS_CARD3_Y1               EQU  POWER_UPS_CARD2_Y1 +  POWER_UPS_CARD_HEIGHT + POWER_UPS_CARD_MARGIN + 4  
POWER_UPS_CARD3_Y2               EQU  POWER_UPS_CARD3_Y1 + POWER_UPS_CARD_HEIGHT - 1
TEMP                             DW   ?
P1_IS_USED                       DB   0, 0, 0
P2_IS_USED                       DB   0, 0, 0
P1_N_AVAILABLE_POWER_UPS         DB   3
P2_N_AVAILABLE_POWER_UPS         DB   3
IS_ATTACK_TWICE_ACTIVATED        DB   0
IS_REVERSE_ATTACK_ACTIVATED      DB   0
IS_REVERSE_COUNT                 DB   0
IS_DESTROY_SHIP_ACTIVATED        DB   0
RANDOM_SHIP                      DB   ?
RANDOM_PLAYER                    DB   ?
RANDOM_NUMBER                    DB   ?
DESTROY_SHIP_MSG                 DB   67,"- Use this to destroy ANY random ship (it can be a ship of yours !)"
ATTACK_TWICE_MSG                 DB   40,"- Use this to attack twice in one turn !"
REVERSED_ATTACK_MSG              DB   74,"- Use this to redirect your opponent's next attack towards his own ships !"
IN_SECOND_ATTACK_MSG             DB   70,"- You are now doing the extra attack, you cannot activate a power up !"
REVERSE_A_REVERSED_ATTACK_MSG    DB   98,"- You and your opponent tried to reverse each other's attacks this turn ! " 
                                 DB   "All reverses cancelled !"
YOUR_ATTACK_WAS_REVERSED_MSG     DB   100,"- Looks like your opponent reversed your attack towards your ships !"
                                 DB   " Press ENTER to see the damage !"
POWER_UPS_CURRENT_PLAYER         DB   ? 
POWER_UP_INDEX                   DB   ?

;---------------- MAIN MENU MESSAGES DATA FOR THE USER ------------  DONE
PLEASE_ENTER_YOUR_NAME_MSG  DB    19H,'- Please enter your name:'
PLAYER1_MSG                 DB    8H ,'Player 1' 
PLAYER2_MSG                 DB    8H ,'Player 2'         
PRESS_ENTER_MSG             DB    1DH,'- Press ENTER key to continue' 
TO_START_GAME_MSG           DB    1CH,'- To start the game press F2'
ENTER_LEVEL_MSG             DB    1EH,'- Choose the game level 1 or 2'
TO_END_PROG_MSG             DB    1EH,'- To end the program press ESC'
END_GAME_MSG                DB     27,"- To end the game press ESC"
;---------------- COMMON DATA FOR BOTH PLAYERS -------------------
LEVEL                   DB     1
MSG_1                   DB     1,'1'
MSG_2                   DB     1,'2'
MSG_Dash                DB     1,'-'

;---- NUMBER OF SHIPS AND CELLS ----------------------------------  DONE
N_SHIPS          EQU 10         ; PLAYER 1 NUMBER OF SHIPS
TOTAL_N_CELLS    EQU 32

;---------------- PLAYER 1 DATA ----------------------------------
P1_USERNAME         DB  16, ?, 16 DUP ('?')
P1_SCORE            DB  TOTAL_N_CELLS ; NUMBER OF REMAINING CELLS, INITIALLY TOTAL CELLS OF ALL SHIPS
P1_SCORE_STRING                         DB  2 DUP(?)

;-------- P1 ATTACKS ---------------------------------------------
;GRID CELLS THAT P1 ATTACKED (CELL1X, CELL1Y, CELL2X, CELL2Y, ..)
P1_ATTACKS_ONTARGET_NUM     DW  0
P1_ATTACKS_ONTARGET         DW  (GRID_SIZE_MAX * 2) DUP('*')
P1_ATTACKS_MISSED_NUM       DW  0
P1_ATTACKS_MISSED           DW  (GRID_SIZE_MAX * 2) DUP('*') 


;-------- P1 SHIPS DATA ------------------------------------------
P1_SHIPS LABEL BYTE
P1_SHIPS_POINTS             DW  N_SHIPS * 4 DUP(-2)       ; FOR EACH SHIP STORE POINT1_X, POINT1_Y
                                                         ; POINT2_X, POINT2_Y
P1_SHIPS_SIZES              DW  5, 4, 4, 4, 3, 3, 3, 2, 2, 2
         ; NUMBER OF REMAINING CELLS FOR EACH SHIP
P1_SHIPS_IS_VERTICAL        DW  N_SHIPS DUP(1)            ; IS THE SHIP VERTICAL? (0: HORIZONTAL, 1:VERTICAL)
P1_SHIPS_REMAINING_CELLS    DB  5, 4, 4, 4, 3, 3, 3, 2, 2, 2
       
;---------------- PLAYER 2 DATA ----------------------------------
P2_USERNAME         DB  16, ?, 16 DUP ('?')
P2_SCORE            DB  TOTAL_N_CELLS ; NUMBER OF REMAINING CELLS, INITIALLY TOTAL CELLS OF ALL SHIPS
P2_SCORE_STRING                         DB  2 DUP(?)

;-------- P2 ATTACKS ---------------------------------------------
;GRID CELLS THAT P2 ATTACKED (CELL1X, CELL1Y, CELL2X, CELL2Y, ..)

P2_ATTACKS_ONTARGET_NUM     DW  0
P2_ATTACKS_ONTARGET         DW  (GRID_SIZE_MAX * 2) DUP('*')
P2_ATTACKS_MISSED_NUM       DW  0
P2_ATTACKS_MISSED           DW  (GRID_SIZE_MAX * 2) DUP('*')  

;-------- P2 SHIPS DATA ------------------------------------------
P2_SHIPS LABEL BYTE
P2_SHIPS_POINTS             DW  N_SHIPS * 4 DUP(-2)       ; FOR EACH SHIP STORE POINT1_X, POINT1_Y
                                                         ; WE DON'T NEED POINT 2 AS WE HAVE SIZE & VERTICAL OR HORIZONTAL
                                                         ; BUT KEEP THEM NOT TO CALCUALTE THEM EACH TIME
P2_SHIPS_SIZES              DW  5, 4, 4, 4, 3, 3, 3, 2, 2, 2
                                                             ; NUMBER OF REMAINING CELLS FOR EACH SHIP
P2_SHIPS_IS_VERTICAL        DW  N_SHIPS DUP(1)            ; IS THE SHIP VERTICAL? (0: HORIZONTAL, 1:VERTICAL)
P2_SHIPS_REMAINING_CELLS    DB  5, 4, 4, 4, 3, 3, 3, 2, 2, 2 

.CODE
MAIN PROC FAR
MOV AX, @DATA
MOV DS, AX
MOV ES, AX

        INITIALIZE_PROGRAM
        STARTING_PAGE
        USER_NAMES
STARTING_POINT:
        MAIN_MENU
        GET_LEVEL
        DRAW_STATUS_BAR_TEMPLATE 
        PLAYERS_PLACE_SHIPS
        START_THE_GAME
PRE_EXIT_SCREEN:
        DRAW_PRE_EXIT_SCREEN     
THE_END:
        EXIT_GAME
  
HLT
RET
MAIN    ENDP

;-------------------------------------;
;--------- YOUSRY PROCEDURES ---------;
;-------------------------------------;
POWER_UP_PICKER_ PROC    NEAR
    ; PARAMETERS
    ; AL = PLAYER_NUMBER
    MOV POWER_UPS_CURRENT_PLAYER, AL
    MOV CL, 1
    MOV DL, 1
    
    CMP POWER_UPS_CURRENT_PLAYER, 1
    JNZ SET_POWER_UPS_P2
    MOV DI, OFFSET P1_N_AVAILABLE_POWER_UPS
    MOV BX, OFFSET P1_IS_USED
    JMP CHECK_N_POWER_UPS
    SET_POWER_UPS_P2:
    MOV DI, OFFSET P2_N_AVAILABLE_POWER_UPS
    MOV BX, OFFSET P2_IS_USED
    
    CHECK_N_POWER_UPS:
    CMP BYTE PTR [DI], 0
    JNZ DRAW_THE_CARDS
    JMP END_PICKER
    
    DRAW_THE_CARDS:
    MOV DH, BYTE PTR [DI]
    INC DH
    DRAW_POWER_UP_CARD_BORDER   CL, RED
    ; CL IS THE POSITION INDEX, WE NEED THE POWER UP INDEX
    GET_POWER_UP_INDEX  CL, BX
    PRINT_POWER_UP_MSG  POWER_UP_INDEX
    
    PICKER_WAIT_KEY_PRESS:
    MOV AH, 0
    INT 16H
    CMP AH,EXIT_SCANCODE
    JE PRE_EXIT_SCREEN
    CMP AH, UP_SCANCODE
    JZ MOVE_POWER_UP_UP
    CMP AH, DOWN_SCANCODE
    JZ MOVE_POWER_UP_DOWN
    CMP AH, ENTER_SCANCODE
    JZ ACTIVATE_POWER_UP
    CMP AH, TAB_SCANCODE
    JZ GO_BACK
    CMP AH, BACK_SCANCODE
    JZ GO_BACK
    JMP PICKER_WAIT_KEY_PRESS
    
    CHANGE_HIGHLIGHTED_POWER_UP:
    GET_POWER_UP_INDEX  CL, BX
    PRINT_POWER_UP_MSG  POWER_UP_INDEX
    DRAW_POWER_UP_CARD_BORDER   DL, BLACK
    MOV DL, CL
    DRAW_POWER_UP_CARD_BORDER   CL, RED
    JMP PICKER_WAIT_KEY_PRESS
    
    MOVE_POWER_UP_UP:
    DEC CL
    CMP CL, 0
    JNZ CHANGE_HIGHLIGHTED_POWER_UP
    MOV CL, BYTE PTR [DI]
    JMP CHANGE_HIGHLIGHTED_POWER_UP
    
    MOVE_POWER_UP_DOWN:
    INC CL
    CMP CL, DH 
    JNZ CHANGE_HIGHLIGHTED_POWER_UP
    MOV CL, 1
    JMP CHANGE_HIGHLIGHTED_POWER_UP
    
    ACTIVATE_POWER_UP:
    ; CL IS THE POSITION INDEX, WE NEED THE POWER UP INDEX
    GET_POWER_UP_INDEX   CL, BX
    ; SET AS USED
    MOV AL, POWER_UP_INDEX
    MOV AH, 0
    DEC AX
    ADD BX, AX
    MOV BYTE PTR [BX], 1
    ; DECREMENT N_AVAILABLE_POWER_UPS
    DEC BYTE PTR [DI]
    ; CHECH WHICH POWER UP
    CMP POWER_UP_INDEX, 1
    JZ ACTIVATE_DESTROY_SHIP
    CMP POWER_UP_INDEX, 2
    JZ ACTIVATE_ATTACK_TWICE
    JMP ACTIVATE_REVERSED_ATTACK
    
    
    ACTIVATE_DESTROY_SHIP:
    ACTIVATE_DESTROY_RANDOM_POWER_UP
    JMP RETURN_TO_GAME
    
    ACTIVATE_ATTACK_TWICE:
    ACTIVATE_ATTACK_TWICE_POWER_UP
    JMP RETURN_TO_GAME
    
    ACTIVATE_REVERSED_ATTACK:
    CMP IS_REVERSE_ATTACK_ACTIVATED, 1
    JZ  REVERSE_A_REVERSED_ATTACK
    MOV IS_REVERSE_ATTACK_ACTIVATED ,1
    JMP RETURN_TO_GAME
    
    REVERSE_A_REVERSED_ATTACK:
    MOV IS_REVERSE_ATTACK_ACTIVATED , 0
    MOV IS_REVERSE_COUNT, 0
    PRINT_NOTIFICATION_MESSAGE  REVERSE_A_REVERSED_ATTACK_MSG, 1
    PRINT_NOTIFICATION_MESSAGE  PRESS_ENTER_MSG, 2
    WAIT_FOR_ENTER_RR:
        MOV AH, 0
        INT 16H
        CMP AH, ENTER_SCANCODE
    JNZ WAIT_FOR_ENTER_RR
    JMP RETURN_TO_GAME
    
    GO_BACK:
    DRAW_POWER_UP_CARD_BORDER   CL, BLACK
    JMP END_PICKER
    
    RETURN_TO_GAME:
    CLEAR_POWER_UPS
    DRAW_POWER_UPS  POWER_UPS_CURRENT_PLAYER

    END_PICKER:
    PRINT_NOTIFICATION_MESSAGE  SELECT_ATTACK_COLUMN_MSG, 1
    RET
POWER_UP_PICKER_    ENDP
;-------------------------------------;
CLEAR_POWER_UPS_    PROC    NEAR
    MOV PIXELS1_X, POWER_UPS_CARD1_X1
    MOV PIXELS1_Y, POWER_UPS_CARD1_Y1
    MOV PIXELS2_X, POWER_UPS_CARD1_X2
    MOV PIXELS2_Y, POWER_UPS_CARD3_Y2
    SUB PIXELS1_X, 2
    SUB PIXELS1_Y, 2
    ADD PIXELS2_X, 2
    ADD PIXELS2_Y, 2
    DRAW_RECTANGLE  PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, WHITE
    RET
CLEAR_POWER_UPS_    ENDP
;-------------------------------------;
GET_POWER_UP_INDEX_      PROC    NEAR
    ; PARAMETERS
    ; AH = POSITION INDEX
    ; BX = IS_USED OFFSET
    ; RETURNS
    ; POWER_UP_INDEX

    MOV CL, AH
    MOV AL, 0   ; COUNTER
    MOV AH, 0   ; POWER UP INDEX
    DEC BX
    GET_POWER_UP_INDEX_LOOP:
        INC BX
        INC AH
        CMP BYTE PTR [BX], 0
        JNZ GET_POWER_UP_INDEX_LOOP
        INC AL
        CMP AL, CL
    JNZ GET_POWER_UP_INDEX_LOOP
    MOV POWER_UP_INDEX, AH
    RET
GET_POWER_UP_INDEX_ ENDP
;-------------------------------------;

PRINT_POWER_UP_MSG_      PROC    NEAR
    ; PARAMETERS
    ; AL = POWER_UP_INDEX
    CMP AL, 1
    JZ PRINT_DESTROY_SHIP_MSG
    
    CMP AL, 2
    JZ PRINT_ATTACK_TWICE_MSG
    
    PRINT_NOTIFICATION_MESSAGE  REVERSED_ATTACK_MSG, 1
    JMP RETURN_TO_PICKER
    
    PRINT_DESTROY_SHIP_MSG:
    PRINT_NOTIFICATION_MESSAGE  DESTROY_SHIP_MSG, 1
    JMP RETURN_TO_PICKER
    
    PRINT_ATTACK_TWICE_MSG:
    PRINT_NOTIFICATION_MESSAGE  ATTACK_TWICE_MSG, 1
    
    RETURN_TO_PICKER:
    RET
PRINT_POWER_UP_MSG_ ENDP
;-------------------------------------;   
      
ACTIVATE_ATTACK_TWICE_POWER_UP_   PROC    NEAR
    MOV IS_ATTACK_TWICE_ACTIVATED  , 1
    RET
ACTIVATE_ATTACK_TWICE_POWER_UP_    ENDP
;-------------------------------------;

ACTIVATE_DESTROY_RANDOM_POWER_UP_   PROC    NEAR    
     MOV IS_DESTROY_SHIP_ACTIVATED  , 1
     
     MOV AH,2CH               ;GET TIME
     INT 21H 
     
     MOV RANDOM_NUMBER, DH
     MOV CL ,DH
     MOV CH ,00H
     MOV DL ,002
     
     MOV AX , CX
     DIV DL
     MOV RANDOM_PLAYER , AH
     
     MOV DL ,0AH
     MOV AX , CX
     DIV DL 
     MOV RANDOM_SHIP , AH 
     MOV DL ,RANDOM_SHIP
     MOV DH ,00
     CMP RANDOM_PLAYER , 1
     JZ DESTROY_PLAYER1_SHIP
     DESTROY_PLAYER2_SHIP:
     ; CHECK IF THE SHIP IS ALREADY DESTROYED
     MOV BX, OFFSET P2_SHIPS_REMAINING_CELLS
     ADD BX, DX
     P2_CHECK_ALREADY_DESTROYED:
        CMP BYTE PTR[BX], 0
        JNZ P2_SHIP_NOT_DESTROYED
        INC DX
        INC BX
        CMP DX, 0AH
        JNZ P2_CHECK_ALREADY_DESTROYED
        MOV DX, 0
        MOV BX, OFFSET P2_SHIPS_REMAINING_CELLS
        JMP P2_CHECK_ALREADY_DESTROYED
     P2_SHIP_NOT_DESTROYED:
     
     MOV BX, OFFSET P1_ATTACKS_ONTARGET         ; DESTROY PLAYER 2 SHIP --> ADD TO P1 ATTACKS
     MOV AX, P1_ATTACKS_ONTARGET_NUM
     MOV CL, 4
     MUL CL                                      
     ADD BX, AX                                  ;BX --> THE START POINT WHERE SHOULD I AND THE DESTROYED SHIP POINTS
     MOV DI, OFFSET P2_SHIPS_SIZES
     MOV AX, DX
     MOV CL, 2
     MUL CL                                      
     ADD DI, AX 
     MOV AX, [DI]     
     MOV SHIP_SIZE, AX                        ;SHIP_SIZE --> THE SIZE OF THE SHIP
     MOV DI, OFFSET P2_SHIPS_REMAINING_CELLS
     MOV AX, DX
     ADD DI, AX                                 ; DI --> REMAINING CELLS
     MOV SI, OFFSET P2_SHIPS_IS_VERTICAL
     MOV AX, DX
     MOV CL, 2
     MUL CL                                      
     ADD SI, AX                                 ;SI --> IS THE SHIP VERTICAL  
     MOV BP, OFFSET P2_SHIPS_POINTS
     MOV AX, DX
     MOV CL, 8
     MUL CL                                      
     ADD BP, AX                                 ;BP --> THE START POINT OF THE SHIP
     ; INCREASE THE COUNT OF THE ATTACKS
     MOV AX, SHIP_SIZE
     ADD P1_ATTACKS_ONTARGET_NUM, AX
     JMP DESTROY_RANDOM_SHIP_NOW
     
     DESTROY_PLAYER1_SHIP:
     ; CHECK IF THE SHIP IS ALREADY DESTROYED
     MOV BX, OFFSET P1_SHIPS_REMAINING_CELLS
     ADD BX, DX
     P1_CHECK_ALREADY_DESTROYED:
        CMP BYTE PTR[BX], 0
        JNZ P1_SHIP_NOT_DESTROYED
        INC BX
        INC DX
        CMP DX, 0AH
        JNZ P1_CHECK_ALREADY_DESTROYED
        MOV DX, 0
        MOV BX, OFFSET P1_SHIPS_REMAINING_CELLS
        JMP P1_CHECK_ALREADY_DESTROYED
     P1_SHIP_NOT_DESTROYED:
     
     MOV BX, OFFSET P2_ATTACKS_ONTARGET         ;DESTROY PLAYER 1 ATTACK , MEANS THAT PLAYER 2 ATTACKED
     MOV AX, P2_ATTACKS_ONTARGET_NUM
     MOV CL, 4
     MUL CL                                      
     ADD BX, AX                                  ;BX --> THE START POINT WHERE I SHOULD PUT THE DESTROYED SHIP POINTS
     MOV DI, OFFSET P1_SHIPS_SIZES
     MOV AX, DX
     MOV CL, 2
     MUL CL                                      
     ADD DI, AX
     MOV AX, [DI]     
     MOV SHIP_SIZE, AX                        ;SHIP_SIZE --> THE SIZE OF THE SHIP  
     MOV DI, OFFSET P1_SHIPS_REMAINING_CELLS
     MOV AX, DX
     ADD DI, AX                                 ; DI --> REMAINING CELLS     
     MOV SI, OFFSET P1_SHIPS_IS_VERTICAL
     MOV AX, DX
     MOV CL, 2
     MUL CL                                      
     ADD SI, AX                                 ;SI --> IS THE SHIP VERTICAL  
     MOV BP, OFFSET P1_SHIPS_POINTS
     MOV AX, DX
     MOV CL, 8
     MUL CL                                      
     ADD BP, AX                                 ;BP --> THE START POINT OF THE SHIP
     ; INCREASE THE COUNT OF THE ATTACKS
     MOV AX, SHIP_SIZE
     ADD P2_ATTACKS_ONTARGET_NUM, AX
     
     DESTROY_RANDOM_SHIP_NOW:
     MOV AX , [SI]
     MOV CX , SHIP_SIZE
     MOV BYTE PTR [DI], 0
     CMP AX ,1
     JZ THE_RANDOM_SHIP_IS_VERTICAL
    
 THE_RANDOM_SHIP_IS_HORIZONTAL: 
     MOV DX , DS:[BP]      ;DX ---> X OF THE SHIP
     MOV AX , DS:[BP+2]    ;AX ---> Y OF THE SHIP
     LOOP_ON_THE_HSHIP_CELLS:
     MOV [BX] , DX
     MOV [BX + 2], AX
     INC DX
     ADD BX , 4
     DEC CX
     JNZ LOOP_ON_THE_HSHIP_CELLS
     JMP RANDOM_SHIP_DESTROYED

 THE_RANDOM_SHIP_IS_VERTICAL:
     MOV DX , DS:[BP]      ;DX ---> X OF THE SHIP
     MOV AX , DS:[BP+2]    ;AX ---> Y OF THE SHIP
     LOOP_ON_THE_VSHIP_CELLS:
     MOV [BX] , DX
     MOV [BX + 2], AX
     INC AX
     ADD BX , 4
     DEC CX
     JNZ LOOP_ON_THE_VSHIP_CELLS
     
     RANDOM_SHIP_DESTROYED:
     RET
     
 ACTIVATE_DESTROY_RANDOM_POWER_UP_    ENDP
;--------------------------------------;
DRAW_POWER_UPS_  PROC    NEAR
    ; PARAMETERS: AL = PLAYER_NUMBER
    ; DRAW THE EMPTY CARDS
    DRAW_POWER_UPS_CARDS    AL
    CMP AL, 1
    JNZ DRAW_P2_POWER_UPS
    MOV BX, OFFSET P1_IS_USED
    JMP START_DRAWING_EMPTY_CARDS
    DRAW_P2_POWER_UPS:
    MOV BX, OFFSET P2_IS_USED
    
    START_DRAWING_EMPTY_CARDS:
    MOV CL, 1   ; POWER UP INDEX
    MOV DL, 1   ; POSIION INDEX
    DRAW_ALL_POWER_UPS:
        CMP BYTE PTR [BX], 1
        JZ NEXT_POWER_UP
        DRAW_POWER_UP_GRAPHICS  CL, DL
        INC DL
        NEXT_POWER_UP:
        INC BX
        INC CL
        CMP CL, 4
    JNZ DRAW_ALL_POWER_UPS     
    RET
DRAW_POWER_UPS_ ENDP
;-------------------------------------;

DRAW_POWER_UP_GRAPHICS_     PROC    NEAR
    ; PARAMETERS
    ; AH = POWER UP INDEX, AL = POSITION INDEX
    GET_POWER_UP_GRAPHICS_POSITION  AL
    CMP AH, 1
    JZ DESTROY_SHIP_POWER_UP
    CMP AH, 2
    JZ ATTACK_TWICE_POWER_UP
    DRAW_REVERSED_ATTACK_POWER_UP   
    JMP POWER_UP_DRAWN
    DESTROY_SHIP_POWER_UP:
        DRAW_DESTROY_SHIP_POWER_UP 
        JMP POWER_UP_DRAWN
    ATTACK_TWICE_POWER_UP:
        DRAW_ATTACK_TWICE_POWER_UP 
    POWER_UP_DRAWN:
    RET
DRAW_POWER_UP_GRAPHICS_     ENDP    
;-------------------------------------;

GET_POWER_UP_GRAPHICS_POSITION_  PROC    NEAR
    ; PARAMETERS
    ; AL = POSITION INDEX
    ; RETURNS THE POSITION IN PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y
    MOV PIXELS1_X, POWER_UPS_CARD1_X1
    MOV PIXELS2_X, POWER_UPS_CARD1_X2

    CMP AL, 1
    JZ CARD1
        
    CMP AL, 2
    JZ CARD2

    MOV PIXELS1_Y, POWER_UPS_CARD3_Y1
    MOV PIXELS2_Y, POWER_UPS_CARD3_Y2
    JMP ADD_MARGIN
    
    CARD1:
    MOV PIXELS1_Y, POWER_UPS_CARD1_Y1
    MOV PIXELS2_Y, POWER_UPS_CARD1_Y2
    JMP ADD_MARGIN
    
    CARD2:
    MOV PIXELS1_Y, POWER_UPS_CARD2_Y1
    MOV PIXELS2_Y, POWER_UPS_CARD2_Y2
    
    ADD_MARGIN:
    ; MARGIN
    MOV AX, 28
    ADD PIXELS1_X, AX
    ADD PIXELS1_Y, AX
    SUB PIXELS2_X, AX
    SUB PIXELS2_Y, AX
    RET
GET_POWER_UP_GRAPHICS_POSITION_  ENDP
;-------------------------------------;

DRAW_REVERSED_ATTACK_POWER_UP_    PROC    NEAR
    ; DRAW ARROW 1
    MOV CX, PIXELS1_X
    ADD CX, 2
    MOV DX, PIXELS1_Y
    ADD DX, 20
    MOV BX, 0
    MOV AH, 0CH
    MOV AL, BLACK
    ARROW1_TIP1:
        INT 10H
        DEC DX
        INT 10H
        INC CX
        INC BX
        CMP BX, 5
    JNZ ARROW1_TIP1
    MOV BX, 0
    MOV CX, PIXELS1_X
    ADD CX, 2
    MOV DX, PIXELS1_Y
    ADD DX, 20
    ARROW1_TIP2:
        INT 10H
        DEC DX
        INT 10H
        ADD DX, 2
        INC CX
        INC BX
        CMP BX, 5
    JNZ ARROW1_TIP2
    MOV CX, PIXELS1_X
    ADD CX, 2
    MOV DX, PIXELS1_Y
    ADD DX, 20
    ARROW1_BODY:
        INT 10H
        DEC DX
        INT 10H
        INC DX
        INC CX
        CMP CX, PIXELS2_X
    JNZ ARROW1_BODY

    ; DRAW ARROW 2
    MOV CX, PIXELS2_X
    MOV DX, PIXELS2_Y
    SUB DX, 20
    MOV BX, 0
    ARROW2_TIP1:
        INT 10H
        DEC DX
        INT 10H
        DEC CX
        INC BX
        CMP BX, 5
    JNZ ARROW2_TIP1
    MOV BX, 0
    MOV CX, PIXELS2_X
    MOV DX, PIXELS2_Y
    SUB DX, 20
    ARROW2_TIP2:
        INT 10H
        DEC DX
        INT 10H
        ADD DX, 2
        DEC CX
        INC BX
        CMP BX, 5
    JNZ ARROW2_TIP2
    MOV CX, PIXELS1_X
    ADD CX, 2
    MOV DX, PIXELS2_Y
    SUB DX, 20
    ARROW2_BODY:
        INT 10H
        DEC DX
        INT 10H
        INC DX
        INC CX
        CMP CX, PIXELS2_X
    JNZ ARROW2_BODY

    ; DRAW WALL
    MOV CX, PIXELS1_X
    MOV DX, PIXELS1_Y
    DRAW_WALL:
        INT 10H
        DEC CX
        INT 10H
        INC CX
        INC DX
        CMP DX, PIXELS2_Y
    JNZ DRAW_WALL
    RET
DRAW_REVERSED_ATTACK_POWER_UP_    ENDP
;-------------------------------------;

DRAW_ATTACK_TWICE_POWER_UP_   PROC    NEAR
    MOV AX, PIXELS2_Y
    SUB AX, PIXELS1_Y
    MOV BL, 2
    DIV BL
    MOV AH, 0
    ADD AX, PIXELS1_Y
    MOV TEMP, AX       ; NOW TEMP = MIDDLE Y

    ; DRAW A 2
    ; DRAW 3 HORIZONTAL LINES
    DRAW_RECTANGLE  PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, BLACK
    DRAW_RECTANGLE  PIXELS1_X, TEMP, PIXELS2_X, TEMP, BLACK
    DRAW_RECTANGLE  PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, BLACK
    ; DRAW 2 VERTICAL LINES
    DRAW_RECTANGLE  PIXELS2_X, PIXELS1_Y, PIXELS2_X, TEMP, BLACK
    DRAW_RECTANGLE  PIXELS1_X, TEMP, PIXELS1_X, PIXELS2_Y, BLACK

    ; MAKE IT BOLD
    INC PIXELS1_X
    DEC PIXELS2_X
    INC PIXELS1_Y
    DEC PIXELS2_Y
    INC TEMP
    ; DRAW 3 HORIZONTAL LINES
    DRAW_RECTANGLE  PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, BLACK
    DRAW_RECTANGLE  PIXELS1_X, TEMP, PIXELS2_X, TEMP, BLACK
    DRAW_RECTANGLE  PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, BLACK
    ; DRAW 2 VERTICAL LINES
    DRAW_RECTANGLE  PIXELS2_X, PIXELS1_Y, PIXELS2_X, TEMP, BLACK
    DRAW_RECTANGLE  PIXELS1_X, TEMP, PIXELS1_X, PIXELS2_Y, BLACK
    RET
DRAW_ATTACK_TWICE_POWER_UP_   ENDP
;-------------------------------------;

DRAW_DESTROY_SHIP_POWER_UP_    PROC    NEAR
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, LIGHT_GRAY

    ; DRAW_ITS_BORDERS
    DEC PIXELS1_X
    DEC PIXELS1_Y
    INC PIXELS2_X
    INC PIXELS2_Y

    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, BLACK        ;NOW THE FUNCTION DRAW LINES NOT RECTANGLES
    DRAW_RECTANGLE PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, BLACK 
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS1_X, PIXELS2_Y, BLACK 
    DRAW_RECTANGLE PIXELS2_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, BLACK
      
    ; DRAW_ITS_BORDERS
    DEC PIXELS1_X
    DEC PIXELS1_Y
    INC PIXELS2_X
    INC PIXELS2_Y

    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, BLACK        ;NOW THE FUNCTION DRAW LINES NOT RECTANGLES
    DRAW_RECTANGLE PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, BLACK 
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS1_X, PIXELS2_Y, BLACK 
    DRAW_RECTANGLE PIXELS2_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, BLACK 
  
    ; DRAW 2 XS
    ; RESET THE CORNERS COORDINATES AND ADD MARGIN
    ADD PIXELS1_X, 6
    ADD PIXELS1_Y, 6
    SUB PIXELS2_X, 6
    SUB PIXELS2_Y, 6
    DEC TEMP
    
    MOV CX, PIXELS1_X
    MOV DX, PIXELS1_Y
    MOV AL, RED
    MOV AH, 0CH
    DRAW_X_PT1:
        INT 10H
        ADD DX, 45
        INT 10H
        SUB DX, 45
        DEC DX
        INT 10H
        ADD DX, 45
        INT 10H
        SUB DX, 45
        ADD DX, 2
        INC CX
        CMP CX, PIXELS2_X
    JNZ DRAW_X_PT1
    
    MOV CX, PIXELS1_X
    MOV DX, PIXELS2_Y
    DRAW_X_PT2:
        INT 10H
        SUB DX, 45
        INT 10H
        ADD DX, 45
        DEC DX
        INT 10H
        SUB DX, 45
        INT 10H
        ADD DX, 45
        INC CX
        CMP CX, PIXELS2_X
    JNZ DRAW_X_PT2
    
    RET    
DRAW_DESTROY_SHIP_POWER_UP_    ENDP
;-------------------------------------;

DRAW_POWER_UPS_CARDS_    PROC    NEAR
    ; PARAMETERS
    ; AL = PLAYER_NUMBER
    
    CMP AL, 1
    JNZ DRAW_P2_CARDS
    MOV AL, P1_N_AVAILABLE_POWER_UPS
    JMP DRAW_THE_CARD
    DRAW_P2_CARDS:
    MOV AL, P2_N_AVAILABLE_POWER_UPS
    
    DRAW_THE_CARD:
    CMP AL, 0
    JZ DRAW_NO_CARDS
    CMP AL, 1
    JZ DRAW_ONE_CARD
    CMP AL, 2
    JZ DRAW_TWO_CARDS
    CMP AL, 3
    JZ DRAW_THREE_CARDS
    
    DRAW_THREE_CARDS:
    DRAW_RECTANGLE   POWER_UPS_CARD1_X1, POWER_UPS_CARD3_Y1, POWER_UPS_CARD1_X2, POWER_UPS_CARD3_Y2, LIGHT_BLUE
    DRAW_POWER_UP_CARD_BORDER   3 , BLACK 
    
    DRAW_TWO_CARDS:
    DRAW_RECTANGLE   POWER_UPS_CARD1_X1, POWER_UPS_CARD2_Y1, POWER_UPS_CARD1_X2, POWER_UPS_CARD2_Y2, LIGHT_BLUE
    DRAW_POWER_UP_CARD_BORDER   2 , BLACK
    
    DRAW_ONE_CARD:
    DRAW_RECTANGLE   POWER_UPS_CARD1_X1, POWER_UPS_CARD1_Y1, POWER_UPS_CARD1_X2, POWER_UPS_CARD1_Y2, LIGHT_BLUE
    DRAW_POWER_UP_CARD_BORDER   1 , BLACK 
      
    DRAW_NO_CARDS:   
    RET
DRAW_POWER_UPS_CARDS_    ENDP
;-------------------------------------;

DRAW_POWER_UP_CARD_BORDER_   PROC    NEAR
    ; PARAMETERS
    ; AH = POSITION_INDEX
    ; AL = COLOR
    
    ; X IS THE SAME FOR ALL CARDS
    MOV POWER_UPS_CARD_X1, POWER_UPS_CARD1_X1
    MOV POWER_UPS_CARD_X2, POWER_UPS_CARD1_X2
    
    CMP AH, 1
    JZ SET_CARD1_CORNERS
    CMP AH, 2
    JZ SET_CARD2_CORNERS
    ; SET CARD 3 CORNERS
    MOV POWER_UPS_CARD_Y1, POWER_UPS_CARD3_Y1
    MOV POWER_UPS_CARD_Y2, POWER_UPS_CARD3_Y2
    JMP DRAW_CARD_BORDERS
    SET_CARD1_CORNERS:
        MOV POWER_UPS_CARD_Y1, POWER_UPS_CARD1_Y1
        MOV POWER_UPS_CARD_Y2, POWER_UPS_CARD1_Y2
        JMP DRAW_CARD_BORDERS
    SET_CARD2_CORNERS:
        MOV POWER_UPS_CARD_Y1, POWER_UPS_CARD2_Y1
        MOV POWER_UPS_CARD_Y2, POWER_UPS_CARD2_Y2
        
    DRAW_CARD_BORDERS:
        ; DRAW BORDERS
        DEC POWER_UPS_CARD_X1
        DEC POWER_UPS_CARD_Y1
        INC POWER_UPS_CARD_X2
        INC POWER_UPS_CARD_Y2
        DRAW_RECTANGLE  POWER_UPS_CARD_X1, POWER_UPS_CARD_Y1, POWER_UPS_CARD_X2, POWER_UPS_CARD_Y1, AL
        DRAW_RECTANGLE  POWER_UPS_CARD_X1, POWER_UPS_CARD_Y2, POWER_UPS_CARD_X2, POWER_UPS_CARD_Y2, AL
        DRAW_RECTANGLE  POWER_UPS_CARD_X1, POWER_UPS_CARD_Y1, POWER_UPS_CARD_X1, POWER_UPS_CARD_Y2, AL
        DRAW_RECTANGLE  POWER_UPS_CARD_X2, POWER_UPS_CARD_Y1, POWER_UPS_CARD_X2, POWER_UPS_CARD_Y2, AL
        
        DEC POWER_UPS_CARD_X1
        DEC POWER_UPS_CARD_Y1
        INC POWER_UPS_CARD_X2
        INC POWER_UPS_CARD_Y2
        DRAW_RECTANGLE  POWER_UPS_CARD_X1, POWER_UPS_CARD_Y1, POWER_UPS_CARD_X2, POWER_UPS_CARD_Y1, AL
        DRAW_RECTANGLE  POWER_UPS_CARD_X1, POWER_UPS_CARD_Y2, POWER_UPS_CARD_X2, POWER_UPS_CARD_Y2, AL
        DRAW_RECTANGLE  POWER_UPS_CARD_X1, POWER_UPS_CARD_Y1, POWER_UPS_CARD_X1, POWER_UPS_CARD_Y2, AL
        DRAW_RECTANGLE  POWER_UPS_CARD_X2, POWER_UPS_CARD_Y1, POWER_UPS_CARD_X2, POWER_UPS_CARD_Y2, AL
    RET
DRAW_POWER_UP_CARD_BORDER_   ENDP
;-------------------------------------;

IS_CELL_ON_GRID_   PROC    NEAR
    CMP ATTACKY, 0
    JL NOT_ON_GRID
    MOV AX, GRID_CELLS_MAX_COORDINATE
    CMP ATTACKY, AX
    JA NOT_ON_GRID
    MOV IS_ON_GRID, 1
    JMP DETERMINED
    
    NOT_ON_GRID:
    MOV IS_ON_GRID, 0
    DETERMINED:
    RET

IS_CELL_ON_GRID_   ENDP
;-------------------------------------;

PLACE_SHIPS_ON_GRID_     PROC    NEAR
    ; PARAMETERS
    ; AL = PLAYER NUMBER (1 OR 2)
    DRAW_SELECTION_SHIPS AL
    MOV SELECTED_PLAYER_SHIPS,AL
    MOV CX, 0
    CMP AL, 1
    JNZ PLAYER2_PLACE_SHIPS
    ; PLAYER 1 PLACE SHIPS:
    MOV BX, OFFSET P1_SHIPS_POINTS
    MOV DI, OFFSET P1_SHIPS_SIZES
    MOV SI, OFFSET P1_SHIPS_IS_VERTICAL
    JMP DISPLAY_STARTING_MSG
    
    PLAYER2_PLACE_SHIPS:
    MOV BX, OFFSET P2_SHIPS_POINTS
    MOV DI, OFFSET P2_SHIPS_SIZES
    MOV SI, OFFSET P2_SHIPS_IS_VERTICAL 
    
    DISPLAY_STARTING_MSG:
    PUSH AX
    PRINT_NOTIFICATION_MESSAGE  START_PLACING_SHIPS_MSG, 1
    WAIT_FOR_ENTER_TO_START_PLACING_SHIPS:
        MOV AH, 0
        INT 16H
        CMP AH,EXIT_SCANCODE
        JE PRE_EXIT_SCREEN
        CMP AH,EXIT_SCANCODE
        JE PRE_EXIT_SCREEN
        CMP AH, ENTER_SCANCODE
        JNZ WAIT_FOR_ENTER_TO_START_PLACING_SHIPS
    POP AX

    MOV AH, 0
    PUSH AX ; TO STORE THE PLAYER NUMBER
    PLACE_SHIP:   
        ; HIGHLIGHT THE SHIP TO BE PLACED
        DRAW_SELECTION_SHIP CX, [DI], RED
        
        CELLS_SELECTOR [DI]
        MOV AX, SELECTOR_GRID_X1
        CMP AX, SELECTOR_GRID_X2
        JZ SET_VERTICAL_SHIP
        ; IF HORIZONTAL:
        MOV WORD PTR [SI], 0
        ORDER_CELL_SELECTOR_POINTS 0
        JMP STORE_SHIP_POINTS
        
        ;ELSE IF VERTICAL:
        SET_VERTICAL_SHIP:
        MOV WORD PTR [SI], 1
        ORDER_CELL_SELECTOR_POINTS 1    
        
        STORE_SHIP_POINTS:
        MOV AX, SELECTOR_GRID_X1
        MOV WORD PTR [BX], AX
        ADD BX, 2
        MOV AX, SELECTOR_GRID_Y1
        MOV WORD PTR [BX], AX
        ADD BX, 2
        MOV AX, SELECTOR_GRID_X2
        MOV WORD PTR [BX], AX
        ADD BX, 2
        MOV AX, SELECTOR_GRID_Y2
        MOV WORD PTR [BX], AX
        ADD BX, 2
        
        ; REMOVE THE HIGHLIGHTING
        DRAW_SELECTION_SHIP CX, [DI] , DARK_GRAY
        
        POP AX
        DRAW_ALL_SHIPS_ON_GRID AL
        PUSH AX
        
        ; NEXT SHIP
        ADD DI, 2
        ADD SI,2
        INC CX
        CMP CX, N_SHIPS
    JNZ PLACE_SHIP
    POP AX
    
    PRINT_NOTIFICATION_MESSAGE  ALL_SHIPS_PLACED_MSG, 1
    WAIT_FOR_ENTER_TO_FINISH_PLACING_SHIPS:
        MOV AH, 0
        INT 16H
        CMP AH,EXIT_SCANCODE
        JE PRE_EXIT_SCREEN
        CMP AH, ENTER_SCANCODE
        JNZ WAIT_FOR_ENTER_TO_FINISH_PLACING_SHIPS
     
    RET
PLACE_SHIPS_ON_GRID_     ENDP 
 
;-------------------------------------;

ORDER_CELL_SELECTOR_POINTS_   PROC    NEAR
    ; PARAMETERS
    ; AL = IS_VERTICAL (1 IF VERTICAL)
    CMP AL, 1
    JNZ ORDER_HORIZONTAL_SHIP_POINTS
    MOV AX, SELECTOR_GRID_Y1
    CMP AX, SELECTOR_GRID_Y2
    JB POINTS_ORDERED
    MOV BX, SELECTOR_GRID_Y2
    MOV SELECTOR_GRID_Y1, BX
    MOV SELECTOR_GRID_Y2, AX
    JMP POINTS_ORDERED
    
    ORDER_HORIZONTAL_SHIP_POINTS:
    MOV AX, SELECTOR_GRID_X1
    CMP AX, SELECTOR_GRID_X2
    JB POINTS_ORDERED
    MOV BX, SELECTOR_GRID_X2
    MOV SELECTOR_GRID_X1, BX
    MOV SELECTOR_GRID_X2, AX
    
    POINTS_ORDERED:
    RET
ORDER_CELL_SELECTOR_POINTS_ ENDP
;-------------------------------------;

PIXELS_TO_GRID_    PROC    NEAR
    
   ; 4 PARAMETERS CX:PIXELX , DX:PIXELY , SI:OFFSET GRIDX  , DI:OFFSET GRIDY
    
    SUB CX, GRID_CORNER1_X
    MOV DX, 0
    MOV AX, CX
    DIV GRID_SQUARE_SIZE
    MOV [SI], AX
    
    SUB BX, GRID_CORNER1_Y
    MOV DX, 0
    MOV AX, BX
    DIV GRID_SQUARE_SIZE 
    MOV [DI], AX
    RET

 PIXELS_TO_GRID_ ENDP    
;-------------------------------------; 

GET_ATTACK_COLUMN_  PROC    NEAR
    ; DRAW INITIAL COLUMN SELECTOR
    DRAW_COLUMN_SELECTOR    COLUMN_SELECTOR_MIN_COLUMN, LIGHT_BLUE
    MOV AX, COLUMN_SELECTOR_MIN_COLUMN
    MOV COLUMN_SELECTOR_CURRENT_COLUMN, AX

    ; DISPLAY MESSAGE
    PRINT_NOTIFICATION_MESSAGE  SELECT_ATTACK_COLUMN_MSG, 1

    GET_KEY_PRESSED:
        MOV AH, 0
        INT 16H
        CMP AH,EXIT_SCANCODE
        JE PRE_EXIT_SCREEN
        CMP AH, SPACE_SCANCODE
        JZ SPACE_PRESSED
        CMP AH, RIGHT_SCANCODE
        JZ RIGHT_PRESSED
        CMP AH, LEFT_SCANCODE
        JZ LEFT_PRESSED
        CMP AH, TAB_SCANCODE
        JZ THE_USER_NEEDS_POWER_UP
        JMP GET_KEY_PRESSED
        
        
        THE_USER_NEEDS_POWER_UP:
        CMP IS_ATTACK_TWICE_ACTIVATED , 1
        JZ  IN_SECOND_ATTACK
        POWER_UP_PICKER PLAYER_ATTACKING
        JMP GET_KEY_PRESSED
        
        IN_SECOND_ATTACK:
        PRINT_NOTIFICATION_MESSAGE  IN_SECOND_ATTACK_MSG, 1
        JMP GET_KEY_PRESSED
        
        RIGHT_PRESSED:
            DRAW_COLUMN_SELECTOR COLUMN_SELECTOR_CURRENT_COLUMN, WHITE
            MOV AX, COLUMN_SELECTOR_MAX_COLUMN
            CMP COLUMN_SELECTOR_CURRENT_COLUMN, AX
            JZ REACHED_MAX_COLUMN
            MOV AX, GRID_SQUARE_SIZE
            ADD COLUMN_SELECTOR_CURRENT_COLUMN, AX
            JMP DRAW_CS
            REACHED_MAX_COLUMN:
                MOV AX, COLUMN_SELECTOR_MIN_COLUMN
                MOV COLUMN_SELECTOR_CURRENT_COLUMN, AX
            DRAW_CS:
                DRAW_COLUMN_SELECTOR COLUMN_SELECTOR_CURRENT_COLUMN, LIGHT_BLUE
                JMP GET_KEY_PRESSED
                
        LEFT_PRESSED:
            DRAW_COLUMN_SELECTOR COLUMN_SELECTOR_CURRENT_COLUMN, WHITE
            MOV AX, COLUMN_SELECTOR_MIN_COLUMN
            CMP COLUMN_SELECTOR_CURRENT_COLUMN, AX
            JZ REACHED_MIN_COLUMN
            MOV AX, GRID_SQUARE_SIZE
            SUB COLUMN_SELECTOR_CURRENT_COLUMN, AX
            JMP DRAW_CS_
            REACHED_MIN_COLUMN:
                MOV AX, COLUMN_SELECTOR_MAX_COLUMN
                MOV COLUMN_SELECTOR_CURRENT_COLUMN, AX
            DRAW_CS_:
                DRAW_COLUMN_SELECTOR COLUMN_SELECTOR_CURRENT_COLUMN, LIGHT_BLUE
                JMP GET_KEY_PRESSED
                
        SPACE_PRESSED:
        RET
GET_ATTACK_COLUMN_  ENDP        
;-------------------------------------;

SET_LEVEL_SETTINGS_  PROC   NEAR
    ; PARAMETERS AL: 1 OR 2 (LEVEL)
    ; GRID SQUARE SIZE
    MOV LEVEL, AL
    MOV BL, AL
    MOV AX, GRID_SQUARE_SIZE_MAX
    DIV BL
    MOV AH, 0
    MOV GRID_SQUARE_SIZE, AX
    ; GRID MAX COORDINATE
    MOV AX, GRID_MAX_COORDINATE_MIN
    MUL BL
    MOV GRID_MAX_COORDINATE, AX
    ; GRID CELLS MAX COORDINATE
    MOV AX, GRID_CELLS_MAX_COORDINATE_MIN
    MUL BL
    MOV AH, 0
    MOV GRID_CELLS_MAX_COORDINATE, AX
    CMP BL, 2
    JNZ COLUMN_SELECTOR_MIN_AND_MAX
    INC GRID_CELLS_MAX_COORDINATE
    ; COLUMN SELECTOR MIN AND MAX
    COLUMN_SELECTOR_MIN_AND_MAX:
    MOV AX, GRID_SQUARE_SIZE
    MOV BL, 2
    DIV BL
    MOV CL, AL
    MOV CH, 0
    ADD CX, GRID_CORNER1_X
    MOV COLUMN_SELECTOR_MIN_COLUMN, CX
    MOV AH, 0
    MOV CX, GRID_CORNER2_X
    SUB CX, AX
    MOV COLUMN_SELECTOR_MAX_COLUMN, CX
    RET
SET_LEVEL_SETTINGS_ ENDP
;-------------------------------------;
DRAW_SELECTION_SHIPS_   PROC    NEAR
    ; PARAMETERS AL: 1 OR 2 (PLAYER)
    MOV CX, 0
    CMP AL, 1
    JNZ PLAYER2_SELECTION_SHIPS
    MOV DI, OFFSET P1_SHIPS_SIZES
    JMP DRAW_ALL_SELECTION_SHIPS
    PLAYER2_SELECTION_SHIPS:
    MOV DI, OFFSET P2_SHIPS_SIZES
    DRAW_ALL_SELECTION_SHIPS:
        DRAW_SELECTION_SHIP CX, [DI], DARK_GRAY
        ADD DI, 2
        INC CX
        CMP CX, N_SHIPS
    JNZ DRAW_ALL_SELECTION_SHIPS
    RET
DRAW_SELECTION_SHIPS_   ENDP
;-------------------------------------;

DRAW_SELECTION_SHIP_     PROC    NEAR
    ; PARAMETERS
    ; AX = INDEX, BX = SIZE, CL = BORDER_COLOR
    MOV DX, GRID_MAX_COORDINATE
    SUB DX, BX
    INC DX
    MOV GRID1_X, DX
    MOV DX, GRID_MAX_COORDINATE
    MOV GRID2_X, DX
    MOV GRID1_Y, AX
    MOV GRID2_Y, AX
    MOV DL, CL
    DRAW_SHIP GRID1_X, GRID1_Y, GRID2_X, GRID2_Y, LIGHT_GRAY, DL
    RET
DRAW_SELECTION_SHIP_ ENDP

;-------------------------------------;

DRAW_SHIP_      PROC    NEAR
    ; PARAMETERS
    ; AX = POINT1_X, BX = POINT1_Y, CX = POINT2_X, SI = POINT2_Y, DL = BORDER_COLOR, DH = SHIP_COLOR
    GRID_TO_PIXELS AX, BX, CX, SI
   
    ; MOVE THE SECOND POINT FROM THE UPPER LEFT CORNER TO THE LOWER RIGHT CORNER
    MOV AX, PIXELS2_X
    ADD AX, GRID_SQUARE_SIZE
    MOV PIXELS2_X, AX
    MOV AX, PIXELS2_Y
    ADD AX, GRID_SQUARE_SIZE
    MOV PIXELS2_Y, AX

    ; ADJUST SHIP SIZE (SMALLER THAN GRID)   ; SET MARGIN
    MOV AX, 6
    DIV LEVEL   ; MARGIN = 6 / LEVEL   
    ADD PIXELS1_X, AX
    ADD PIXELS1_Y, AX
    SUB PIXELS2_X, AX
    SUB PIXELS2_Y, AX
    
    ; DRAW THE SHIP
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, DH
    
    ; DRAW SHIP BORDERS
    DEC PIXELS1_X
    DEC PIXELS1_Y
    INC PIXELS2_X
    INC PIXELS2_Y
    
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, DL        ;NOW THE FUNCTION DRAW LINES NOT RECTANGLES
    DRAW_RECTANGLE PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, DL 
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS1_X, PIXELS2_Y, DL 
    DRAW_RECTANGLE PIXELS2_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, DL
    
    ; SECOND LAYER 
    DEC PIXELS1_X
    DEC PIXELS1_Y
    INC PIXELS2_X
    INC PIXELS2_Y
    
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS2_X, PIXELS1_Y, DL        ;NOW THE FUNCTION DRAW LINES NOT RECTANGLES
    DRAW_RECTANGLE PIXELS1_X, PIXELS2_Y, PIXELS2_X, PIXELS2_Y, DL 
    DRAW_RECTANGLE PIXELS1_X, PIXELS1_Y, PIXELS1_X, PIXELS2_Y, DL 
    DRAW_RECTANGLE PIXELS2_X, PIXELS1_Y, PIXELS2_X, PIXELS2_Y, DL 

    
    
    RET
DRAW_SHIP_  ENDP
;-------------------------------------;

GRID_TO_PIXELS_     PROC    NEAR
    ; PARAMETERS
    ; GRID1_X, GRID1_Y, GRID2_X, GRID2_Y
    ; GRID TO PIXELS (UPPER LEFT CORNER)
    
    ; OUTPUT
    ; PIXEL1_X, PIXEL1_Y, PIXEL2_X, PIXEL2_Y
    
    ; PIXEL X = GRID_CORNER1_X + GRID_SQUARE_SIZE * GRID_X
    ; PIXEL Y = GRID_CORNER1_Y + GRID_SQUARE_SIZE * GRID_Y
    
    MOV AX, GRID_SQUARE_SIZE
    MUL GRID1_X
    ADD AX, GRID_CORNER1_X
    MOV PIXELS1_X, AX 

    MOV AX, GRID_SQUARE_SIZE
    MUL GRID1_Y
    ADD AX, GRID_CORNER1_Y
    MOV PIXELS1_Y, AX 

    MOV AX, GRID_SQUARE_SIZE
    MUL GRID2_X
    ADD AX, GRID_CORNER1_X
    MOV PIXELS2_X, AX 

    MOV AX, GRID_SQUARE_SIZE
    MUL GRID2_Y
    ADD AX, GRID_CORNER1_Y
    MOV PIXELS2_Y, AX
    
    RET
GRID_TO_PIXELS_     ENDP
;-------------------------------------;   
;--------- AHMED PROCEDURES ----------;
;-------------------------------------;
DRAW_RECTANGLE_   PROC  NEAR    
    ;PARAMETERS
    ; X1, Y1, X2, Y2, AL = COLOR
    INC X2
    INC Y2  ;TO STOP AT X2 + 1, Y2 + 1
    MOV DX, Y1
    MOV AH, 0CH   ;AH = 0C FOR INT, AL = COLOR
    DRAW_ALL_RECTANGLE_ROWS:
    MOV CX, X1
        DRAW_RECTANGE_ROW:
            INT 10H
            INC CX
            CMP CX, X2
        JNZ DRAW_RECTANGE_ROW
    INC DX
    CMP DX, Y2
    JNZ DRAW_ALL_RECTANGLE_ROWS
    RET
DRAW_RECTANGLE_ ENDP   
;-------------------------------------;    
PRINT_MESSAGE_    PROC NEAR

      MOV AX,1301H
      MOV BX,BP
      MOV CL,[BX]
      MOV CH,00H
      ADD BP,1H
      MOV BX,SI
      INT 10H
      RET

PRINT_MESSAGE_    ENDP
;-------------------------------------;
GET_USER_NAME_     PROC NEAR
     PRINT_MESSAGE PLEASE_ENTER_YOUR_NAME_MSG , 1025H , 0FF0FH
     PRINT_MESSAGE PRESS_ENTER_MSG , 1425H , 0FF0FH
     
     CMP SI,1H
     JNZ PLAYER2
     PRINT_MESSAGE PLAYER1_MSG ,0C2EH , 0FF28H
     JMP START_WRITING_HERE
PLAYER2:
     PRINT_MESSAGE PLAYER2_MSG ,0C2EH , 0FF28H
     
START_WRITING_HERE:  
     DRAW_RECTANGLE  368,280,450,305,BLACK        
     MOV AH,02H             ;MOVE THE CURSOR
     MOV DX,122FH
     INT 10H

     MOV AH,0AH            ;GET THE USER INPUT AND STORE IT IN USERNAME1 OR USERNAME2(SENT PARAMETER)
     MOV DX,DI
     INT 21H
     MOV BL,[DI+2]
     CMP BL,'A'
     JB START_WRITING_HERE
     CMP BL,'Z'
     JBE GET_USERNAME_SUCCESSFULLY
     CMP BL,'a'
     JB START_WRITING_HERE
     CMP BL,'z'
     JA START_WRITING_HERE
     
 
     GET_USERNAME_SUCCESSFULLY:    
     RET     
 GET_USER_NAME_     ENDP
;-------------------------------------;
USER_NAMES_     PROC NEAR
    
     GET_USER_NAME 1H,P1_USERNAME
     CLEAR_GAME_SCREEN  BLACK 
     GET_USER_NAME 2H,P2_USERNAME
     CLEAR_GAME_SCREEN  BLACK
     
     RET 
USER_NAMES_     ENDP
;-------------------------------------;
MAIN_MENU_     PROC NEAR

        PRINT_MESSAGE TO_START_GAME_MSG , 1025H , 0FF0FH
        PRINT_MESSAGE TO_END_PROG_MSG , 1425H , 0FF0FH
  NOTVALID:          
        MOV AH,0
        INT 16H
        CMP AH,F2_SCANCODE
        JZ CONT2
  NOTF2:                 
        CMP AH,EXIT_SCANCODE
        JZ THE_END
        JNZ NOTVALID            
  CONT2:       
  CLEAR_GAME_SCREEN BLACK 
  DRAW_NOTIFICATION_BAR
  PRINT_NOTIFICATION_MESSAGE END_GAME_MSG, 2
     RET 

        HLT
     
MAIN_MENU_     ENDP
;-------------------------------------;
INITIALIZE_PROGRAM_     PROC NEAR

        MOV AX,4F02H           ;GO TO VIDEOMODE 800*600
        MOV BX,103H
        INT 10H

     RET 
INITIALIZE_PROGRAM_     ENDP
;-------------------------------------;
GET_LEVEL_     PROC NEAR
 PRINT_MESSAGE ENTER_LEVEL_MSG , 1025H , 0FF0FH
 PRINT_MESSAGE MSG_DASH , 122EH , 0FF0FH
 PRINT_MESSAGE MSG_1 , 122FH , 0FF0FH
 PRINT_MESSAGE MSG_2 , 123AH , 0FF0FH
 PRINT_NOTIFICATION_MESSAGE CHOOSE_LEVEL_MSG, 1
  NOTVALID2:
        
        MOV AH,0
        INT 16H
        CMP AH,EXIT_SCANCODE
        JE PRE_EXIT_SCREEN
        CMP AH , RIGHT_SCANCODE
        JZ MOVE_THE_DASH_TO_RIGHT
        CMP AH , LEFT_SCANCODE
        JZ MOVE_THE_DASH_TO_LEFT
        ;CMP AH , EXIT_SCANCODE
        ;JZ THE_USER_PRESS_ESC_INSIDE_LEVEL_SELECTION
        CMP AH , ENTER_SCANCODE
        JZ THE_LEVEL_IS_KNOWN_NOW
        JNZ NOTVALID2

       
    MOVE_THE_DASH_TO_RIGHT:
    DRAW_RECTANGLE  368,292,375,297,BLACK
    PRINT_MESSAGE MSG_DASH , 1239H , 0FF0FH
    MOV DL ,2
    MOV LEVEL , DL
    JMP NOTVALID2
    
    MOVE_THE_DASH_TO_LEFT:
     DRAW_RECTANGLE  455,292,464,297,BLACK
    PRINT_MESSAGE MSG_DASH , 122EH , 0FF0FH
    MOV DL ,1
    MOV LEVEL , DL
    JMP NOTVALID2
    
    THE_LEVEL_IS_KNOWN_NOW:
    CMP LEVEL , 1
    JNZ SET_LEVEL2
        
  SET_LEVEL1:
        SET_LEVEL_SETTINGS 1
        JMP BACK
  SET_LEVEL2:
        SET_LEVEL_SETTINGS 2
        JMP BACK
 
   BACK:
   RET
GET_LEVEL_     ENDP
;-------------------------------------;

DRAW_ALL_SHIPS_ON_GRID_   PROC    NEAR
    
    ;PARAMETERS AL: 1 OR 2 (PLAYER)
    MOV CX,0
    CMP AL, 1
    JNZ PLAYER2_ALL_SHIPS
    MOV SI, OFFSET P1_SHIPS_POINTS
    MOV DI, OFFSET P1_SHIPS_REMAINING_CELLS
    JMP DRAW_ALL_SHIPS
    
    PLAYER2_ALL_SHIPS:  
        MOV SI, OFFSET P2_SHIPS_POINTS
        MOV DI, OFFSET P2_SHIPS_REMAINING_CELLS    
        DRAW_ALL_SHIPS:
            MOV AL,BYTE PTR[DI]
            AND AL, AL
            JNZ NOT_DESTROYED_SHIP
            
            MOV AL , BLACK
            MOV VARIABLE_COLOR , AL
            JMP COMPLETE_DRAWING_SHIPS
            
            NOT_DESTROYED_SHIP:
            MOV AL , LIGHT_GRAY
            MOV VARIABLE_COLOR , AL
            
            COMPLETE_DRAWING_SHIPS:
            MOV DX, WORD PTR [SI]
            MOV GRID1_X, DX
            MOV DX, WORD PTR [SI + 2]
            MOV GRID1_Y, DX
            MOV DX, WORD PTR [SI + 4]
            MOV GRID2_X, DX
            MOV DX, WORD PTR [SI + 6]
            MOV GRID2_Y, DX
            DRAW_SHIP GRID1_X, GRID1_Y, GRID2_X, GRID2_Y, VARIABLE_COLOR , DARK_GRAY
            ADD SI, 8
            INC DI
            INC CX
            CMP CX, N_SHIPS
            JNZ DRAW_ALL_SHIPS
    RET
    
    DRAW_ALL_SHIPS_ON_GRID_   ENDP
;-------------------------------------;
DRAW_X_SIGN_   PROC    NEAR

     GRID_TO_PIXELS GRID1_X, GRID1_Y, GRID1_X, GRID1_Y 
      
    ; MOVE THE SECOND POINT FROM THE UPPER LEFT CORNER TO THE UPPER RIGHT CORNER
    MOV AX, PIXELS2_X
    ADD AX, GRID_SQUARE_SIZE
    MOV PIXELS2_X, AX
    
    ; GET LOWER Y TO CHECK THE END OF X-SIGN
    MOV BP, PIXELS2_Y
    ADD BP, GRID_SQUARE_SIZE

    ; ADJUST SHIP SIZE (SMALLER THAN GRID)   ; SET MARGIN
    MOV AX, 5
    ADD PIXELS1_X, AX
    ADD PIXELS1_Y, AX
    SUB PIXELS2_X, AX
    ADD PIXELS2_Y, AX                ;POINT 2 IS THE UPPER RIGHT CORNER
    SUB BP,AX                        ;BP HAS THE LOWER Y
    
 
    MOV SI,PIXELS2_X        ;THE UPPER RIGHT CORNER COORDINATES
    MOV DI,PIXELS2_Y  
    
    MOV AH,0CH 
    MOV CX,PIXELS1_X        ;THE UPPER LEFT CORNER COORDINATES
    MOV DX,PIXELS1_Y  
    
    MOV AL,VARIABLE_COLOR
    MOV BX,00               ;I WILL NEED IT TO CHECK THE NEXT ITERATION IS ODD OR EVEN 
    NEXT_TWO_PIXELS: 
         
         INT 10H           ;DRAW EACH PIXEL 3 TIMES TO MAKE THE IT BOLD ( MORE OBVIOUS )
         INC CX
         INT 10H
         SUB CX,2
         INT 10H
         INC CX
         
         EVENORODD  BX                   ;AT EVEN ITERATIONS I DRAW \ SO INC CX
         CMP IS_EVEN,0                    ;AT ODD ITERATIONS I DRAW / SO DEC CX
         JNE IF_ODD
         IF_EVEN: 
             INC CX
             JMP DONE
             IF_ODD:  
                 DEC CX 
         DONE:
         INC DX
         XCHG CX , SI
         XCHG DX , DI
         INC BX
         CMP DX, BP
         JNZ NEXT_TWO_PIXELS
         
         RET

 DRAW_X_SIGN_   ENDP
;-----------------------------------------; 
DRAW_ALL_X_SIGNS_   PROC    NEAR
    
    ;PARAMETERS AL: 1 OR 2 (PLAYER)
    CMP AL, 1
    JNZ PLAYER2_ALL_ATTACKS
    MOV SI, OFFSET P1_ATTACKS_ONTARGET 
    MOV DI, OFFSET P1_ATTACKS_MISSED 
    MOV CX, P1_ATTACKS_ONTARGET_NUM 
    MOV DX, P1_ATTACKS_MISSED_NUM    
    JMP DRAW_ALL_ATTACKS
    
    PLAYER2_ALL_ATTACKS:  
         MOV SI, OFFSET P2_ATTACKS_ONTARGET 
         MOV DI, OFFSET P2_ATTACKS_MISSED
         MOV CX, P2_ATTACKS_ONTARGET_NUM 
         MOV DX, P2_ATTACKS_MISSED_NUM  
         
        DRAW_ALL_ATTACKS:
            ONTARGET_ATTACKS:
               CMP CX,0
               JZ MISSED_ATTACKS
               MOV AX,[SI]
               MOV GRID1_X,AX
               MOV AX,[SI + 2]
               MOV GRID1_Y,AX
               DRAW_X_SIGN GRID1_X, GRID1_Y, 0CH
               ADD SI,4
               DEC CX
               JMP ONTARGET_ATTACKS
               
               
            MISSED_ATTACKS: 
               CMP DX,0
               JZ ALL_DRAWN
               MOV AX,[DI]
               MOV GRID1_X,AX
               MOV AX,[DI + 2]
               MOV GRID1_Y,AX
               DRAW_X_SIGN GRID1_X, GRID1_Y, 00H
               ADD DI,4
               DEC DX
               JMP MISSED_ATTACKS
      ALL_DRAWN:         
        
     RET
           
DRAW_ALL_X_SIGNS_   ENDP
;-------------------------------------; 
DRAW_ALL_DESTROYED_SHIPS_  PROC NEAR
   
   ;PARAMETERS AL: 1 OR 2 (PLAYER)
    MOV CX,0
    CMP AL, 1
    JNZ PLAYER2_DESTROYED_SHIPS
    MOV SI, OFFSET P1_SHIPS_POINTS
    MOV DI, OFFSET P1_SHIPS_REMAINING_CELLS
    JMP DRAW_DESTROYED_SHIPS
    
    PLAYER2_DESTROYED_SHIPS:  
        MOV SI, OFFSET P2_SHIPS_POINTS
        MOV DI, OFFSET P2_SHIPS_REMAINING_CELLS
            
        DRAW_DESTROYED_SHIPS:
            MOV BL, BYTE PTR [DI]                     ;CHECK IF THE SHIP WAS DESTROYED AT FIRST
            AND BL, BL
            JNZ NEXT_DESTROYED_SHIP
            MOV DX, WORD PTR [SI]
            MOV GRID1_X, DX
            MOV DX, WORD PTR [SI + 2]
            MOV GRID1_Y, DX
            MOV DX, WORD PTR [SI + 4]
            MOV GRID2_X, DX
            MOV DX, WORD PTR [SI + 6]
            MOV GRID2_Y, DX
            DRAW_SHIP GRID1_X, GRID1_Y, GRID2_X, GRID2_Y, BLACK ,BLACK
            
            NEXT_DESTROYED_SHIP:
            ADD SI, 8
            INC DI
            INC CX
            CMP CX, N_SHIPS
            JNZ DRAW_DESTROYED_SHIPS
    RET

DRAW_ALL_DESTROYED_SHIPS_  ENDP
;-------------------------------------; 
;SCORES_SCENE_ PROC NEAR
    
   ; CLEAR_GAME_SCREEN BLACK                        
    ;PLAYER 1 SCORE
    ; PRINT_MESSAGE P1_USERNAME+1,1218H,0FH  
    
    ; MOV DL,18H
    ; MOV DH,12H ;Y
    ; ADD DL,P1_USERNAME+1  ;X
    ; PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH   

    ;PLAYER 2 SCORE
    ;PRINT_MESSAGE P2_USERNAME+1,1233H,0FH
    
    ;MOV DH,12H ;Y
    ;MOV DL,33H
    ;ADD DL,P2_USERNAME+1  ;X
    ;PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH  
    
    ;PRINT_PLAYER1_SCORE 18H, 12H
    ;PRINT_PLAYER2_SCORE 33H, 12H
    
    
    ;PRINT_MESSAGE PRESS_ENTER_MAIN_MENU_MSG ,141AH ,0FH  
    ;ENTER_AT_SCORE_SCENE:
    ; MOV AH,0
       ; INT 16H
       ; CMP AH,ENTER_SCANCODE
       ; JNZ ENTER_AT_SCORE_SCENE
       
       ;RET
    
       ;SCORES_SCENE_ ENDP
;-----------------------------------------;

 CELL_HAS_SHIP_   PROC    NEAR
   
    MOV CX,0
    CMP AL, 1
    JNZ CHECK_PLAYER2_SHIPS
    MOV SI, OFFSET P1_SHIPS_POINTS
    MOV DI, OFFSET P1_SHIPS_IS_VERTICAL  
    JMP CHECK_ALL_SHIPS
    
    CHECK_PLAYER2_SHIPS:
           MOV SI, OFFSET P2_SHIPS_POINTS
           MOV DI, OFFSET P2_SHIPS_IS_VERTICAL 
           CHECK_ALL_SHIPS:
                
                CHECK_SHIP:
                MOV BX, [DI]              
                CMP BX ,1                 
                JNZ HORIZONTAL_SHIP        
                
                MOV  AX, GRID1_X
                CMP  AX ,  WORD PTR[SI]
                JNZ  EDIT_AND_CHECK_AGAIN  
                MOV  AX, GRID1_Y
                CMP  AX , WORD PTR[SI + 2]                       
                JB EDIT_AND_CHECK_AGAIN
                CMP  AX , WORD PTR[SI + 6] 
                JA  EDIT_AND_CHECK_AGAIN
                JBE THE_ATTACK_WAS_ON_TARGET
             
                
                
                HORIZONTAL_SHIP:  
                MOV  AX, GRID1_Y
                CMP  AX ,  WORD PTR[SI + 2]
                JNZ  EDIT_AND_CHECK_AGAIN  
                MOV  AX, GRID1_X      
                CMP AX , WORD PTR[SI]                      
                JB EDIT_AND_CHECK_AGAIN
                CMP AX , WORD PTR[SI + 4]
                JA  EDIT_AND_CHECK_AGAIN
                JBE THE_ATTACK_WAS_ON_TARGET
              
                
                THE_ATTACK_WAS_ON_TARGET:
                MOV IS_ONTARGET,1
                MOV SHIP_INDEX , CL
                RET
                
                EDIT_AND_CHECK_AGAIN:
                ADD SI ,8
                ADD DI,2
                INC CX
                CMP CX ,N_SHIPS
                JNZ CHECK_SHIP
                MOV IS_ONTARGET,0
                RET  

                    
  CELL_HAS_SHIP_   ENDP
;-------------------------------------; 
IS_CELL_ATTACKED_BEFORE_  PROC NEAR
    
   ;PARAMETERS AL: 1 OR 2 (PLAYER)
    MOV BX,0
    CMP AL, 1
    JNZ CHECK_PLAYER2_ALL_ATTACKS
    MOV SI, OFFSET P1_ATTACKS_ONTARGET 
    MOV DI, OFFSET P1_ATTACKS_MISSED 
    MOV CX, P1_ATTACKS_ONTARGET_NUM 
    MOV DX, P1_ATTACKS_MISSED_NUM    
    JMP CHECK_ALL_ATTACKS
    
    CHECK_PLAYER2_ALL_ATTACKS:  
         MOV SI, OFFSET P2_ATTACKS_ONTARGET 
         MOV DI, OFFSET P2_ATTACKS_MISSED
         MOV CX, P2_ATTACKS_ONTARGET_NUM 
         MOV DX, P2_ATTACKS_MISSED_NUM 
         
         CHECK_ALL_ATTACKS:
               CMP CX ,0
               JZ CHECK_MISSED_ATTACKS
               MOV AX, [SI]
               CMP AX,ATTACKX                       
               JNZ CHECK_NEXT_ATTACK1
               MOV AX, [SI + 2]
               CMP AX,ATTACKY
               JNZ CHECK_NEXT_ATTACK1
               MOV IS_ATTACKED_BEFORE,1
               RET      
               CHECK_NEXT_ATTACK1:  
                   ADD SI,4
                   DEC CX 
                   JMP CHECK_ALL_ATTACKS
        
          CHECK_MISSED_ATTACKS:     
               MOV SI,DI
               MOV CX,DX
               INC BX
               CMP BX,2                   ;AX IS USED TO REPEAT THE OPERATION TWICE (ONE FOR MISSED AND ONE FOR ONYARGET)
               JNZ CHECK_ALL_ATTACKS
              
          
                
               MOV IS_ATTACKED_BEFORE,0
               RET      
           

IS_CELL_ATTACKED_BEFORE_   ENDP
;-------------------------------------; 
GET_CELL_FROM_PLAYER_  PROC NEAR
         
         GET_ATTACK_COLUMN                ;IT MODIFY COLUMN_SELECTOR_CURRENT_COLUMN
         PRINT_NOTIFICATION_MESSAGE  FIRE_SLIDER_MSG, 1
         DRAW_SLIDER_BAR
         FIRE_SLIDER                      ;IT MODIFY  SLIDER_CURRENT_ROW
         PIXELS_TO_GRID COLUMN_SELECTOR_CURRENT_COLUMN , SLIDER_CURRENT_ROW , ATTACKX , ATTACKY
         MOV AX , ATTACKX
         MOV [SI] , AX
         MOV BX , ATTACKY
         MOV [DI] , BX
         RET
GET_CELL_FROM_PLAYER_   ENDP
;-------------------------------------;
 
EVENORODD_  PROC NEAR
    ; PARAMETERS
    ; BX = NUMBER
    MOV AX,BX
    MOV DL,2
    DIV DL
    MOV IS_EVEN,AH
    RET                  
EVENORODD_   ENDP
;-----------------------------------------;
CHECK_CELL_AND_UPDATE_ATTACKS_DATA_  PROC NEAR

    CMP IS_REVERSE_ATTACK_ACTIVATED , 1
    JNZ NO_REVERSE_ATTACK
    CMP IS_REVERSE_COUNT , 1
    JNZ NO_REVERSE_ATTACK
    
    MOV AL , PLAYER_ATTACKED     ;REVERSE THE ATTACK
    MOV BL , PLAYER_ATTACKING
    MOV PLAYER_ATTACKED  , BL
    MOV PLAYER_ATTACKING , AL  
    INC IS_REVERSE_COUNT

    NO_REVERSE_ATTACK:
    IS_CELL_ON_GRID
    CMP IS_ON_GRID, 0
    JZ DATA_UPDATED
   
    IS_CELL_ATTACKED_BEFORE PLAYER_ATTACKING
     CELL_HAS_SHIP ATTACKX , ATTACKY ,PLAYER_ATTACKED
    
    CMP IS_ATTACKED_BEFORE , 1
    JZ DATA_UPDATED                    ;NO DATA NEEDS TO BE UPDATED IF PLAYER CHOOSE A CELL TWICE
    
    CMP PLAYER_ATTACKED , 2
    JNZ PLAYER1_IS_ATTACKED
    
    PLAYER2_IS_ATTACKED:   
        CMP IS_ONTARGET , 1
        JNZ PLAYER1_ATTACK_MISSED
    
    PLAYER1_ATTACK_ONTARGET:
        MOV SI , OFFSET P2_SCORE
        DEC BYTE PTR [SI]         ;DECREMENT THE SCORE
        PRINT_PLAYER2_SCORE

        MOV BP , OFFSET P2_SHIPS_REMAINING_CELLS  ;DECREMENT THE REMAINING CELL
        MOV DL , SHIP_INDEX  
        MOV DH , 0
        ADD BP , DX
        DEC BYTE PTR DS:[BP]
        
        
        MOV BX, OFFSET P1_ATTACKS_ONTARGET
        MOV SI, OFFSET P1_ATTACKS_ONTARGET_NUM
        DRAW_X_SIGN ATTACKX, ATTACKY,0CH

       JMP EDIT_DATA 
  
    PLAYER1_ATTACK_MISSED:
        MOV BX, OFFSET P1_ATTACKS_MISSED
        MOV SI, OFFSET P1_ATTACKS_MISSED_NUM
        DRAW_X_SIGN ATTACKX,ATTACKY,00H 
        JMP EDIT_DATA 
    
    PLAYER1_IS_ATTACKED:
        CMP IS_ONTARGET , 1
        JNZ PLAYER2_ATTACK_MISSED
    
    PLAYER2_ATTACK_ONTARGET:
        MOV SI , OFFSET P1_SCORE
        MOV CX ,[SI]         ;DECREMENT THE SCORE
        DEC CX 
        MOV [SI] , CX 
        PRINT_PLAYER1_SCORE
        
        MOV BP , OFFSET P1_SHIPS_REMAINING_CELLS
        MOV DL , SHIP_INDEX
        MOV DH , 0
        ADD BP , DX
        DEC BYTE PTR DS:[BP]
      
        
        MOV BX, OFFSET P2_ATTACKS_ONTARGET
        MOV SI, OFFSET P2_ATTACKS_ONTARGET_NUM
        DRAW_X_SIGN ATTACKX, ATTACKY,0CH
        JMP EDIT_DATA  
  
    PLAYER2_ATTACK_MISSED:
        MOV BX, OFFSET P2_ATTACKS_MISSED
        MOV SI, OFFSET P2_ATTACKS_MISSED_NUM
        DRAW_X_SIGN ATTACKX,ATTACKY,00H
        
        EDIT_DATA:  
            MOV AX, [SI]         ;INCREMENT NUMBER OF MISSED OR ONTARGET ATTACKS
            INC AX 
            MOV [SI] , AX
            DEC AX
            
            MOV CL , 04H         ;PUT THE CELL IN ONTARGET OR MISSED ( PLAYER 1 OR 2) ARRAY OF ATTACKS 
            MUL CL
            ADD BX,AX 
            MOV CX ,ATTACKX 
            MOV [BX] , CX
            MOV CX ,ATTACKY 
            MOV [BX + 2] ,CX  
            JMP DATA_UPDATED
            
    DATA_UPDATED:
    RET
                  
CHECK_CELL_AND_UPDATE_ATTACKS_DATA_   ENDP
;-------------------------------------; 
SCENE1_PLAYER_ATTACKS_  PROC NEAR
    
    CLEAR_GAME_SCREEN   WHITE
    DRAW_GRID
    DRAW_ALL_DESTROYED_SHIPS PLAYER_ATTACKED
    DRAW_ALL_X_SIGNS PLAYER_ATTACKING
    DRAW_POWER_UPS  PLAYER_ATTACKING
    RET
                
SCENE1_PLAYER_ATTACKS_   ENDP
;-----------------------------------------;
SCENE2_PLAYER_WATCHES_  PROC NEAR
    MOV AL, 0
    CMP IS_REVERSE_ATTACK_ACTIVATED, 1
    JNZ ANNOUNCE_OTHER_PLAYER_TURN
    CMP IS_REVERSE_COUNT, 2
    JNZ ANNOUNCE_OTHER_PLAYER_TURN
    JMP VIEW_OWN_DAMAGE
    
    ANNOUNCE_OTHER_PLAYER_TURN:
    CONCATENATE PLAYER_TURN, PLAYER_ATTACKED
    PRINT_NOTIFICATION_MESSAGE  CONCATENATED_STRING, 1
    PRESS_ENTER_TO_CONTINUE
    PRINT_NOTIFICATION_MESSAGE  VIEW_SHIPS_MSG, 1
    JMP VIEW_PLAYER_SHIPS
    
    VIEW_OWN_DAMAGE:
    MOV AL, 1
    PRINT_NOTIFICATION_MESSAGE  PRESS_ENTER_MSG, 1
    
    VIEW_PLAYER_SHIPS:
    CLEAR_GAME_SCREEN   WHITE
    DRAW_GRID
    DRAW_ALL_SHIPS_ON_GRID PLAYER_ATTACKED
    DRAW_ALL_X_SIGNS PLAYER_ATTACKING
    
    ; ANNOUNCE OTHER PLAYER'S TURN IN CASE THIS TURN WAS REVERSED
    CMP AL, 1
    JNZ GO_TO_ATTACK_SCENE
    PRESS_ENTER_TO_CONTINUE
    CONCATENATE PLAYER_TURN, PLAYER_ATTACKING
    PRINT_NOTIFICATION_MESSAGE  CONCATENATED_STRING, 1
    PRESS_ENTER_TO_CONTINUE
    
    GO_TO_ATTACK_SCENE:
    RET
    
SCENE2_PLAYER_WATCHES_   ENDP
;-----------------------------------------;
IS_IT_THE_END_  PROC NEAR
    
    CMP P1_SCORE , 0
    JNZ CHECK_PLAYER_2_SCORE 
    MOV GAME_END , 1
    JMP THE_END_IS_NEAR
    
    CHECK_PLAYER_2_SCORE:
    CMP P2_SCORE , 0
    JNZ THE_END_IS_NEAR
    MOV GAME_END , 1   
    
  THE_END_IS_NEAR:
    RET 
    
IS_IT_THE_END_   ENDP
;-----------------------------------------;
REFRESH_DATA_  PROC NEAR
    MOV P1_SCORE , TOTAL_N_CELLS 
    MOV P2_SCORE , TOTAL_N_CELLS 
    MOV P1_ATTACKS_ONTARGET_NUM ,0
    MOV P1_ATTACKS_MISSED_NUM ,0 
    MOV P2_ATTACKS_ONTARGET_NUM ,0 
    MOV P2_ATTACKS_MISSED_NUM ,0
    MOV PLAYER_ATTACKING ,1
    MOV PLAYER_ATTACKED ,2
    MOV GAME_END,0
    MOV JUMP_COUNTER, 1
    MOV SLIDER_CURRENT_ROW, SLIDER_INITIAL_ROW
    ; RESET SHIPS POSITIONS
    MOV CX, 0
    MOV SI, OFFSET P1_SHIPS_POINTS
    MOV DI, OFFSET P2_SHIPS_POINTS
    RESET_SHIPS_POSITIONS:
        MOV WORD PTR [SI], -2
        MOV WORD PTR [DI], -2
        ADD SI, 2
        ADD DI, 2
        INC CX
        CMP CX, N_SHIPS * 4
    JNZ RESET_SHIPS_POSITIONS
    ; RESET REMAINING CELLS
    MOV CX, 0
    MOV SI, OFFSET P1_SHIPS_REMAINING_CELLS
    MOV DI, OFFSET P1_SHIPS_SIZES
    MOV BX, OFFSET P2_SHIPS_REMAINING_CELLS
    MOV BP, OFFSET P2_SHIPS_SIZES
    RESET_REMAINING_CELLS:
        MOV AX, WORD PTR [DI]
        MOV BYTE PTR [SI], AL
        MOV AX, WORD PTR DS:[BP]
        MOV BYTE PTR [BX], AL
        INC SI
        INC BX
        ADD DI, 2
        ADD BP, 2
        INC CX
        CMP CX, N_SHIPS
    JNZ RESET_REMAINING_CELLS
    ; RESET POWER UPS
    MOV SI, OFFSET P1_IS_USED
    MOV DI, OFFSET P2_IS_USED
    MOV CX, 0
    RESET_IS_USED:
        MOV BYTE PTR [SI], 0
        MOV BYTE PTR [DI], 0
        INC SI
        INC DI
        INC CX
        CMP CX, 3
    JNZ RESET_IS_USED
    MOV P1_N_AVAILABLE_POWER_UPS, 3
    MOV P2_N_AVAILABLE_POWER_UPS, 3
    RET 
    
REFRESH_DATA_   ENDP
;-----------------------------------------;
PRINT_ATTACK_MSG_    PROC    NEAR
    CMP IS_ON_GRID, 0
    JZ ATTACK_OUTSIDE_GRID
    
    CMP IS_REVERSE_ATTACK_ACTIVATED, 1
    JNZ CONTINUE_CHECKING
    CMP IS_REVERSE_COUNT, 2
    JZ ATTACK_IS_REVERSED
    
    CONTINUE_CHECKING:
    CMP IS_ATTACKED_BEFORE, 1
    JZ ATTACK_NO_EFFECT
      
    CMP IS_ONTARGET, 1
    JZ ATTACK_ON_TARGET
    
    PRINT_NOTIFICATION_MESSAGE  NOT_ON_TARGET_MSG, 1
    JMP WAIT_FOR_ENTER_GO_ON
    
    ATTACK_OUTSIDE_GRID:
    PRINT_NOTIFICATION_MESSAGE  GRID_MISSED_MSG, 1
    JMP WAIT_FOR_ENTER_GO_ON
    
    ATTACK_NO_EFFECT:
    PRINT_NOTIFICATION_MESSAGE  CELL_ALREADY_ATTACKED_MSG, 1
    JMP WAIT_FOR_ENTER_GO_ON
    
    ATTACK_IS_REVERSED:
    PRINT_NOTIFICATION_MESSAGE  YOUR_ATTACK_WAS_REVERSED_MSG, 1
    JMP WAIT_FOR_ENTER_GO_ON
    
    ATTACK_ON_TARGET:
    PRINT_NOTIFICATION_MESSAGE  ON_TARGET_MSG, 1
    
    WAIT_FOR_ENTER_GO_ON:
    NOT_ENTER:
    MOV AH,0                      ;WAIT FOR THE USER TO CLICK ENTER
    INT 16H
    CMP AH,EXIT_SCANCODE
    JE PRE_EXIT_SCREEN
    CMP AH,ENTER_SCANCODE
    JNZ NOT_ENTER
    
    RET

PRINT_ATTACK_MSG_    ENDP

;-----------------------------------------;

START_THE_GAME_  PROC NEAR
MAIN_LOOP:
    SCENE1_PLAYER_ATTACKS
    GET_CELL_FROM_PLAYER ATTACKX,ATTACKY
    CHECK_CELL_AND_UPDATE_ATTACKS_DATA
    
    PRINT_ATTACK_MSG
    
    CMP IS_ATTACK_TWICE_ACTIVATED ,1 
    JNZ NO_ATTACK_TWICE
    MOV IS_ATTACK_TWICE_ACTIVATED,0
    JMP MAIN_LOOP
    
    NO_ATTACK_TWICE: 
    SCENE2_PLAYER_WATCHES
    
    CMP IS_REVERSE_ATTACK_ACTIVATED , 1
    JNZ NO_REVERSE_ATTACK_OR_REVERSE_IT2
    CMP IS_REVERSE_COUNT , 0
    JZ THE_REVERSE_WILL_BE_IN_THE_NEXT_TURN
     
    MOV AL , PLAYER_ATTACKED              ;RETURN EVERYTHING
    MOV BL , PLAYER_ATTACKING
    MOV PLAYER_ATTACKED  , BL
    MOV PLAYER_ATTACKING , AL  
    MOV IS_REVERSE_ATTACK_ACTIVATED, 0
    MOV IS_REVERSE_COUNT , 0
    JMP NO_REVERSE_ATTACK_OR_REVERSE_IT2
    
    THE_REVERSE_WILL_BE_IN_THE_NEXT_TURN:
    INC IS_REVERSE_COUNT 
    
    NO_REVERSE_ATTACK_OR_REVERSE_IT2:
    NOT_ENTER2:
    MOV AH,0                        ;WAIT FOR THE USER TO CLICK ENTER
    INT 16H
    CMP AH,EXIT_SCANCODE
    JE PRE_EXIT_SCREEN
    CMP AH,ENTER_SCANCODE
    JNZ NOT_ENTER2
    
    MOV AL ,PLAYER_ATTACKING        ;EXCHANGE THE TWO PLAYERS ROLE
    MOV AH ,PLAYER_ATTACKED
    MOV PLAYER_ATTACKING , AH
    MOV PLAYER_ATTACKED , AL
   
    IS_IT_THE_END 
    
    CMP GAME_END , 1
    JNZ MAIN_LOOP
    JMP PRE_EXIT_SCREEN      ;RETURN TO THE STATISTICS MENU IF THE GAME HAS BEEN ENDED
    
START_THE_GAME_   ENDP
;-------------------------------------;   
;--------- NADER PROCEDURES ----------;
;-------------------------------------;

DRAW_GRID_  PROC    NEAR
    ; DI AND SI ARE VALUES TO STOP LOOPING AT  
    MOV DI, GRID_CORNER2_X
    ADD DI, GRID_SQUARE_SIZE
    MOV SI, GRID_CORNER2_Y
    ADD SI, GRID_SQUARE_SIZE
    
    ; DRAW GRID COLUMNS
    MOV CX, GRID_CORNER1_X
    MOV DX, GRID_CORNER1_Y      ;INITIAL POINT: (20,19)
    MOV AX, 0C00H   ;AH = 0C FOR INT, AL = O0 (BLACK)
    DRAW_ALL_COLUMNS:
        MOV DX, GRID_CORNER1_Y  ;START DRAWING EVERY COLUMN FROM THE INITIAL ROW
        DRAW_COLUMN:
            INT 10H
            INC DX
            CMP DX, GRID_CORNER2_Y + 1
        JNZ DRAW_COLUMN
        ADD CX, GRID_SQUARE_SIZE  ;DISTANCE BETWEEN COLUMNS
        CMP CX, DI ;LAST LINE AT CX = GRID_CORNER2_X SO STOP AT CX = GRID_CORNER2_X + GRID_SQUARE_SIZE = DI
    JNZ DRAW_ALL_COLUMNS
    
    ; DRAW GRID ROWS
    MOV CX, GRID_CORNER1_X
    MOV DX, GRID_CORNER1_Y      ;INITIAL POINT: (20,19)
    MOV AX, 0C00H   ;AH = 0C FOR INT, AL = O0 (BLACK)
    DRAW_ALL_ROWS:
        MOV CX, GRID_CORNER1_X  ;START DRAWING EVERY ROW FROM THE INITIAL COLUMN
        DRAW_ROW:
            INT 10H
            INC CX
            CMP CX, GRID_CORNER2_X + 1
        JNZ DRAW_ROW
        ADD DX, GRID_SQUARE_SIZE  ;DISTANCE BETWEEN ROWS
        CMP DX, SI ;LAST LINE AT DX = GRID_CORNER2_Y SO STOP AT DX = GRID_CORNER2_Y + GRID_SQUARE_SIZE = SI
    JNZ DRAW_ALL_ROWS
    RET
DRAW_GRID_  ENDP
;-----------------------------------------;

DRAW_SLIDER_     PROC   NEAR   
    ; PARAMETERS
    ; DI = SLIDER_ROW
    ; AL = COLOR
    ;DRAW SLIDER
    MOV CX, SLIDER_COLUMN
    MOV DX, DI
    MOV AH, 0CH ; AL = COLOR
    MOV BX, 1
    DRAW_ALL_SLIDER_COLUMNS:
        MOV DI, BX
        DRAW_SLIDER_COLUMN:
            INT 10H
            INC DX
            DEC DI
        JNZ DRAW_SLIDER_COLUMN
        MOV DI, BX
        INC DI
        SUB DX, DI
        INC CX
        ADD BX, 2
        CMP BX, 15  ; TO INCREASE SLIDER SIZE ADD 2 (MUST BE ALWAYS ODD)
    JNZ DRAW_ALL_SLIDER_COLUMNS
    RET
DRAW_SLIDER_    ENDP 
;-----------------------------------------;

DRAW_COLUMN_SELECTOR_     PROC   NEAR   
    ; PARAMETERS
    ; DI = COLUMN_SELECTOR_COLUMN, 
    ; AL = COLOR
    ;DRAW SLIDER
    MOV CX, DI
    MOV DX, COLUMN_SELECTOR_ROW 
    DEC DX
    MOV AH, 0CH ; AL = COLOR
    MOV BX, 1
    DRAW_ALL_COLUMN_SELECTOR_ROWS:
        MOV DI, BX
        DRAW_COLUMN_SELECTOR_ROW:
            INT 10H
            INC CX
            DEC DI
        JNZ DRAW_COLUMN_SELECTOR_ROW
        MOV DI, BX
        INC DI
        SUB CX, DI
        INC DX
        ADD BX, 2
        CMP BX, 15  ; TO INCREASE THE SIZE ADD 2 (MUST BE ALWAYS ODD)
    JNZ DRAW_ALL_COLUMN_SELECTOR_ROWS
    RET
DRAW_COLUMN_SELECTOR_    ENDP 
;-----------------------------------------;

DRAW_SLIDER_BAR_    PROC    NEAR   
    MOV CX, SLIDER_BAR_COLUMN
    MOV DX, SLIDER_MAX_UP      ;INITIAL POINT
    MOV AX, 0C00H   ;AH = 0C FOR INT, AL = O0 (BLACK)
    DRAW_ALL_BARS:
        MOV DX, SLIDER_MAX_UP  ;START DRAWING EVERY COLUMN FROM THE INITIAL ROW
        DRAW_BAR:
            INT 10H
            INC DX
            CMP DX, SLIDER_MAX_DOWN
        JNZ DRAW_BAR
        ADD CX, 1  ;DISTANCE BETWEEN COLUMNS
        CMP CX, SLIDER_BAR_COLUMN + 6 ; SO THAT SLIDER BAR WIDTH = 5
    JNZ DRAW_ALL_BARS
    DRAW_SLIDER SLIDER_INITIAL_ROW, LIGHT_BLUE
    RET
DRAW_SLIDER_BAR_    ENDP
;-----------------------------------------;

FIRE_SLIDER_    PROC    NEAR   
    MOV SLIDER_CURRENT_ROW, SLIDER_INITIAL_ROW
    MOV SLIDER_DIRECTION, 0
    CHECK_USER_CLICK:
        ; CHECK IF USER PRESSED A KEY
        MOV AH, 1
        INT 16H
        JZ MOVE_SLIDER
        ; GET KEY PRESSED
        MOV AH, 0
        INT 16H
        CMP AH,EXIT_SCANCODE
        JE PRE_EXIT_SCREEN
        CMP AH, SPACE_SCANCODE
        JZ STOP_SLIDER
        ; MOVE THE SLIDER
   
     MOVE_SLIDER:
        ; CLEAR THE SLIDER CURRENT POSITION
        DRAW_SLIDER SLIDER_CURRENT_ROW, WHITE
        ; CHECK WHETHER TO MOVE IT UP OR DOWN
        CMP SLIDER_DIRECTION, 0
        JZ  DECREMENT_ROW
        ; MOVE SLIDER DOWN
        INC SLIDER_CURRENT_ROW
        ; CHECK IF ROW IS AT ITS LOWEST, CHANGE THE DIRECTION TO UP (0)
        CMP SLIDER_CURRENT_ROW, SLIDER_MAX_DOWN
        JNZ DRAW_NEW_SLIDER
        MOV SLIDER_DIRECTION, 0
        JMP DRAW_NEW_SLIDER
        ; MOVE SLIDER UP
  
    DECREMENT_ROW:
        DEC SLIDER_CURRENT_ROW
        ; CHECK IF ROW IS AT ITS HIGHEST, CHANGE THE DIRECTION TO DOWN (1)
        CMP SLIDER_CURRENT_ROW, SLIDER_MAX_UP
        JNZ DRAW_NEW_SLIDER
        MOV SLIDER_DIRECTION, 1
        ; DRAW THE SLIDER NEW POSITION
        
    DRAW_NEW_SLIDER:
        DRAW_SLIDER SLIDER_CURRENT_ROW, LIGHT_BLUE
        ; DELAY 
        MOV AH,86H
        MOV CX,0 ;CX:DX = INTERVAL IN MICROSECONDS
        MOV DX,03E8H
        INT 15H
        JMP CHECK_USER_CLICK
        
    STOP_SLIDER:
    RET
FIRE_SLIDER_    ENDP
;-----------------------------------------;

DRAW_STATUS_BAR_TEMPLATE_   PROC    NEAR
;CHAT BAR  
    MOV AX, 0C0FH                 
    MOV CX,0    ;STARTING FROM THE LEFT EDGE
    MOV DX,496  ;HEIGHT VALUE
    LOOP2:
    INT 10H
    INC CX
    CMP CX,800  ;ENDING AT THE RIGHT EDGE
    JNZ LOOP2

    PRINT_MESSAGE P1_USERNAME+1,2000H,0FH
    PRINT_MESSAGE P2_USERNAME+1,2100H,0FH
;SCORE BAR                       
    ;PLAYER 1 SCORE
    PRINT_MESSAGE P1_USERNAME+1,1E00H,0FH
    
    MOV DH,1EH ;Y
    MOV DL,P1_USERNAME+1  ;X
    PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH    

    ;PLAYER 2 SCORE
    PRINT_MESSAGE P2_USERNAME+1,1E40H,0FH
    
    MOV DH,1EH ;Y
    MOV DL,P2_USERNAME+1  ;X
    ADD DL,40H
    PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH    
    PRINT_PLAYER1_SCORE
    PRINT_PLAYER2_SCORE
    RET
DRAW_STATUS_BAR_TEMPLATE_   ENDP
;-----------------------------------------;
DRAW_NOTIFICATION_BAR_   PROC    NEAR
;NOTIFICATION BAR                        
    MOV AX, 0C0FH
    MOV CX,0
    MOV DX,555  
    LOOP1:
    INT 10H
    INC CX
    CMP CX,800
    JNZ LOOP1   
    RET
DRAW_NOTIFICATION_BAR_   ENDP
;-----------------------------------------;
PRINT_NOTIFICATION_MESSAGE_   PROC    NEAR
;INDEX = 1 -> MESSAGE #1
;INDEX = 2 -> MESSAGE #2
;PRINTS NOTIFICATION MESSAGES
    
    MOV CX,0
    MOV AX,1301H
    MOV BX,BP
    MOV CL,[BX]
    ADD BP,1
    MOV BX,000FH
    INT 10H  
 
    RET
PRINT_NOTIFICATION_MESSAGE_   ENDP
;-----------------------------------------;

PRINT_PLAYER1_SCORE_   PROC    NEAR
    
    ;DECIMAL_TO_STRING:
    MOV AX,0
    MOV AL,P1_SCORE
    MOV BL,10
    DIV BL
    MOV P1_SCORE_STRING, AL
    MOV P1_SCORE_STRING+1, AH
    ADD P1_SCORE_STRING,48
    ADD P1_SCORE_STRING+1,48

    MOV AX,1301H
    MOV DH,1EH ;Y
    MOV DL,P1_USERNAME+1 ;X
    ADD DL,10
    MOV BP,OFFSET P1_SCORE_STRING
    MOV CX,2         ;SIZE
    MOV BX,000FH
    INT 10H
 
    RET
PRINT_PLAYER1_SCORE_   ENDP
;-----------------------------------------;

PRINT_PLAYER2_SCORE_   PROC    NEAR
    
    ;DECIMAL_TO_STRING:
    MOV AX,0
    MOV AL,P2_SCORE
    MOV BL,10
    DIV BL
    MOV P2_SCORE_STRING, AL
    MOV P2_SCORE_STRING+1, AH
    ADD P2_SCORE_STRING,48
    ADD P2_SCORE_STRING+1,48

    MOV AX,1301H
    MOV DH,1EH ;Y
    MOV DL,P2_USERNAME+1 ;X
    ADD DL,4AH
    MOV BP,OFFSET P2_SCORE_STRING
    MOV CX,2         ;SIZE
    MOV BX,000FH
    INT 10H
 
    RET
PRINT_PLAYER2_SCORE_   ENDP
;-------------------------------------;
CALCULATE_SELECTOR_INITIAL_POSITION_   PROC    NEAR
    
    MOV SELECTOR_X1, SELECTOR_INITIAL_X1
    MOV SELECTOR_Y1, SELECTOR_INITIAL_Y1
    MOV SELECTOR_X2, SELECTOR_INITIAL_X2
    MOV SELECTOR_Y2, SELECTOR_INITIAL_Y2
    MOV SELECTOR_GRID_X1, SELECTOR_GRID_INITIAL_X1
    MOV SELECTOR_GRID_Y1, SELECTOR_GRID_INITIAL_Y1   
    MOV DX,GRID_SQUARE_SIZE
    ADD SELECTOR_X2,DX
    ADD SELECTOR_Y2,DX
    MOV AX, 6
    DIV LEVEL   ; MARGIN = 6 / LEVEL 
    ADD SELECTOR_X1, AX
    ADD SELECTOR_Y1, AX
    SUB SELECTOR_X2, AX
    SUB SELECTOR_Y2, AX
    MOV UP_ORIENTATION,0
    MOV DOWN_ORIENTATION,0
    MOV LEFT_ORIENTATION,0
    MOV RIGHT_ORIENTATION,0    

CHECK_FOR_SELECTOR_INITIAL_POSITION:
    MOV AX,0
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,SELECTED_PLAYER_SHIPS
    NOT IS_ONTARGET ;NOW IS_ONTARGET = 1 MEANS AN EMPTY CELL
    MOV AL,IS_ONTARGET
    POSSIBLE_ORIENTATIONS_CHECKER ;CHECKS WHETHER THE SELECTOR WILL BE STUCK OR NOT (LITERALLY CORNER CASE)
    MOV AH,UP_ORIENTATION
    OR AH,DOWN_ORIENTATION
    OR AH,LEFT_ORIENTATION
    OR AH,RIGHT_ORIENTATION 
    AND AL,AH
    CMP AL,1
    JE  VALID_INITIAL_POSITION
    ;IF THERE IS A SHIP, SELECTOR IS MOVED TO THE RIGHT, BUT IT CHECKS WHETHER THERE IS A SHIP ON ITS RIGHT
    ;IF ALL THE RIGHT CELLS ARE FULL, MOVE TO THE NEXT ROW, AND SO ON...
    MOV AX,GRID_CELLS_MAX_COORDINATE
    CMP SELECTOR_GRID_X1,AX
    JE MOVE_TO_NEXT_ROW
    INC SELECTOR_GRID_X1
    ADD SELECTOR_X1,DX
    ADD SELECTOR_X2,DX
    JMP CHECK_FOR_SELECTOR_INITIAL_POSITION
    
MOVE_TO_NEXT_ROW:
    MOV SELECTOR_GRID_X1,0
    MOV SELECTOR_X1, SELECTOR_INITIAL_X1
    MOV SELECTOR_X2, SELECTOR_INITIAL_X2
    ADD SELECTOR_X2,DX
   
    INC SELECTOR_GRID_Y1
    ADD SELECTOR_Y1,DX
    ADD SELECTOR_Y2,DX
    MOV AX, 6
    DIV LEVEL   ; MARGIN = 6 / LEVEL 
    ADD SELECTOR_X1, AX
    SUB SELECTOR_X2, AX
    JMP CHECK_FOR_SELECTOR_INITIAL_POSITION
    
VALID_INITIAL_POSITION:    
    RET
CALCULATE_SELECTOR_INITIAL_POSITION_   ENDP
;-----------------------------------------;
CELLS_SELECTOR_   PROC    NEAR 
    ;PARAMETERS:
    ;CX: SHIP SIZE 
    ;RETURNS: 2 POINTS IN GRID COORDINATES THAT THE PLAYER CHOSE (SELECTOR_GRID 1 AND 2) , THEY ARE NOT NECESSARILY IN THE RIGHT FORMAT
    
    ; INITIALIZATION
    DEC CX
    MOV DX,GRID_SQUARE_SIZE
    CALCULATE_SELECTOR_INITIAL_POSITION
    
    PRINT_NOTIFICATION_MESSAGE SELECTOR_STARTING_MSG,1
WAIT_FOR_DIRECTION_KEY:
    DRAW_RECTANGLE SELECTOR_X1,SELECTOR_Y1,SELECTOR_X2,SELECTOR_Y2,RED
    MOV AH,0
    INT 16H
    CMP AH,EXIT_SCANCODE
    JE PRE_EXIT_SCREEN
    CMP AH,ENTER_SCANCODE ;CHECKS IF THE USER HAS ALREADY CHOSEN THE FIRST CELL OF THE SELECTED SHIP
    JE SELECTOR_SECOND_POINT
    ;AFTER GETTING DIRECTION KEY, REMOVE THE OLD SELECTOR ICON, TO DRAW THE NEW ONE
    DRAW_RECTANGLE SELECTOR_X1,SELECTOR_Y1,SELECTOR_X2,SELECTOR_Y2,WHITE
    CMP AH,UP_SCANCODE 
    JE SELECTOR_UP
    CMP AH,DOWN_SCANCODE
    JE SELECTOR_DOWN
    CMP AH,LEFT_SCANCODE 
    JE SELECTOR_LEFT
    CMP AH,RIGHT_SCANCODE 
    JE SELECTOR_RIGHT
    JMP WAIT_FOR_DIRECTION_KEY
SELECTOR_UP:
    CMP SELECTOR_GRID_Y1,0    ;BOUNDARIES CHECK
    JE WAIT_FOR_DIRECTION_KEY
    RECHECK_SELECTOR_UP:
    DEC SELECTOR_GRID_Y1     
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,SELECTED_PLAYER_SHIPS  ;CHECKS WHETHER THE CELL HAS A SHIP PLACED ON IT OR NOT
    CMP IS_ONTARGET,0
    JE  SELECTOR_UP_CONTINUE
;IF THERE IS A SHIP,DO NOTHING (SHIP IS ON ONE OF THE BORDERS), OR JUMP OVER IT
    
    ;IF THE SHIP IS IN THE LAST CELL IN THE RESPECTIVE DIRECTION, DO NOTHING AND WAIT FOR ANOTHER DIRECTION
    CMP SELECTOR_GRID_Y1,0 
    JE RESET_UP_SHIP_JUMP
    
    ;IF IT'S NOT ON A BORDER CELL, JUMP OVER IT AND CHECK 
    INC JUMP_COUNTER
    JMP RECHECK_SELECTOR_UP  
    
    RESET_UP_SHIP_JUMP:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    RESET_SELECTOR_UP_COORDINATES:    
    INC SELECTOR_GRID_Y1
    LOOP RESET_SELECTOR_UP_COORDINATES  
    MOV CX,SI
    MOV JUMP_COUNTER,1  
    JMP WAIT_FOR_DIRECTION_KEY
    
    SELECTOR_UP_CONTINUE:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    DECREMENT_SELECTOR_UP_PIXEL_COORDINATES:    
    SUB SELECTOR_Y1,DX
    SUB SELECTOR_Y2,DX
    LOOP DECREMENT_SELECTOR_UP_PIXEL_COORDINATES  
    MOV CX,SI   
    MOV JUMP_COUNTER,1
    JMP WAIT_FOR_DIRECTION_KEY 
SELECTOR_DOWN:
    MOV AX, SELECTOR_GRID_Y1
    CMP AX,GRID_CELLS_MAX_COORDINATE    ;BOUNDARIES CHECK
    JE  WAIT_FOR_DIRECTION_KEY
    RECHECK_SELECTOR_DOWN:
    INC SELECTOR_GRID_Y1     
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,SELECTED_PLAYER_SHIPS  ;CHECKS WHETHER THE CELL HAS A SHIP PLACED ON IT OR NOT
    CMP IS_ONTARGET,0
    JE  SELECTOR_DOWN_CONTINUE
;IF THERE IS A SHIP,DO NOTHING (SHIP IS ON ONE OF THE BORDERS), OR JUMP OVER IT
    
    ;IF THE SHIP IS IN THE LAST CELL IN THE RESPECTIVE DIRECTION, DO NOTHING AND WAIT FOR ANOTHER DIRECTION
    MOV AX,GRID_CELLS_MAX_COORDINATE
    CMP SELECTOR_GRID_Y1,AX 
    JE RESET_DOWN_SHIP_JUMP
    
    ;IF IT'S NOT ON A BORDER CELL, JUMP OVER IT AND CHECK 
    INC JUMP_COUNTER
    JMP RECHECK_SELECTOR_DOWN  
    
    RESET_DOWN_SHIP_JUMP:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    RESET_SELECTOR_DOWN_COORDINATES:    
    DEC SELECTOR_GRID_Y1
    LOOP RESET_SELECTOR_DOWN_COORDINATES  
    MOV CX,SI
    MOV JUMP_COUNTER,1  
    JMP WAIT_FOR_DIRECTION_KEY
    
    SELECTOR_DOWN_CONTINUE:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    INCREMENT_SELECTOR_DOWN_PIXEL_COORDINATES:    
    ADD SELECTOR_Y1,DX
    ADD SELECTOR_Y2,DX
    LOOP INCREMENT_SELECTOR_DOWN_PIXEL_COORDINATES  
    MOV CX,SI   
    MOV JUMP_COUNTER,1
    JMP WAIT_FOR_DIRECTION_KEY   
SELECTOR_LEFT:
    CMP SELECTOR_GRID_X1,0    ;BOUNDARIES CHECK
    JE  WAIT_FOR_DIRECTION_KEY
    RECHECK_SELECTOR_LEFT:
    DEC SELECTOR_GRID_X1     
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,SELECTED_PLAYER_SHIPS  ;CHECKS WHETHER THE CELL HAS A SHIP PLACED ON IT OR NOT
    CMP IS_ONTARGET,0
    JE  SELECTOR_LEFT_CONTINUE
;IF THERE IS A SHIP,DO NOTHING (SHIP IS ON ONE OF THE BORDERS), OR JUMP OVER IT
    
    ;IF THE SHIP IS IN THE LAST CELL IN THE RESPECTIVE DIRECTION, DO NOTHING AND WAIT FOR ANOTHER DIRECTION
    CMP SELECTOR_GRID_X1,0 
    JE RESET_LEFT_SHIP_JUMP
    
    ;IF IT'S NOT ON A BORDER CELL, JUMP OVER IT AND CHECK 
    INC JUMP_COUNTER
    JMP RECHECK_SELECTOR_LEFT  
    
    RESET_LEFT_SHIP_JUMP:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    RESET_SELECTOR_LEFT_COORDINATES:    
    INC SELECTOR_GRID_X1
    LOOP RESET_SELECTOR_LEFT_COORDINATES  
    MOV CX,SI
    MOV JUMP_COUNTER,1  
    JMP WAIT_FOR_DIRECTION_KEY
    
    SELECTOR_LEFT_CONTINUE:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    DECREMENT_SELECTOR_LEFT_PIXEL_COORDINATES:    
    SUB SELECTOR_X1,DX
    SUB SELECTOR_X2,DX
    LOOP DECREMENT_SELECTOR_LEFT_PIXEL_COORDINATES  
    MOV CX,SI   
    MOV JUMP_COUNTER,1
    JMP WAIT_FOR_DIRECTION_KEY
SELECTOR_RIGHT:
    MOV AX, SELECTOR_GRID_X1
    CMP AX,GRID_CELLS_MAX_COORDINATE    ;BOUNDARIES CHECK
    JE  WAIT_FOR_DIRECTION_KEY
    RECHECK_SELECTOR_RIGHT:
    INC SELECTOR_GRID_X1     
    CELL_HAS_SHIP SELECTOR_GRID_X1,SELECTOR_GRID_Y1,SELECTED_PLAYER_SHIPS  ;CHECKS WHETHER THE CELL HAS A SHIP PLACED ON IT OR NOT
    CMP IS_ONTARGET,0
    JE  SELECTOR_RIGHT_CONTINUE
;IF THERE IS A SHIP,DO NOTHING (SHIP IS ON ONE OF THE BORDERS), OR JUMP OVER IT
    
    ;IF THE SHIP IS IN THE LAST CELL IN THE RESPECTIVE DIRECTION, DO NOTHING AND WAIT FOR ANOTHER DIRECTION
    MOV AX,GRID_CELLS_MAX_COORDINATE
    CMP SELECTOR_GRID_X1,AX 
    JE RESET_RIGHT_SHIP_JUMP
    
    ;IF IT'S NOT ON A BORDER CELL, JUMP OVER IT AND CHECK 
    INC JUMP_COUNTER
    JMP RECHECK_SELECTOR_RIGHT  
    
    RESET_RIGHT_SHIP_JUMP:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    RESET_SELECTOR_RIGHT_COORDINATES:    
    DEC SELECTOR_GRID_X1
    LOOP RESET_SELECTOR_RIGHT_COORDINATES  
    MOV CX,SI
    MOV JUMP_COUNTER,1  
    JMP WAIT_FOR_DIRECTION_KEY
    
    SELECTOR_RIGHT_CONTINUE:
    MOV SI,CX       ;SAVE CX VALUE AS IT'LL BE USED AS A COUNTER
    MOV CX,JUMP_COUNTER
    INCREMENT_SELECTOR_RIGHT_PIXEL_COORDINATES:    
    ADD SELECTOR_X1,DX
    ADD SELECTOR_X2,DX
    LOOP INCREMENT_SELECTOR_RIGHT_PIXEL_COORDINATES  
    MOV CX,SI   
    MOV JUMP_COUNTER,1
    JMP WAIT_FOR_DIRECTION_KEY
    
SELECTOR_SECOND_POINT:
    PRINT_NOTIFICATION_MESSAGE ORIENTATION_SELECTION_MSG,1
    ;ORIENTATIONS CHECK
    POSSIBLE_ORIENTATIONS_CHECKER
    MOV DX,CX
HIGHLIGHT_UP_ORIENTATION:
    CMP UP_ORIENTATION,0
    JE  HIGHLIGHT_DOWN_ORIENTATION
    MOV AX,SELECTOR_X1
    MOV PIXELS1_X,AX
    MOV AX,SELECTOR_Y1
    MOV PIXELS1_Y,AX
    MOV AX,SELECTOR_X2
    MOV PIXELS2_X,AX
    MOV AX,SELECTOR_Y2  
    MOV PIXELS2_Y,AX   ;STORE SELECTOR PIXELS COORDINATES
    MOV AX,GRID_SQUARE_SIZE
    MOV CX,DX          ;SET COUNTER
    UP_HIGHLIGHT:
    SUB PIXELS1_Y,AX
    SUB PIXELS2_Y,AX
    DRAW_RECTANGLE PIXELS1_X,PIXELS1_Y,PIXELS2_X,PIXELS2_Y,YELLOW
    LOOP UP_HIGHLIGHT
HIGHLIGHT_DOWN_ORIENTATION:
    CMP DOWN_ORIENTATION,0
    JE  HIGHLIGHT_LEFT_ORIENTATION
    MOV AX,SELECTOR_X1
    MOV PIXELS1_X,AX
    MOV AX,SELECTOR_Y1
    MOV PIXELS1_Y,AX
    MOV AX,SELECTOR_X2
    MOV PIXELS2_X,AX
    MOV AX,SELECTOR_Y2  
    MOV PIXELS2_Y,AX   ;STORE SELECTOR PIXELS COORDINATES
    MOV AX,GRID_SQUARE_SIZE
    MOV CX,DX          ;SET COUNTER
    DOWN_HIGHLIGHT:
    ADD PIXELS1_Y,AX
    ADD PIXELS2_Y,AX
    DRAW_RECTANGLE PIXELS1_X,PIXELS1_Y,PIXELS2_X,PIXELS2_Y,YELLOW
    LOOP DOWN_HIGHLIGHT
HIGHLIGHT_LEFT_ORIENTATION:
    CMP LEFT_ORIENTATION,0
    JE  HIGHLIGHT_RIGHT_ORIENTATION
    MOV AX,SELECTOR_X1
    MOV PIXELS1_X,AX
    MOV AX,SELECTOR_Y1
    MOV PIXELS1_Y,AX
    MOV AX,SELECTOR_X2
    MOV PIXELS2_X,AX
    MOV AX,SELECTOR_Y2  
    MOV PIXELS2_Y,AX   ;STORE SELECTOR PIXELS COORDINATES
    MOV AX,GRID_SQUARE_SIZE
    MOV CX,DX          ;SET COUNTER
    LEFT_HIGHLIGHT:
    SUB PIXELS1_X,AX
    SUB PIXELS2_X,AX
    DRAW_RECTANGLE PIXELS1_X,PIXELS1_Y,PIXELS2_X,PIXELS2_Y,YELLOW
    LOOP LEFT_HIGHLIGHT
HIGHLIGHT_RIGHT_ORIENTATION:
    CMP RIGHT_ORIENTATION,0
    JE  CHECK_POSSIBLE_ORIENTATION
    MOV AX,SELECTOR_X1
    MOV PIXELS1_X,AX
    MOV AX,SELECTOR_Y1
    MOV PIXELS1_Y,AX
    MOV AX,SELECTOR_X2
    MOV PIXELS2_X,AX
    MOV AX,SELECTOR_Y2  
    MOV PIXELS2_Y,AX   ;STORE SELECTOR PIXELS COORDINATES
    MOV AX,GRID_SQUARE_SIZE
    MOV CX,DX          ;SET COUNTER
    RIGHT_HIGHLIGHT:
    ADD PIXELS1_X,AX
    ADD PIXELS2_X,AX
    DRAW_RECTANGLE PIXELS1_X,PIXELS1_Y,PIXELS2_X,PIXELS2_Y,YELLOW
    LOOP RIGHT_HIGHLIGHT
        ;CHECK IF THERE IS AT LEAST ONE POSSIBLE ORIENTATION
CHECK_POSSIBLE_ORIENTATION:
        MOV AL,0
        OR AL,UP_ORIENTATION
        OR AL,DOWN_ORIENTATION        
        OR AL,LEFT_ORIENTATION
        OR AL,RIGHT_ORIENTATION 
        CMP AL,0
        JNE GET_SECOND_POINT
        PRINT_NOTIFICATION_MESSAGE NO_POSSIBLE_ORIENTATION,1
        WAIT_FOR_ENTER_TO_WAIT_FOR_DIRECTION_KEY:
        MOV AH, 0
        INT 16H
        CMP AH,EXIT_SCANCODE
        JE PRE_EXIT_SCREEN
        CMP AH, ENTER_SCANCODE
        JNZ WAIT_FOR_ENTER_TO_WAIT_FOR_DIRECTION_KEY
        PRINT_NOTIFICATION_MESSAGE SELECTOR_STARTING_MSG,1
        ;RESET DATA
        MOV DX,GRID_SQUARE_SIZE
        JMP WAIT_FOR_DIRECTION_KEY
        
GET_SECOND_POINT:
    MOV CX,DX
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX
    WAIT_ORIENTATION_SELECTION:
        MOV AH,0
        INT 16H
        CMP AH,EXIT_SCANCODE
        JE PRE_EXIT_SCREEN
        CMP AH,UP_SCANCODE 
        JE UP_ORIENTATION_SELECTED
        CMP AH,DOWN_SCANCODE
        JE DOWN_ORIENTATION_SELECTED
        CMP AH,LEFT_SCANCODE 
        JE LEFT_ORIENTATION_SELECTED
        CMP AH,RIGHT_SCANCODE 
        JE RIGHT_ORIENTATION_SELECTED
        JMP WAIT_ORIENTATION_SELECTION
UP_ORIENTATION_SELECTED:   
        CMP UP_ORIENTATION,0
        JE  WAIT_ORIENTATION_SELECTION
        SUB SELECTOR_GRID_Y2,CX
        CLEAR_GRID 
        RET   
DOWN_ORIENTATION_SELECTED:
        CMP DOWN_ORIENTATION,0
        JE  WAIT_ORIENTATION_SELECTION 
        ADD SELECTOR_GRID_Y2,CX
        CLEAR_GRID
        RET       
LEFT_ORIENTATION_SELECTED: 
        CMP LEFT_ORIENTATION,0
        JE  WAIT_ORIENTATION_SELECTION
        SUB SELECTOR_GRID_X2,CX
        CLEAR_GRID
        RET        
RIGHT_ORIENTATION_SELECTED:
        CMP RIGHT_ORIENTATION,0
        JE  WAIT_ORIENTATION_SELECTION          
        ADD SELECTOR_GRID_X2,CX
        CLEAR_GRID
    RET
CELLS_SELECTOR_   ENDP
;-----------------------------------------;  
POSSIBLE_ORIENTATIONS_CHECKER_   PROC    NEAR 

UP_ORIENTATION_CHECK:
MOV AX,SELECTOR_GRID_X1
MOV SELECTOR_GRID_X2,AX
MOV AX,SELECTOR_GRID_Y1
MOV SELECTOR_GRID_Y2,AX    ;COPY POINT 1 TO POINT 2
MOV DX,CX                  ;COPY SIZE TO DX
CMP SELECTOR_GRID_Y1,CX
JAE UP_ORIENTATION_SHIP_CHECK   
MOV UP_ORIENTATION,0
JMP DOWN_ORIENTATION_CHECK 
UP_ORIENTATION_SHIP_CHECK:     ;CHECKS WHETHER THE UP-REGION HAS SHIPS PLACED IN ITS DIRECTION 
    DEC SELECTOR_GRID_Y2       ;TRAVERSE ON THE Y-AXIS UPWARDS
    CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2,SELECTED_PLAYER_SHIPS
    CMP IS_ONTARGET,0
    JNE UP_ORIENTATION_INVALID
    LOOP UP_ORIENTATION_SHIP_CHECK
    MOV UP_ORIENTATION,1            ;ORIENTATION IS VALID
    JMP DOWN_ORIENTATION_CHECK
    UP_ORIENTATION_INVALID:
       MOV UP_ORIENTATION,0 
           
DOWN_ORIENTATION_CHECK:
    MOV CX,DX                  ;RETURN CX TO ITS ORIGINAL VALUE
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX    ;RETURN POINT 2 TO ITS INTIAL VALUE
    
    MOV SI,GRID_CELLS_MAX_COORDINATE
    SUB SI,SELECTOR_GRID_Y1
    CMP SI,CX
    JAE DOWN_ORIENTATION_SHIP_CHECK   
    MOV DOWN_ORIENTATION,0
    JMP LEFT_ORIENTATION_CHECK 
    DOWN_ORIENTATION_SHIP_CHECK:     ;CHECKS WHETHER THE DOWN-REGION HAS SHIPS PLACED IN ITS DIRECTION 
        INC SELECTOR_GRID_Y2       ;TRAVERSE ON THE Y-AXIS DOWNWARDS
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2,SELECTED_PLAYER_SHIPS
        CMP IS_ONTARGET,0
        JNE DOWN_ORIENTATION_INVALID
        LOOP DOWN_ORIENTATION_SHIP_CHECK
        MOV DOWN_ORIENTATION,1            ;ORIENTATION IS VALID
        JMP LEFT_ORIENTATION_CHECK
        DOWN_ORIENTATION_INVALID:
        MOV DOWN_ORIENTATION,0 
                          
LEFT_ORIENTATION_CHECK:
    MOV CX,DX                  ;RETURN CX TO ITS ORIGINAL VALUE
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX    ;RETURN POINT 2 TO ITS INTIAL VALUE
    
    CMP SELECTOR_GRID_X1,CX
    JAE LEFT_ORIENTATION_SHIP_CHECK   
    MOV LEFT_ORIENTATION,0
    JMP RIGHT_ORIENTATION_CHECK 
    LEFT_ORIENTATION_SHIP_CHECK:     ;CHECKS WHETHER THE LEFT-REGION HAS SHIPS PLACED IN ITS DIRECTION 
        DEC SELECTOR_GRID_X2       ;TRAVERSE ON THE X-AXIS IN THE LEFT DIRECTION
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2,SELECTED_PLAYER_SHIPS
        CMP IS_ONTARGET,0
        JNE LEFT_ORIENTATION_INVALID
        LOOP LEFT_ORIENTATION_SHIP_CHECK
        MOV LEFT_ORIENTATION,1            ;ORIENTATION IS VALID
        JMP RIGHT_ORIENTATION_CHECK
        LEFT_ORIENTATION_INVALID:
        MOV LEFT_ORIENTATION,0
RIGHT_ORIENTATION_CHECK:
    MOV CX,DX                  ;RETURN CX TO ITS ORIGINAL VALUE
    MOV AX,SELECTOR_GRID_X1
    MOV SELECTOR_GRID_X2,AX
    MOV AX,SELECTOR_GRID_Y1
    MOV SELECTOR_GRID_Y2,AX    ;RETURN POINT 2 TO ITS INTIAL VALUE
    
    MOV SI,GRID_CELLS_MAX_COORDINATE
    SUB SI,SELECTOR_GRID_X1
    CMP SI,CX
    JAE RIGHT_ORIENTATION_SHIP_CHECK   
    MOV RIGHT_ORIENTATION,0
    JMP POSSIBLE_ORIENTATIONS_CHECKER_FINISH 
    RIGHT_ORIENTATION_SHIP_CHECK:     ;CHECKS WHETHER THE RIGHT-REGION HAS SHIPS PLACED IN ITS DIRECTION 
        INC SELECTOR_GRID_X2       ;TRAVERSE ON THE X-AXIS IN THE RIGHT DIRECTION
        CELL_HAS_SHIP SELECTOR_GRID_X2,SELECTOR_GRID_Y2,SELECTED_PLAYER_SHIPS
        CMP IS_ONTARGET,0
        JNE RIGHT_ORIENTATION_INVALID
        LOOP RIGHT_ORIENTATION_SHIP_CHECK
        MOV RIGHT_ORIENTATION,1            ;ORIENTATION IS VALID
        JMP POSSIBLE_ORIENTATIONS_CHECKER_FINISH
        RIGHT_ORIENTATION_INVALID:
        MOV RIGHT_ORIENTATION,0
        POSSIBLE_ORIENTATIONS_CHECKER_FINISH:     
    RET
POSSIBLE_ORIENTATIONS_CHECKER_   ENDP
;-----------------------------------------;  
CLEAR_GRID_   PROC    NEAR 
    DRAW_RECTANGLE  GRID_CORNER1_X,GRID_CORNER1_Y,GRID_CORNER2_X,GRID_CORNER2_Y,WHITE
    DRAW_GRID 
    RET
CLEAR_GRID_   ENDP
;-----------------------------------------;    
STAT_SCREEN_   PROC    NEAR 
    DRAW_RECTANGLE 400,70,400,470,WHITE
    ;PLAYER 1 SCORE
    MOV DL,0FH
    PRINT_MESSAGE P1_USERNAME+1,0F0FH,0FH
    
    MOV DH,0FH ;Y
    ADD DL,P1_USERNAME+1  ;X
    PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH    
    ;PLAYER 2 SCORE
    MOV DL,10H    
    PRINT_MESSAGE P2_USERNAME+1,0F40H,0FH
    
    MOV DH,0FH ;Y
    ADD DL,P2_USERNAME+1  ;X
    ADD DL,30H
    PRINT_MESSAGE SCORE_CONSTANT_TEXT,DX,0FH 
    ;DECIMAL_TO_STRING:
    MOV AX,0
    MOV AL,P1_SCORE
    MOV BL,10
    DIV BL
    MOV P1_SCORE_STRING, AL
    MOV P1_SCORE_STRING+1, AH
    ADD P1_SCORE_STRING,48
    ADD P1_SCORE_STRING+1,48
    MOV AX,1301H 
    MOV DH,0FH ;Y
    MOV DL,P1_USERNAME+1 ;X
    ADD DL,19H
    MOV BP,OFFSET P1_SCORE_STRING
    MOV CX,2         ;SIZE
    MOV BX,000FH
    INT 10H
    
    ;DECIMAL_TO_STRING:
    MOV AX,0
    MOV AL,P2_SCORE
    MOV BL,10
    DIV BL
    MOV P2_SCORE_STRING, AL
    MOV P2_SCORE_STRING+1, AH
    ADD P2_SCORE_STRING,48
    ADD P2_SCORE_STRING+1,48
    MOV AX,1301H
    MOV DH,0FH ;Y
    MOV DL,P2_USERNAME+1 ;X
    ADD DL,4AH
    MOV BP,OFFSET P2_SCORE_STRING
    MOV CX,2         ;SIZE
    MOV BX,000FH
    INT 10H
    
    PRINT_NOTIFICATION_MESSAGE TO_RESTART_GAME,1
    PRINT_NOTIFICATION_MESSAGE TO_QUIT_GAME,2
CHECK_STAT_MENU_PRESS:
    MOV AH,0
    INT 16H
    CMP AH,ENTER_SCANCODE
    JNE MAY_QUIT
    REFRESH_DATA
    RET
    MAY_QUIT:
    CMP AH,EXIT_SCANCODE
    JNE CHECK_STAT_MENU_PRESS
    JMP THE_END
STAT_SCREEN_   ENDP
;-----------------------------------------; 
CLEAR_GAME_SCREEN_  PROC    NEAR
    ; PARAMETERS
    ; AL = COLOR   
    DRAW_RECTANGLE  0, 0, GAME_SCREEN_MAX_X, GAME_SCREEN_MAX_Y, AL  
    RET
CLEAR_GAME_SCREEN_  ENDP
;-----------------------------------------; 
CONCATENATE_  PROC    NEAR
    ; PARAMETERS
    ; AL = PLAYER NUMBER
    ; BX = OFFSET STRING   
    CMP AL,1
    JNE PLAYER_2_CONCATENATION
    MOV SI,0
    MOV SI,OFFSET P1_USERNAME
    INC SI
    MOV AX,0
    MOV AL,BYTE PTR[SI]
    MOV CONCATENATED_STRING,AL
    MOV CX,0
    MOV CL,BYTE PTR[SI]
    INC SI
    MOV DI,0
    MOV DI,OFFSET CONCATENATED_STRING
    INC DI
    ADD DI, 2 ; TO ACCOUNT FOR THE DASH AND SPACE
    REP MOVSB
    JMP STRING_CONCATENATION
    PLAYER_2_CONCATENATION: 
    MOV SI,0
    MOV SI,OFFSET P2_USERNAME
    INC SI
    MOV AX,0
    MOV AL,BYTE PTR[SI]
    MOV CONCATENATED_STRING,AL
    MOV CX,0
    MOV CL,BYTE PTR[SI]
    INC SI
    MOV DI,0
    MOV DI,OFFSET CONCATENATED_STRING
    INC DI
    ADD DI, 2 ; TO ACCOUNT FOR THE DASH AND SPACE
    REP MOVSB
    STRING_CONCATENATION:
    MOV SI,OFFSET BX
    MOV CL,BYTE PTR[SI]
    MOV AX,0
    MOV AL,BYTE PTR[SI]
    ADD CONCATENATED_STRING, AL
    INC SI 
    REP MOVSB   
    RET
CONCATENATE_  ENDP
;-----------------------------------------; 
DRAW_PRE_EXIT_SCREEN_    PROC    NEAR
    DRAW_RECTANGLE  0, 0, 800, 554, BLACK ;CLEARS THE WHOLE SCREEN EXCEPT THE NOTIFICATION BAR
    STAT_SCREEN
    DRAW_RECTANGLE  0, 0, 800, 600, BLACK ;CLEARS THE WHOLE SCREEN
    DRAW_NOTIFICATION_BAR
    JMP STARTING_POINT
    RET
DRAW_PRE_EXIT_SCREEN_    ENDP
;-----------------------------------------;
EXIT_GAME_    PROC    NEAR
    DRAW_RECTANGLE  0, 0, 800, 600, BLACK ;CLEARS THE WHOLE SCREEN
    MOV AH,4CH  
    INT 21H 
    RET
EXIT_GAME_    ENDP
;-----------------------------------------;
PRESS_ENTER_TO_CONTINUE_    PROC    NEAR
    KEEP_WAITING:
        MOV AH, 0
        INT 16H
        CMP AH, EXIT_SCANCODE
        JE PRE_EXIT_SCREEN
        CMP AH, ENTER_SCANCODE
    JNE KEEP_WAITING
    RET
PRESS_ENTER_TO_CONTINUE_    ENDP
;-----------------------------------------;
PLAYERS_PLACE_SHIPS_    PROC    NEAR
    CLEAR_GAME_SCREEN WHITE
    DRAW_GRID
    CONCATENATE PLAYER_TURN, 1
    PRINT_NOTIFICATION_MESSAGE  CONCATENATED_STRING, 1
    PRESS_ENTER_TO_CONTINUE
    PLACE_SHIPS_ON_GRID 1
    
    CLEAR_GAME_SCREEN   WHITE
    DRAW_GRID
    CONCATENATE PLAYER_TURN, 2
    PRINT_NOTIFICATION_MESSAGE  CONCATENATED_STRING, 1
    PRESS_ENTER_TO_CONTINUE
    PLACE_SHIPS_ON_GRID 2
    
    CLEAR_GAME_SCREEN   WHITE
    DRAW_GRID
    CONCATENATE PLAYER_TURN, 1
    PRINT_NOTIFICATION_MESSAGE  CONCATENATED_STRING, 1
    PRESS_ENTER_TO_CONTINUE
    
    PRINT_NOTIFICATION_MESSAGE  ATTACK_TIME_MSG, 1
    PRESS_ENTER_TO_CONTINUE
    RET
PLAYERS_PLACE_SHIPS_    ENDP
;-----------------------------------------; 

STARTING_PAGE_     PROC NEAR
    PRINT_MESSAGE WELCOME_MSG , 0825H , 0FF28H
    PRINT_MESSAGE CONTROLLERS_MSG , 0F10h , 0FF0FH
    
    PRINT_MESSAGE ARROWS_MSG , 1210H , 0FF0FH
    PRINT_MESSAGE ENTER_MSG , 1410H , 0FF0FH        
    PRINT_MESSAGE SPACE_MSG , 1610H , 0FF0FH
    PRINT_MESSAGE TAB_MSG , 1810H , 0FF0FH
    
    PRINT_MESSAGE PRESS_ENTER_MSG , 2125H , 0FF0FH
    

    PRESS_ENTER_TO_CONTINUE
    DRAW_RECTANGLE  0, 0, 800, 600, BLACK ;CLEARS THE WHOLE SCREEN
    RET
STARTING_PAGE_     ENDP
;-----------------------------------------;   
END     MAIN