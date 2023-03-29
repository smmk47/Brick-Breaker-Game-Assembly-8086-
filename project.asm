
;COAL SEMESTER PROJECT 2022 
;GROUP MEMBERS
; 1: MURTAZA KAZMI https://www.linkedin.com/in/murtaza-k-a25855193/
; 2: SAAD AHMED  https://www.linkedin.com/in/saad-ahmed-qureshi-863b91212/
; 
;

.model small
.stack 100h
.data
char db ?
	strbs db "Backspace Key is pressed","$"
	str1 db "Brick Breaker Game","$"
	arr1 db 18 dup (66 ,114 ,105 ,99 ,107 ,32 ,66 ,114 ,101 ,97 ,107 ,101 ,114 ,32 ,71 ,97 ,109 ,101) ;;Brick Breaker Game
	str2 db "Enter Your name : ","$"
	arr2 db 18 dup (69 ,110 ,116 ,101 ,114 ,32 ,89 ,111 ,117 ,114 ,32 ,110 ,97 ,109 ,101 ,32 ,58 ,32) ;;Enter Your name : 
	name db 50 DUP(?) ;to store player name
    ;score db 7 dup(83,67,79,82,69,58,32)
	arrins0 db 12 dup (73 ,110 ,115 ,116 ,114, 117, 99 ,116, 105, 111 ,110 ,115)
	arrins1 db 31 dup(73,110,32,116,104,105,115,32,103,97,109,101,44,32,116,104,101,32,112,108,97,121,101,114,32,109,111,118,101,115,32)
	arrins2 db 41 dup (97,32,80,65,68,68,76,69,32,102,114,111,109,32,115,105,100,101,45,116,111,45,115,105,100,101,32,116,111,32,104,105,116,32,97,32,66,65,76,76,46)
	
	scr13 db "Score : ","$"
	arr13 db 9 dup(32 ,83, 99 ,111 ,114 ,101 ,32, 58, 32)
	
	pausegame db 'Game Paused','$'
    pressS db 'Press S to start the game','$'
	
	livescore db 0
    rem db 0
	var1 dw ?
	lives db 7 dup(76,105,118,101,115,58,32)
	lx1 db 40
	ly1 db 28
	lifescore db 0
	gameoverstr db 10 dup(71,65,77,69,32,79,86,69,82)
	str9 db "->>>      Main Menu      <<<-","$"
	arr9 db 29 dup( 45 ,62 ,62 ,62 ,32 ,32 ,32, 32 ,32, 32, 77 ,97, 105, 110 ,32, 77, 101, 110 ,117 ,32, 32 ,32 ,32 ,32 ,32 ,60 ,60 ,60 ,45)
	str4 db "-> New Game          Press :1","$"
	arr4 db 29 dup( 45 ,62 ,32 ,78 ,101 ,119 ,32 ,71 ,97 ,109 ,101 ,32 ,32 ,32 ,32 ,32 ,32 ,32 ,32 ,32, 32 ,80 ,114 ,101 ,115 ,115 ,32 ,58 ,49)
	str5 db "-> Resume            Press :2","$"
	arr5 db 29 dup( 45, 62 ,32 ,82 ,101, 115, 117, 109, 101, 32 ,32 ,32 ,32 ,32 ,32 ,32 ,32 ,32 ,32 ,32 ,32 ,80 ,114, 101, 115, 115, 32 ,58, 50)
	str6 db "-> Instructions      Press :3","$"
	arr6 db 29 dup( 45 ,62 ,32, 73 ,110 ,115 ,116 ,114, 117, 99 ,116, 105, 111 ,110 ,115, 32, 32 ,32 ,32, 32 ,32 ,80 ,114, 101 ,115 ,115 ,32 ,58 ,51)
	str7 db "-> high score        Press :4","$"
	arr7 db 29 dup( 45 ,62 ,32 ,104 ,105 ,103, 104 ,32 ,115 ,99 ,111 ,114 ,101 ,32 ,32 ,32 ,32 ,32 ,32 ,32 ,32 ,80 ,114, 101, 115 ,115 ,32 ,58 ,52)
	str8 db "-> Exit              Press :5","$"
	arr8 db 29 dup( 45 ,62 ,32 ,69 ,120 ,105 ,116 ,32 ,32 ,32 ,32 ,32 ,32 ,32 ,32 ,32, 32, 32, 32, 32, 32, 80, 114, 101 ,115 ,115, 32, 58 ,53)
	mystr db 10 DUP(?); to store name of the player
	str10 db "USER NAME: ","$"
	arr10 db 29 dup(85,83,69,82,32,78,65,77,69,58,32)
	str11 db "Game Instructions","$"
	
	arr11 db 29 dup (71,97,109,101,32,73,110,115,116,114,117,99,116,105,111,110,115,)
	
	str12 db "Use left and right arrow keys to move the paddle","$"


; t in tx1 reprsent titlepage co-ordinates  
	tx1 db 30;;  co-ordinates for game name
	ty1 db 10;;

	tx2 db 20 ;; co-ordinates for user name input
	ty2 db 20 ;;
	temp dw ?
	index dw 0
