; ler caracteres do teclado com o comando inchar
; enter = 13
; criar uma funcao para ler do teclado



jmp main

nickname: var #10
main:
	
	call ler_teclado
	
	loadn r0, #1234
	
	call imprimestring
	
	halt
	
ler_teclado:
	push r0
	push r1
	push r2
	push r3
	push r4
	
	loadn r3, #255 ; registrador para verificar se o ususario digitou alguma coisa
	loadn r1, #13 ; codigo do enter
	loadn r0, #1 ; pos na tela
	loadn r4, #nickname ; anota o primeiro endereco da string
	
	loopTecla:
		inchar r2 ; le do teclado
		cmp r2, r3 ; compara com valor nulo
		jeq loopTecla ; se iguala nulo, faz o procedimento novamente
		outchar r2, r0 ; imprime na	tela
		storei r4, r2 ; passa o conteudo da leitura do teclado em r2 para endereco de memoria apontado por r4
		inc r4 ;icaminha com o ponteiro da string
		inc r0 ; incrementa pos na tela
		cmp r2, r1 ; verifica se eh o ENTER
		jne loopTecla ; se noa for enter termina o procedimento	
		inc r4
		loadn r4, #'\0'
			
fim_da_leitura:		
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	

imprimestring:
	push r0
	push r1
	push r2
	push r3
	
	loadn r0, #40 ; pos na tela
	loadn r1, #nickname
	loadn r2, #256 ; cor
	loadn r3, #0 ; cond. parada
	
	loopstring:
		cmp r1, r3
		jeq sai_loop_str
		add r1, r1, r2
		outchar r1, r0
		inc r0
		inc r1
		jmp loopstring
		
sai_loop_str:
	pop r3
	pop r2
	pop r1
	pop r0
	
	rts	
	
	