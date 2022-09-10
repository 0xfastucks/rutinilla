
[org 0x7c00]

mov dx, 0xf		; 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


mov bx, _Str
add bx, 5


call print_hex;();
jmp $




;void
print_hex:;{

mov cx, _pow
mov al, 0x00
add al, 15		; max pow summatory: 1+2+4+8

_loop:
push dx
and dx, 1
	je		_true
	jne		_false
	_jumped:
cmp cx, 0
	je		_init_cx	; mov cx, 0x00, sub al, 15, push cx, mov cl, al, mov al, 15, sub al, dl, pop cx, jmp _addvtostr, jmp continue
	_reseted:
pop dx
shr dx, 1
cmp dx, 0			; 0x0000 whole shifted
	je		break
jmp _loop
	break:
		call print_string
ret
	
;}
	
	
_true:
	add al, cl			; adding pow to al summatory
	add cx, 1
	jmp _jumped
_false:
	add al, 0			; nothing
	add cx, 1
	jmp _jumped

_init_cx:
	push cx
	mov cx, 0x00
	sub al, 15
	mov cl, al
	mov al, 15
	sub al, cl
	pop cx
	jmp _add_value
	mov bl, al
	sub bx, 1
	mov al, 0x00
	jmp _reseted

_add_value:
  ;...;

print_string:
	mov ah, 0x0e
	mov al, bl
	int 0x10
	add bx, 1
	mov al, bl
	int 0x10
	add bx, 1
	mov al, bl
	int 0x10
	ret


;data
; this will be bx ;
_Str: db '0x0000', 0
; this will be cx ;
_pow: db '1248', 0


times 510-($-$$) db 0
dw 0xaa55