; m in mx1 reprsent menupage co-ordinates
	
	
	
	mx7 db 30 ;name position
	my7 db 22
	
	mx8 db 40
	my8 db 22
	
	mx0 db 25
	my0 db 8
	
	mx1 db 25 
	my1 db 10
	
	mx2 db 25 
	my2 db 12
	
	mx3 db 25 
	my3 db 14
	
	mx4 db 25
	my4 db 16
	
	mx5 db 25
	my5 db 18
	
	mx6 db 25
	my6 db 20
	;instruction page 
	ix1 db 30
	iy1 db 8
	;score
	sx1 db 12
	sy1 db 28
	;game over 
	gx1 db 25
	gy1 db 8
	
	
	tempx1 db ?
	tempy1 db ?

	cx1 db 20
	cy1 db 10
	
	pdly1 db 26
	pdlx1 db 34
	pdly2 db 26
	pdlx2 db 50
	
	padx1 dw 272
	padx2 dw 400
	
	btmy1 db 27
	btmx1 db 0
	btmy2 db 29
	btmx2 db 80
	
	temp1 dw ?
	
	
	
 
	ballx dw 320 ;ball x-coordinate
	bally dw 250;ball y-coordinate 
	ballsize dw 05h ;ball size 
	previous_position db 0 ;check ball position 
	ballvel_x dw 05h ;horizontal movement of ball
	ballvel_y dw 09h ;vertical movement of ball
	border_x dw 630  ;max border on the right 
	border_y dw 460  ;max border on the bottom
	border_boundx dw 6
	border_boundy dw 6

	col db ?
	br1y1 db 2
	br1x1 db 7 dup( 5,15,25,35,45,55,65)
	br1y2 db 2
	br1x2 db 7 dup( 13,23,33,43,53,63,73)
	checkrow1 db 7 dup (1,1,1,1,1,1,1)
	
	br2y1 db 4
	br2x1 db 7 dup( 5,15,25,35,45,55,65)
	br2y2 db 4
	br2x2 db 7 dup( 13,23,33,43,53,63,73)
	checkrow2 db 7 dup (1,1,1,1,1,1,1)
	
	br3y1 db 6
	br3x1 db 7 dup( 5,15,25,35,45,55,65)
	br3y2 db 6
	br3x2 db 7 dup( 13,23,33,43,53,63,73)
	checkrow3 db 7 dup (1,1,1,1,1,1,1)
	
	checkrow4 db 7 dup (1,1,1,1,1,1,1)
	checkrow5 db 7 dup (2,2,2,2,2,2,2)
	checkrow6 db 7 dup (1,1,1,1,1,1,1)
	
	checkrow7 db 7 dup (2,2,2,2,2,2,2)
	checkrow8 db 7 dup (1,1,1,1,1,1,1)
	checkrow9 db 7 dup (2,2,2,2,2,2,2)
	
	
	hrx1 dw 480
	hry1 dw 450
	
	pxlx dw  480;pixel x-coordinate
	pxly dw 450;pixel y-coordinate 
	pxlsize dw 04h ;pixel size 
	
	
	hrx2 dw 530
	hry2 dw 450
	
	hrx3 dw 580
	hry3 dw 450
	
	
	hrtempx dw ?
	hrtempy dw ?

	totalbricks db 84
	
	score dw 0


	scrx db 10
	scry db 28
	
	counter db 0
	start dw 0


.code
main proc
    
	mov ax,@data
	mov ds,ax
	mov ax,0
	call clrscr
	call titlepage ; displaying title page
    call clrscr
    ;set video mode 
    mov ah,00h
	mov al,12h
	int 10h
	;set background color 
	mov ah,0Bh
	mov bh,00h
	mov bl,00h ;black color 
	int 10h
	;call drawheart1
	menu:
	call menupage
	
	mov ax,1
	int 16h
	mov ax,0
	int 16h
	
	cmp ah,08h
	je exit
	
	
	
	cmp ah,02h
	je o1	;option 1 
	
	cmp ah,03h
	je o1 ;option 3
	
	cmp ah,04h
	je o3 ;option 3
	
	 
	o1:
	
	j1:
	
	call clrscr
	call level1
	call preparelevel2
	call level2
	call preparelevel3
	call level3
	
	
	
	exitlevel1:
	call clrscr
    call gameover
	
	
	o2:
	
	
	jmp exit
	
	jmp o2
	
	o3:
	call clrscr
	call instruct
	jmp menu
	o4:
	
	jmp exit
	jmp o4
	
	o5:
	
	jmp exit
	jmp o5
	
	
	
	rgmove:
	call paddlerigth
	
	jmp j1
	
	lfmove:
	call paddleft

	jmp j1
	
	ret
		 

main endp



takeinput proc

	j2:
		
		
		cmp start,1
		je j3
	
	
		mov ax,1
		int 16h
		mov ax,0
		int 16h
	    
		
		cmp ax, 3920h;space to begin
		je  beg
		
		jmp j2
		
		beg:
		mov start,1
		
		j3:
		mov  ah,  1h
		int  16h         ; check keypress
		jz  noInput     ; no keypress
		mov  ah,  0h
		int  16h
	
		cmp al,08h
		je exit	
		
		cmp ah,25h
		je pause_page
		
		cmp ah,04dh
		je rgmove
	
		cmp ah,04bh
		je lfmove
	
	
		pause_page:
		    call pause_game
	    jmp noInput
	
	
		rgmove:
			call paddlerigth
	
		jmp noInput
	
		lfmove:
			call paddleft
	
	
		noInput:

	

ret
takeinput endp

drawheart1 proc

	mov ax,hrx1
	mov bx ,hry1
	mov pxlx,ax
	mov pxly,bx
	
	mov cx,20

l1:
	mov temp1,cx
	call drawpixel
	inc pxlx
	inc pxly
	mov cx,temp1
loop l1



mov cx,20

l2:
	mov temp1,cx
	call drawpixel
	inc pxlx
	dec pxly
	mov cx,temp1
loop l2


mov cx,10
l3:
	mov temp1,cx
	call drawpixel
	dec pxlx
	dec pxly
	mov cx,temp1
loop l3

mov cx,10
l4:
	mov temp1,cx
	call drawpixel
	dec pxlx
	inc pxly
	mov cx,temp1
loop l4



mov cx,10
l5:
	mov temp1,cx
	call drawpixel
	dec pxlx
	dec pxly
	mov cx,temp1
loop l5



mov cx,10
l6:
	mov temp1,cx
	call drawpixel
	dec pxlx
	inc pxly
	mov cx,temp1
	loop l6
	
	mov ax,hrx1
	mov bx ,hry1
	mov pxlx,ax
	mov pxly,bx

ret
drawheart1 endp

drawheart2 proc

	mov ax,hrx2
	mov bx ,hry2
	mov pxlx,ax
	mov pxly,bx
	mov cx,20

l1:
	mov temp1,cx
	call drawpixel
	inc pxlx
	inc pxly
	mov cx,temp1
loop l1



mov cx,20

l2:
	mov temp1,cx
	call drawpixel
	inc pxlx
	dec pxly
	mov cx,temp1
loop l2


mov cx,10
l3:
	mov temp1,cx
	call drawpixel
	dec pxlx
	dec pxly
	mov cx,temp1
loop l3

mov cx,10
l4:
	mov temp1,cx
	call drawpixel
	dec pxlx
	inc pxly
	mov cx,temp1
loop l4



mov cx,10
l5:
	mov temp1,cx
	call drawpixel
	dec pxlx
	dec pxly
	mov cx,temp1
loop l5



