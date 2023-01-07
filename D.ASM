
.386p

_TEXT	SEGMENT	DWORD PUBLIC 'CODE'
	ASSUME	cs:_TEXT32


	PUBLIC	decode
decode:
;	int	3
	push	ebp
	mov	ebp,esp
	push	esi
	push	ebx
	push	ecx
	mov	esi,[ebp+8]
	mov	ecx,[ebp+12]

	mov	eax,2349eb12h
	mov	ebx,439a9efah

	mov     ebp,ebx
	shr     ecx,3
loop_:
	rol     eax,9
	mov     edx,eax
	sar     edx,1fh
	and     edx,001abb09h
	add     eax,edx
	ror     ebp,1
	mov     ebx,[esi]
	xor     ebx,eax
	xchg    bl,bh
	xor     ebp,ebx
	mov     [esi],ebx
	mov     ebx,[esi+04]
	xor     ebx,ebp
	ror     ebx,10h
	xor     eax,ebx
	mov     [esi+04],ebx
	add     esi,8
	dec     ecx
	jnz     loop_

	pop	ecx
	pop	ebx
	pop	esi
	pop	ebp
	ret

_TEXT	ENDS

END