mov cx,10
l6:
	mov temp1,cx
	call drawpixel
	dec pxlx
	inc pxly
	mov cx,temp1
	loop l6
	
	mov ax, hrx2
	mov bx ,hry2
	mov pxlx,ax
	mov pxly,bx
	

ret
drawheart2 endp


drawheart3 proc

	mov ax,hrx3
	mov bx ,hry3
	mov pxlx,ax
	mov pxly,bx
	
	mov cx,20

l1:
	mov temp1,cx
	call drawpixel
	inc pxlx
	inc pxly
	mov cx,temp1
loop l1



mov cx,20

l2:
	mov temp1,cx
	call drawpixel
	inc pxlx
	dec pxly
	mov cx,temp1
loop l2


mov cx,10
l3:
	mov temp1,cx
	call drawpixel
	dec pxlx
	dec pxly
	mov cx,temp1
loop l3

mov cx,10
l4:
	mov temp1,cx
	call drawpixel
	dec pxlx
	inc pxly
	mov cx,temp1
loop l4



mov cx,10
l5:
	mov temp1,cx
	call drawpixel
	dec pxlx
	dec pxly
	mov cx,temp1
loop l5



mov cx,10
l6:
	mov temp1,cx
	call drawpixel
	dec pxlx
	inc pxly
	mov cx,temp1
	loop l6
	
	mov ax ,hrx3
	mov bx ,hry3
	mov pxlx,ax
	mov pxly,bx

ret
drawheart3 endp

printpause proc
mov ah,02h
mov bh,00h
mov dh,10h
mov dl,10h
int 10h
mov ah,09
lea dx,pausegame
int 21h

mov ah,02h
mov bh,00h
mov dh,12h
mov dl,10h
int 10h
mov ah,09
lea dx,pressS
int 21h
ret
printpause endp

pause_game proc
call printpause
;wait for keypress
mov ax,1
int 16h
mov ax,0
int 16h

.if al=='S'
je exit_pause 
.elseif al=='s'
je exit_pause
.else
.endif
exit_pause:
         ret
pause_game endp

paddlerigth proc 
	
	cmp pdlx2,78
	jge PREXIT

	add padx1,32
	add padx2,32
	add  pdlx1,4
	add  pdlx2,4
	
	PREXIT:
ret	
paddlerigth endp

paddleft proc

	cmp pdlx1,2
	jle PLEXIT

	sub padx1,32
	sub padx2,32
	sub pdlx1,4
	sub pdlx2,4
	
	PLEXIT:

ret
paddleft endp	

drawbricks proc

	mov cx,7
	mov si,0
	mov col,4
	r1:
	mov temp,cx
		mov ah, 6
		mov al, 0
		
		.if [checkrow1+si]  >= 1
			jmp c1
		.endif
		mov bh, 000h	
		jmp s1
		
		c1:
		mov bh, col		;color
		
		s1:
		mov ch, br1y1    ;top row of window
		mov cl, [br1x1+si]     ;left most column of window
		mov dh, br1y2     ;Bottom row of window
		mov dl, [br1x2+si]     ;Right most column of window
		int 10h		
	
	inc si
	inc col
	mov	cx,temp
	loop r1

	mov cx,7
	mov si,0
	mov col,5
	r2:
	mov temp,cx
		mov ah, 6
		mov al, 0
		
		.if [checkrow2+si]  >= 1
			jmp c2
		.endif
		
		mov bh, 000h	
		jmp s2
		
		c2:
		mov bh, col		;color
		
		s2:
		mov ch, br2y1    ;top row of window
		mov cl, [br2x1+si]     ;left most column of window
		mov dh, br2y2     ;Bottom row of window
		mov dl, [br2x2+si]     ;Right most column of window
		int 10h		
	
	inc si
	inc col
	mov	cx,temp
	loop r2

	mov cx,7
	mov si,0
	mov col,4
	r3:
	mov temp,cx
		mov ah, 6
		mov al, 0
		
		.if [checkrow3+si] >= 1
			jmp c3
		.endif
		 
		mov bh, 000h	
		jmp s3
		
		c3:
		mov bh, col		;color
		
		s3:
		mov ch, br3y1    ;top row of window
		mov cl, [br3x1+si]     ;left most column of window
		mov dh, br3y2     ;Bottom row of window
		mov dl, [br3x2+si]     ;Right most column of window
		int 10h		
	
	inc si
	inc col
	mov	cx,temp
	loop r3



ret
drawbricks endp

drawbricksl2 proc

	mov cx,7
	mov si,0
	mov col,4
	r4:
	mov temp,cx
		mov ah, 6
		mov al, 0
		
		.if [checkrow4+si]  >= 1
			jmp c4
		.endif
		mov bh, 000h	
		jmp s4
		
		c4:
		mov bh, col		;color
		
		s4:
		mov ch, br1y1    ;top row of window
		mov cl, [br1x1+si]     ;left most column of window
		mov dh, br1y2     ;Bottom row of window
		mov dl, [br1x2+si]     ;Right most column of window
		int 10h		
	
	inc si
	inc col
	mov	cx,temp
	loop r4

	mov cx,7
	mov si,0
	mov col,5
	r5:
	mov temp,cx
		mov ah, 6
		mov al, 0
		
		.if [checkrow5+si]  >= 1
			jmp c5
		.endif
		
		mov bh, 000h	
		jmp s5
		
		c5:
		mov bh, col		;color
		
		s5:
		mov ch, br2y1    ;top row of window
		mov cl, [br2x1+si]     ;left most column of window
		mov dh, br2y2     ;Bottom row of window
		mov dl, [br2x2+si]     ;Right most column of window
		int 10h		
	
	inc si
	inc col
	mov	cx,temp
	loop r5

	mov cx,7
	mov si,0
	mov col,4
	r6:
	mov temp,cx
		mov ah, 6
		mov al, 0
		
		.if [checkrow6+si] >= 1
			jmp c6
		.endif
		 
		mov bh, 000h	
		jmp s6
		
		c6:
		mov bh, col		;color
		
		s6:
		mov ch, br3y1    ;top row of window
		mov cl, [br3x1+si]     ;left most column of window
		mov dh, br3y2     ;Bottom row of window
		mov dl, [br3x2+si]     ;Right most column of window
		int 10h		
	
	inc si
	inc col
	mov	cx,temp
	loop r6



ret
drawbricksl2 endp


drawbricksl3 proc

	mov cx,7
	mov si,0
	mov col,4
	r7:
	mov temp,cx
		mov ah, 6
		mov al, 0
		
		.if [checkrow7+si]  >= 1
			jmp c7
		.endif
		mov bh, 000h	
		jmp s7
		
		c7:
		mov bh, col		;color
		
		s7:
		mov ch, br1y1    ;top row of window
		mov cl, [br1x1+si]     ;left most column of window
		mov dh, br1y2     ;Bottom row of window
		mov dl, [br1x2+si]     ;Right most column of window
		int 10h		
	
	inc si
	inc col
	mov	cx,temp
	loop r7

	mov cx,7
	mov si,0
	mov col,5
	r88:
	mov temp,cx
		mov ah, 6
		mov al, 0
		
		.if [checkrow8+si]  >= 1
			jmp c8
		.endif
		
		mov bh, 000h	
		jmp s8
		
		c8:
		mov bh, col		;color
		
		s8:
		mov ch, br2y1    ;top row of window
		mov cl, [br2x1+si]     ;left most column of window
		mov dh, br2y2     ;Bottom row of window
		mov dl, [br2x2+si]     ;Right most column of window
		int 10h		
	
	inc si
	inc col
	mov	cx,temp
	loop r88

	mov cx,7
	mov si,0
	mov col,4
	r99:
	mov temp,cx
		mov ah, 6
		mov al, 0
		
		.if [checkrow9+si] >= 1
			jmp c9
		.endif
		 
		mov bh, 000h	
		jmp s9
		
		c9:
		mov bh, col		;color
		
		s9:
		mov ch, br3y1    ;top row of window
		mov cl, [br3x1+si]     ;left most column of window
		mov dh, br3y2     ;Bottom row of window
		mov dl, [br3x2+si]     ;Right most column of window
		int 10h		
	
	inc si
	inc col
	mov	cx,temp
	loop r99



ret
drawbricksl3 endp



drawball proc
    mov cx,ballx ;initial position x-coordinate
	mov dx,bally ;initial position y-coordinate
	
	drawball_horizontal:
	
    ;set pixel position 
	mov ah,0Ch 
	mov al,0Fh ;white pixel
	mov bh,00h ;page 
	int 10h
	inc cx
	mov ax,cx
	sub ax,ballx
	cmp ax,ballsize
	jng drawball_horizontal 
	mov cx,ballx
	inc dx
	mov ax,dx
	sub ax,bally
	cmp ax,ballsize
	jng drawball_horizontal
	ret
drawball endp

drawpixel proc
    mov cx,pxlx ;initial position x-coordinate
	mov dx,pxly ;initial position y-coordinate
	
	drawpxl_horizontal:
	
    ;set pixel position 
	mov ah,0Ch 
	mov al,04h ;white pixel
	mov bh,00h ;page 
	int 10h
	inc cx
	mov ax,cx
	sub ax,pxlx
	cmp ax,pxlsize
	jng drawpxl_horizontal 
	mov cx,pxlx
	inc dx
	mov ax,dx
	sub ax,pxly
	cmp ax,pxlsize
	jng drawpxl_horizontal
	ret
drawpixel endp




drawbottom proc
   
   mov ah, 6
			mov al, 0
			mov bh, 00h     ;color
			mov ch, btmy1    ;top row of window
			mov cl, btmx1     ;left most column of window
			mov dh, btmy2     ;Bottom row of window
			mov dl, btmx2     ;Right most column of window
		int 10h		
   
	ret
drawbottom endp















clrscr proc
    mov ah,00h
	mov al,12h
	int 10h
	mov ah,0Bh
	mov bh,00h
	mov bl,00h
	int 10h
	
	
    ret
clrscr endp

moveball proc

    mov ax,ballvel_x
	add ballx , ax ;mov ball horizontally 
	
	
	mov ax,border_boundx
	cmp ballx,ax
	jl negvel_x
	
	
	mov ax,border_x
	sub ax,ballsize
	cmp ballx,ax   ;comapare if ball is colliding with left wall 
	jg negvel_x     ;if it is colliding , negate velocity
	
	
	mov ax,ballvel_y 
	add bally, ax   ;move ball vertically 
	
	mov ax,border_boundy
	cmp bally,ax
	jl negvel_y
	
	mov ax,border_y
	sub ax,ballsize
	.if bally>ax
	     inc lifescore
		 jg negvel_y
    .endif
	
	ret
	negvel_x:
	    neg ballvel_x
	    ret
	negvel_y:
	    neg ballvel_y
        ret
	
moveball endp




level1 proc
    
    ;set ball movement 
	ball_movement:
	mov ah,2CH
	int 21h
	cmp dl,previous_position
	je ball_movement
	mov previous_position,dl
	;make the ball move 
	call clrscr
	
	call drawpaddle
	call drawbricks
	call drawball
	call checkbrickr1
	call checkbrickr2
	call checkbrickr3
	call checkpaddle
	;call drawbottom
	call showscore
	call drawheart
	;call drawlives 
	call moveball
	call takeinput
	;call findloc
	
	
	.if totalbricks==63 || score ==21
		ret		
	.endif
	
	
	jmp ball_movement
    
level1 endp



; prepare game for level 2
preparelevel2 proc



	inc ballvel_x 

	mov ballx , 320 ;ball x-coordinate
	mov bally , 250

	mov start,0

	mov pdlx1 , 34
	mov	pdlx2 , 50
	mov padx1 , 272
	mov padx2 , 400
	
	call drawbricks

ret
preparelevel2 endp





level2 proc
    
    ;set ball movement 
	ball_movement:
	mov ah,2CH
	int 21h
	cmp dl,previous_position
	je ball_movement
	mov previous_position,dl
	;make the ball move 
	call clrscr
	
	call drawpaddle
	call drawbricksl2
	call drawball
	call checkbrickr4
	call checkbrickr5
	call checkbrickr6
	call checkpaddle
	;call drawbottom
	call showscore
	call drawheart
	;call drawlives 
	call moveball
	call takeinput
	;call findloc
	
	
	.if totalbricks==35 || score ==49
		ret		
	.endif
	
	
	
	jmp ball_movement
    
level2 endp
 
 ; prepare game for level 3
preparelevel3 proc

	inc ballvel_x 

	mov ballx , 320 ;ball x-coordinate
	mov bally , 250

	mov start,0

	mov pdlx1 , 34
	mov	pdlx2 , 50
	mov padx1 , 272
	mov padx2 , 400
	
	call drawbricks

ret
preparelevel3 endp


level3 proc
    
    ;set ball movement 
	ball_movement:
	mov ah,2CH
	int 21h
	cmp dl,previous_position
	je ball_movement
	mov previous_position,dl
	;make the ball move 
	call clrscr
	
	call drawpaddle
	call drawbricksl3
	call drawball
	call checkbrickr7
	call checkbrickr8
	call checkbrickr9
	call checkpaddle
	;call drawbottom
	call showscore
	call drawheart
	;call drawlives 
	call moveball
	call takeinput
	;call findloc
	
	
	.if totalbricks==0 || score == 84
		ret		
	.endif
	
	
	
	jmp ball_movement
    
level3 endp




findloc proc

	mov pxlx,10
	mov pxly,115
	
	call drawpixel
ret
findloc endp



drawheart proc
	
	call findloc
	.if lifescore == 0
	call drawheart2
	call drawheart3
	call drawheart1
	.elseif lifescore ==1
	call drawheart2
	call drawheart3
	.elseif lifescore ==2 
	call drawheart3
	.else
	     call gameover
	.endif
ret
drawheart endp

gameover proc 
    call clrscr
         ;video mode (graphic)
	mov ah, 0
	mov al, 12h
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 10    ;color
	mov ch, 3  ;top row of window
	mov cl, 3   ;left most column of window
	mov dh, 26    ;Bottom row of window
	mov dl, 76    ;Right most column of window
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 4    ;color
	mov ch, 4  ;top row of window
	mov cl, 5   ;left most column of window
	mov dh, 25    ;Bottom row of window
	mov dl, 74    ;Right most column of window
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 00    ;color
	mov ch, 5  ;top row of window
	mov cl, 7   ;left most column of window
	mov dh, 24    ;Bottom row of window
	mov dl, 72    ;Right most column of window
	int 10h
	
	mov ah,gx1
         mov al,gy1
         mov tempx1,ah
         mov tempy1,al

mov cx,10
mov si,0
l30: 	
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, gy1 
	mov dl, gx1  
	int 10h
	mov al,[gameoverstr +si] ;Print score
	mov bx,0
	mov bl,10 
	mov cx,1     
	mov ah,09h
	int 10h
	inc si
	inc gx1
	mov cx,temp
loop l30

mov ah,tempx1
mov al,tempy1
mov gx1,ah
mov gy1,al


    
ret
	
	
gameover endp

drawlives proc
        mov ah,lx1
    mov al,ly1
    mov tempx1,ah
    mov tempy1,al

    mov cx,6
    mov si,0
l31: 	
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, ly1 
	mov dl, lx1  
	int 10h
	mov al,[lives +si] ;Print score
	mov bx,0
	mov bl,10 
	mov cx,1     
	mov ah,09h
	int 10h
	inc si
	inc lx1
	mov cx,temp
loop l31

mov ah,tempx1
mov al,tempy1
mov lx1,ah
mov ly1,al
ret
drawlives endp

checkbrickr1 proc 

	mov ax,ballx
	mov bx,bally
	mov si,0
	
	
	.if bx == 25 || bx == 50 
		
		.if ax > 40 && ax < 104 && [checkrow1+si] > 0
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow1+si]
        ret
		.endif
		inc si
		
		.if ax > 120 && ax < 184  && [checkrow1+si] > 0 
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow1+si]
        ret
		.endif
		inc si
		
		.if ax > 200 && ax < 264  && [checkrow1+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow1+si]
        ret
		.endif
		inc si
		
		.if ax > 280 && ax < 344  && [checkrow1+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow1+si]
        ret
		.endif
		inc si
		
		.if ax > 360 && ax < 424  && [checkrow1+si] > 0  
		neg ballvel_y
		dec totalbricks
        inc score
		dec [checkrow1+si]
		ret
		.endif
		inc si
		
		.if ax > 440 && ax < 504  && [checkrow1+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow1+si]
        ret
		.endif
		inc si
		
		.if ax > 520 && ax < 584  && [checkrow1+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow1+si]
        ret
		.endif
		inc si
		
	.endif

ret
checkbrickr1 endp

checkbrickr2 proc 
	
	mov ax,ballx
	mov bx,bally
	mov si,0
	.if bx == 61 || bx == 88
		.if ax > 40 && ax < 104 && [checkrow2+si] > 0 
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow2+si] 
        ret
		.endif
		inc si
		
		.if ax > 120 && ax < 184  && [checkrow2+si] > 0
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow2+si] 
        ret
		.endif
		inc si
		
		.if ax > 200 && ax < 264  && [checkrow2+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow2+si] 
        ret
		.endif
		inc si
		
		.if ax > 280 && ax < 344  && [checkrow2+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow2+si]
        ret
		.endif
		inc si
		
		.if ax > 360 && ax < 424  && [checkrow2+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
        dec [checkrow2+si]
		ret
		.endif
		inc si
		
		.if ax > 440 && ax < 504  && [checkrow2+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow2+si]
        ret
		.endif
		inc si
		
		.if ax > 520 && ax < 584  && [checkrow2+si] > 0
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow2+si]
        ret
		.endif
		inc si
		
	.endif
	
	
	
	
	

ret
checkbrickr2 endp

checkbrickr3 proc
	
	mov ax,ballx
	mov bx,bally
	mov si,0
	
	.if bx == 97 || bx == 115
		.if ax > 40 && ax < 104 && [checkrow3+si] > 0
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow3+si]
        ret
		.endif
		inc si
		
		.if ax > 120 && ax < 184  && [checkrow3+si] > 0 
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow3+si]
        ret
		.endif
		inc si
		
		.if ax > 200 && ax < 264  && [checkrow3+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow3+si]
        ret
		.endif
		inc si
		
		.if ax > 280 && ax < 344  && [checkrow3+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow3+si]
        ret
		.endif
		inc si
		
		.if ax > 360 && ax < 424  && [checkrow3+si] > 0  
		neg ballvel_y
		dec totalbricks
        inc score
		dec [checkrow3+si]
		ret
		.endif
		inc si
		
		.if ax > 440 && ax < 504  && [checkrow3+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow3+si]
        ret
		.endif
		inc si
		
		.if ax > 520 && ax < 584  && [checkrow3+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow3+si]
        ret
		.endif
		inc si
		
	.endif
	

ret
checkbrickr3 endp

checkbrickr4 proc 

	mov ax,ballx
	mov bx,bally
	mov si,0
	
	
	.if bx == 25 || bx == 50 
		
		.if ax > 40 && ax < 104 && [checkrow4+si] > 0
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow4+si]
        ret
		.endif
		inc si
		
		.if ax > 120 && ax < 184  && [checkrow4+si] > 0 
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow4+si]
        ret
		.endif
		inc si
		
		.if ax > 200 && ax < 264  && [checkrow4+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow4+si]
        ret
		.endif
		inc si
		
		.if ax > 280 && ax < 344  && [checkrow4+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow4+si]
        ret
		.endif
		inc si
		
		.if ax > 360 && ax < 424  && [checkrow4+si] > 0  
		neg ballvel_y
		dec totalbricks
        inc score
		dec [checkrow4+si]
		ret
		.endif
		inc si
		
		.if ax > 440 && ax < 504  && [checkrow4+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow4+si]
        ret
		.endif
		inc si
		
		.if ax > 520 && ax < 584  && [checkrow4+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow4+si]
        ret
		.endif
		inc si
		
	.endif

ret
checkbrickr4 endp

checkbrickr5 proc 
	
	mov ax,ballx
	mov bx,bally
	mov si,0
	.if bx == 61 || bx == 88
		.if ax > 40 && ax < 104 && [checkrow5+si] > 0 
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow5+si] 
        ret
		.endif
		inc si
		
		.if ax > 120 && ax < 184  && [checkrow5+si] > 0
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow5+si] 
        ret
		.endif
		inc si
		
		.if ax > 200 && ax < 264  && [checkrow5+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow5+si] 
        ret
		.endif
		inc si
		
		.if ax > 280 && ax < 344  && [checkrow5+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow5+si]
        ret
		.endif
		inc si
		
		.if ax > 360 && ax < 424  && [checkrow5+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
        dec [checkrow5+si]
		ret
		.endif
		inc si
		
		.if ax > 440 && ax < 504  && [checkrow5+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow5+si]
        ret
		.endif
		inc si
		
		.if ax > 520 && ax < 584  && [checkrow5+si] > 0
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow5+si]
        ret
		.endif
		inc si
		
	.endif
	
	
	
	
	

ret
checkbrickr5 endp

checkbrickr6 proc
	
	mov ax,ballx
	mov bx,bally
	mov si,0
	
	.if bx == 97 || bx == 115
		.if ax > 40 && ax < 104 && [checkrow6+si] > 0
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow6+si]
        ret
		.endif
		inc si
		
		.if ax > 120 && ax < 184  && [checkrow6+si] > 0 
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow6+si]
        ret
		.endif
		inc si
		
		.if ax > 200 && ax < 264  && [checkrow6+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow6+si]
        ret
		.endif
		inc si
		
		.if ax > 280 && ax < 344  && [checkrow6+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow6+si]
        ret
		.endif
		inc si
		
		.if ax > 360 && ax < 424  && [checkrow6+si] > 0  
		neg ballvel_y
		dec totalbricks
        inc score
		dec [checkrow6+si]
		ret
		.endif
		inc si
		
		.if ax > 440 && ax < 504  && [checkrow6+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow6+si]
        ret
		.endif
		inc si
		
		.if ax > 520 && ax < 584  && [checkrow6+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow6+si]
        ret
		.endif
		inc si
		
	.endif
	

ret
checkbrickr6 endp

checkbrickr7 proc
	
	mov ax,ballx
	mov bx,bally
	mov si,0
	
	.if bx == 97 || bx == 115
		.if ax > 40 && ax < 104 && [checkrow7+si] > 0
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow7+si]
        ret
		.endif
		inc si
		
		.if ax > 120 && ax < 184  && [checkrow7+si] > 0 
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow7+si]
        ret
		.endif
		inc si
		
		.if ax > 200 && ax < 264  && [checkrow7+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow7+si]
        ret
		.endif
		inc si
		
		.if ax > 280 && ax < 344  && [checkrow7+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow7+si]
        ret
		.endif
		inc si
		
		.if ax > 360 && ax < 424  && [checkrow7+si] > 0  
		neg ballvel_y
		dec totalbricks
        inc score
		dec [checkrow7+si]
		ret
		.endif
		inc si
		
		.if ax > 440 && ax < 504  && [checkrow7+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow7+si]
        ret
		.endif
		inc si
		
		.if ax > 520 && ax < 584  && [checkrow7+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow7+si]
        ret
		.endif
		inc si
		
	.endif
	

ret
checkbrickr7 endp


checkbrickr8 proc
	
	mov ax,ballx
	mov bx,bally
	mov si,0
	
	.if bx == 97 || bx == 115
		.if ax > 40 && ax < 104 && [checkrow8+si] > 0
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow8+si]
        ret
		.endif
		inc si
		
		.if ax > 120 && ax < 184  && [checkrow8+si] > 0 
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow8+si]
        ret
		.endif
		inc si
		
		.if ax > 200 && ax < 264  && [checkrow8+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow8+si]
        ret
		.endif
		inc si
		
		.if ax > 280 && ax < 344  && [checkrow8+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow8+si]
        ret
		.endif
		inc si
		
		.if ax > 360 && ax < 424  && [checkrow8+si] > 0  
		neg ballvel_y
		dec totalbricks
        inc score
		dec [checkrow8+si]
		ret
		.endif
		inc si
		
		.if ax > 440 && ax < 504  && [checkrow8+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow8+si]
        ret
		.endif
		inc si
		
		.if ax > 520 && ax < 584  && [checkrow8+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow8+si]
        ret
		.endif
		inc si
		
	.endif
	

ret
checkbrickr8 endp

checkbrickr9 proc
	
	mov ax,ballx
	mov bx,bally
	mov si,0
	
	.if bx == 97 || bx == 115
		.if ax > 40 && ax < 104 && [checkrow9+si] > 0
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow9+si]
        ret
		.endif
		inc si
		
		.if ax > 120 && ax < 184  && [checkrow9+si] > 0 
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow9+si]
        ret
		.endif
		inc si
		
		.if ax > 200 && ax < 264  && [checkrow9+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow9+si]
        ret
		.endif
		inc si
		
		.if ax > 280 && ax < 344  && [checkrow9+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow9+si]
        ret
		.endif
		inc si
		
		.if ax > 360 && ax < 424  && [checkrow9+si] > 0  
		neg ballvel_y
		dec totalbricks
        inc score
		dec [checkrow9+si]
		ret
		.endif
		inc si
		
		.if ax > 440 && ax < 504  && [checkrow9+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow9+si]
        ret
		.endif
		inc si
		
		.if ax > 520 && ax < 584  && [checkrow9+si] > 0  
		neg ballvel_y
		dec totalbricks
		inc score
		dec [checkrow9+si]
        ret
		.endif
		inc si
		
	.endif
	

ret
checkbrickr9 endp

checkpaddle proc

	mov ax,ballx
	mov bx,bally
	
	.if  bx < 400  && bx >385
		.if ax < padx2 && ax > padx1 
			neg ballvel_y
			ret
		.endif
	.endif
ret
checkpaddle endp

drawpaddle proc
			mov ah, 6
			mov al, 0
			mov bh, 15     ;color
			mov ch, pdly1    ;top row of window
			mov cl, pdlx1     ;left most column of window
			mov dh, pdly2     ;Bottom row of window
			mov dl, pdlx2     ;Right most column of window
		int 10h		

ret 
drawpaddle endp	



titlepage proc
    ;video mode (graphic)
	mov ah, 0
	mov al, 12h
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 12    ;color
	mov ch, 3  ;top row of window
	mov cl, 3   ;left most column of window
	mov dh, 26    ;Bottom row of window
	mov dl, 76    ;Right most column of window
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 11    ;color
	mov ch, 4  ;top row of window
	mov cl, 5   ;left most column of window
	mov dh, 25    ;Bottom row of window
	mov dl, 74    ;Right most column of window
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 00    ;color
	mov ch, 5  ;top row of window
	mov cl, 7   ;left most column of window
	mov dh, 24    ;Bottom row of window
	mov dl, 72    ;Right most column of window
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 10    ;color
	mov ch, 8  ;top row of window
	mov cl, 27  ;left most column of window
	mov dh, 12    ;Bottom row of window
	mov dl, 50   ;Right most column of window
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 00    ;color
	mov ch, 9  ;top row of window
	mov cl, 29   ;left most column of window
	mov dh, 11    ;Bottom row of window
	mov dl, 48   ;Right most column of window
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 11    ;color
	mov ch, 18  ;top row of window
	mov cl, 18   ;left most column of window
	mov dh, 22    ;Bottom row of window
	mov dl, 60   ;Right most column of window
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 00    ;color
	mov ch, 19  ;top row of window
	mov cl, 20   ;left most column of window
	mov dh, 21    ;Bottom row of window
	mov dl, 58   ;Right most column of window
	int 10h

	mov cx, 18 
	mov si,0
l2: 			;; for print Brick Breaker Game
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, ty1   
	mov dl, tx1  
	int 10h


	mov al,[arr1 +si] ;Print arr1
	mov bx,0
	mov bl,1110b  
	mov cx,1     
	mov ah,09h
	int 10h

	inc si
	inc tx1
	mov cx,temp
loop l2



mov cx, 18 
mov si,0
l3:             ;; for print input user name
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, ty2    ;y axis
	mov dl, tx2    ;x axis
	int 10h


	mov al,[arr2 +si] ;Print arr2
	mov bx,0
	mov bl,1110b  
	mov cx,1     
	mov ah,09h
	int 10h

	inc si
	inc tx2
	mov cx,temp
loop l3




	;setting cursor position +1
	mov ah, 2
	mov dh, ty2   ;y axis 
	mov dl, tx2 	; x axis
	int 10h


	
	


	mov si,0
	mov cx,10
l1:
	mov ah,1
	int 21h
	mov char,al
	mov [mystr+si],al
	cmp al,'$'
	je e1
	
	inc si
	
loop l1

e1:
ret
titlepage endp 

menupage proc

;outer border of title page 
	mov ah, 6
	mov al, 0
	mov bh, 12    
	mov ch, 3  
	mov cl, 3   
	mov dh, 26    
	mov dl, 76    
	int 10h
    ;inner border of title page 
	mov ah, 6
	mov al, 0
	mov bh, 11    
	mov ch, 4  
	mov cl, 5   
	mov dh, 25    
	mov dl, 74    
	int 10h
	mov ah, 6
	mov al, 0
	mov bh, 00
	mov ch, 5 
	mov cl, 7   
	mov dh, 24    
	mov dl, 72    
	int 10h
mov ah,mx0
mov al,my0
mov tempx1,ah
mov tempy1,al

mov cx, 29
mov si,0
l0: 			; for print  main menu
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, my0   
	mov dl, mx0  
	int 10h


	mov al,[arr9 +si] ;Print arr1
	mov bx,0
	mov bl,15  
	mov cx,1     
	mov ah,09h
	int 10h

	inc si
	inc mx0
	mov cx,temp
loop l0

mov ah,tempx1
mov al,tempy1
mov mx0,ah
mov my0,al

;--------------
mov ah,mx2
mov al,my2
mov tempx1,ah
mov tempy1,al


;-------------------
mov ah,mx1
mov al,my1
mov tempx1,ah
mov tempy1,al

mov cx, 29
mov si,0
l5: 			;; for print  new game text 
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, my1   
	mov dl, mx1  
	int 10h


	mov al,[arr4 +si] ;Print arr1
	mov bx,0
	mov bl,15  
	mov cx,1     
	mov ah,09h
	int 10h

	inc si
	inc mx1
	mov cx,temp
loop l5

mov ah,tempx1
mov al,tempy1
mov mx1,ah
mov my1,al

;--------------
mov ah,mx2
mov al,my2
mov tempx1,ah
mov tempy1,al


mov cx, 29
mov si,0
l6: 			;; for print  resume 
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, my2   
	mov dl, mx2  
	int 10h


	mov al,[arr5 +si] ;Print arr1
	mov bx,0
	mov bl,15  
	mov cx,1     
	mov ah,09h
	int 10h

	inc si
	inc mx2
	mov cx,temp
loop l6
mov ah,tempx1
mov al,tempy1
mov mx2,ah
mov my2,al


;--------------

mov ah,mx3
mov al,my3
mov tempx1,ah
mov tempy1,al

mov cx, 29
mov si,0
l7: 			;; for print  instruction
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, my3   
	mov dl, mx3  
	int 10h


	mov al,[arr6 +si] ;Print arr1
	mov bx,0
	mov bl,15  
	mov cx,1     
	mov ah,09h
	int 10h

	inc si
	inc mx3
	mov cx,temp
loop l7
mov ah,tempx1
mov al,tempy1
mov mx3,ah
mov my3,al


;-------------

mov ah,mx4
mov al,my4
mov tempx1,ah
mov tempy1,al
mov cx, 29
mov si,0
l8: 			;; for print  high score
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, my4   
	mov dl, mx4  
	int 10h


	mov al,[arr7 +si] ;Print arr1
	mov bx,0
	mov bl,15 
	mov cx,1     
	mov ah,09h
	int 10h

	inc si
	inc mx4
	mov cx,temp
loop l8
mov ah,tempx1
mov al,tempy1
mov mx4,ah
mov my4,al

;------------------

mov ah,mx5
mov al,my5
mov tempx1,ah
mov tempy1,al
mov cx,29
mov si,0
l9: 			;; for print  exit
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, my5   
	mov dl, mx5  
	int 10h


	mov al,[arr8 +si] ;Print arr1
	mov bx,0
	mov bl,15 
	mov cx,1     
	mov ah,09h
	int 10h

	inc si
	inc mx5
	mov cx,temp
loop l9
mov ah,tempx1
mov al,tempy1
mov mx5,ah
mov my5,al
;----------------------


mov ah,mx7
mov al,my7
mov tempx1,ah
mov tempy1,al

mov cx, 10
mov si,0
l10: 			;; for print user name 
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, my7   
	mov dl, mx7  
	int 10h


	mov al,[arr10 +si] ;Print arr1
	mov bx,0
	mov bl,10 
	mov cx,1     
	mov ah,09h
	int 10h

	inc si
	inc mx7
	mov cx,temp
loop l10

mov ah,tempx1
mov al,tempy1
mov mx7,ah
mov my7,al
;--------------------
mov ah,mx8
mov al,my8
mov tempx1,ah
mov tempy1,al

mov cx, 10
mov si,0
l11: 			;; for print user name 
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, my8   
	mov dl, mx8 
	int 10h


	mov al,[mystr +si] ;Print arr1
	mov bx,0
	mov bl,10 
	mov cx,1     
	mov ah,09h
	int 10h

	inc si
	inc mx8
	mov cx,temp
loop l11

mov ah,tempx1
mov al,tempy1
mov mx8,ah
mov my8,al


;setting cursor position
	mov ah, 2
	mov dh, 10   
	mov dl, 20 
	int 10h

ret
menupage endp

instruct proc
   ;video mode (graphic)
	mov ah, 0
	mov al, 12h
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 12    ;color
	mov ch, 3  ;top row of window
	mov cl, 3   ;left most column of window
	mov dh, 26    ;Bottom row of window
	mov dl, 76    ;Right most column of window
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 11    ;color
	mov ch, 4  ;top row of window
	mov cl, 5   ;left most column of window
	mov dh, 25    ;Bottom row of window
	mov dl, 74    ;Right most column of window
	int 10h

	mov ah, 6
	mov al, 0
	mov bh, 00    ;color
	mov ch, 5  ;top row of window
	mov cl, 7   ;left most column of window
	mov dh, 24    ;Bottom row of window
	mov dl, 72    ;Right most column of window
	int 10h
	




mov ah,mx1
mov al,my1
mov tempx1,ah
mov tempy1,al

mov cx, 12
mov si,0
l22: 	
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, my1  
	mov dl, mx1 
	int 10h


	mov al,[arrins0 +si] ;Print arr1
	mov bx,0
	mov bl,10 
	mov cx,7     
	mov ah,09h
	int 10h
	inc si
	inc mx1
	mov cx,temp
loop l22

mov ah,tempx1
mov al,tempy1
mov mx1,ah
mov my1,al



mov ah,mx2
mov al,my2
mov tempx1,ah
mov tempy1,al

mov cx, 31
mov si,0
l20: 	
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, my2  
	mov dl, mx2 
	int 10h


	mov al,[arrins1 +si] ;Print arr1
	mov bx,0
	mov bl,10 
	mov cx,7     
	mov ah,09h
	int 10h
	inc si
	inc mx2
	mov cx,temp
loop l20

mov ah,tempx1
mov al,tempy1
mov mx2,ah
mov my2,al

mov ah,mx3
mov al,my3
mov tempx1,ah
mov tempy1,al

mov cx, 39
mov si,0
l21: 	
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, my3  
	mov dl, mx3 
	int 10h


	mov al,[arrins2 +si] ;Print arr1
	mov bx,0
	mov bl,10 
	mov cx,7     
	mov ah,09h
	int 10h
	inc si
	inc mx3
	mov cx,temp
loop l21

mov ah,tempx1
mov al,tempy1
mov mx3,ah
mov my3,al


	mov ax,1
	int 16h
	mov ax,0
	int 16h

instruct endp

showscore proc


mov ah,scrx
mov al,scry
mov tempx1,ah
mov tempy1,al
mov si,0
mov cx,9
l12: 			;; for print user name 
	mov temp,cx
	;setting cursor position
	mov ah, 2
	mov dh, scry   
	mov dl, scrx  
	int 10h


	mov al,[arr13 +si] ;Print arr1
	mov bx,0
	mov bl,10 
	mov cx,1     
	mov ah,09h
	int 10h

	inc si
	inc scrx
	mov cx,temp
loop l12

	
	call scoredigit
	
mov ah,tempx1
mov al,tempy1
mov scrx,ah
mov scry,al


	




ret
showscore endp




scoredigit proc

	mov ah, 2
	mov dh, scry    ;y axis 
	mov dl, scrx	; x axis
	int 10h


 OUTPUT:
     mov dx, 0
	MOV AX, score
	MOV Bx, 10
	L1:
          mov dx, 0
		CMP Ax, 0
		JE DISP
		DIV Bx
		MOV cx, dx
		PUSH CX
		inc counter
		MOV AH, 0
		JMP L1

DISP:
	CMP counter, 0
	JE EXITfun
	POP DX
	ADD DX, 48
	MOV AH, 02H
	INT 21H
	dec counter
	JMP DISP

	EXITfun:
	



ret 
scoredigit endp

exit:

call clrscr

mov dx, offset strbs
	mov ah, 9
	int 21h
	
mov ah, 4ch
	int 21h
	end