; primeira Tela jogo
; Gabriel Estrela - 8124138 | Luiz Eduardo Dorici - 4165850

jmp main

tela1linha0:   string "                                        "
tela1linha1:   string "                                        "
tela1linha2:   string "                                        "
tela1linha3:   string "                                        "
tela1linha4:   string "                                        "
tela1linha5:   string "                                        "
tela1linha6:   string "                                        "
tela1linha7:   string "                                        "
tela1linha8:   string "                                        "
tela1linha9:   string "                                        "
tela1linha10:  string "                                        "
tela1linha11:  string "                                        "
tela1linha12:  string "                                        "
tela1linha13:  string "                                        "
tela1linha14:  string "               START                    "
tela1linha15:  string "                                        "
tela1linha16:  string "            Name:                       "
tela1linha17:  string "                                        "
tela1linha18:  string "                                        "
tela1linha19:  string "                                        "
tela1linha20:  string "                                        "
tela1linha21:  string "                                        "
tela1linha22:  string "                                        "
tela1linha23:  string "                                        "
tela1linha24:  string "                                        "
tela1linha25:  string "                                        "
tela1linha26:  string "                                        "
tela1linha27:  string "                                        "
tela1linha28:  string "                                        "
tela1linha29:  string "           MADE BY NOBODY               "

tela2linha0:   string " Player:                                "
tela2linha1:   string "                                        "
tela2linha2:   string "                                        "
tela2linha3:   string "                                        "
tela2linha4:   string "                                        "
tela2linha5:   string "                                        "
tela2linha6:   string "                                        "
tela2linha7:   string "                                        "
tela2linha8:   string "                                        "
tela2linha9:   string "                                        "
tela2linha10:  string "                                        "
tela2linha11:  string "                                        "
tela2linha12:  string "                                        "
tela2linha13:  string "                                        "
tela2linha14:  string "                                        "
tela2linha15:  string "                                        "
tela2linha16:  string "                                        "
tela2linha17:  string "                                        "
tela2linha18:  string "                                        "
tela2linha19:  string "                                        "
tela2linha20:  string "                                        "
tela2linha21:  string "                                        "
tela2linha22:  string "                                        "
tela2linha23:  string "                                        "
tela2linha24:  string "                                        "
tela2linha25:  string "                                        "
tela2linha26:  string "                                        "
tela2linha27:  string "                                        "
tela2linha28:  string "                                        "
tela2linha29:  string "                                        "

nickname: var #15

main:
	loadn r1, #tela1linha0 ; endereco da primeira linha 
	loadn r2, #256 ; cor
	
	
	call imprimeTela
	
	
	call ler_teclado
	
	halt
;----------------------------------------------------------------------IMPRIME-TELA-------------------------------------//
imprimeTela:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	loadn r0, #0 ; pos inicial OBS: TEM QUE SER O COMECO DA Tela
	loadn r3, #40 ; Incremento da pos da tela
	loadn r4, #41 ; Incremento do ponteiro das linhas da tela
	loadn r5, #1200 ; Limite da tela, criterio de parada
	
	ImprimeTelaLoop:
		call Imprimestr
		
		add r0, r0, r3 ; Incrementa pos para a segunda linha na tela --> r0 = r0 + 40
		add r1, r1, r4 ; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 ...)
		cmp r0, r5 ; compara r0 com 1200
		jne ImprimeTelaLoop ; Enquanto r0 < 1200
	
	pop r7
	pop r6
	pop	r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	
	rts
;----------------------------------------------------------------------IMPRIME-TELA-------------------------------------//

;-------------------------------------------------------------------------------------------------------------------------
	
;----------------------------------------------------------------------IMPRIME-STRING-----------------------------------//
	
Imprimestr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

ImprimestrLoop:	
	loadi r4, r1 ; passa o conteudo do end. da string para r4
	cmp r4, r3 ; compara com o criterio de parada
	jeq ImprimestrSai ; se for igual termina
	add r4, r2, r4 ; add cor
	outchar r4, r0 ; imprime na tela na pos armazenada por r0
	inc r0 ; caminha a pos na tela
	inc r1 ; caminha o ponteiro da str
	jmp ImprimestrLoop
	
ImprimestrSai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts

;----------------------------------------------------------------------IMPRIME-STRING-----------------------------------//

;-------------------------------------------------------------------------------------------------------------------------


;----------------------------------------------------------------------IMPRIME-TECLADO---------------------------------//
	
ler_teclado:
	push r0
	push r1
	push r2
	push r3
	push r4
	
	loadn r3, #255 ; registrador para verificar se o ususario digitou alguma coisa
	loadn r1, #13 ; codigo do enter
	loadn r0, #657 ; pos na tela
	loadn r4, #nickname ; anota o primeiro endereco da string
	
	loopTecla:
		inchar r2 ; le do teclado
		cmp r2, r3 ; compara com valor nulo
		jeq loopTecla ; se iguala nulo, faz o procedimento novamente
		outchar r2, r0 ; imprime na	tela
		storei r4, r2 ; passa o conteudo da leitura do teclado em r2 para endereco de memoria apontado por r4
		inc r4
		inc r0 ; incrementa pos na tela
		cmp r2, r1 ; verifica se eh o ENTER
		jne loopTecla ; se noa for enter termina o procedimento
		loadn r2, #'\0'
		storei r4, r2 ; coloca o caracter de termino de strig	
		ceq imprimeTela2
			
fim_da_leitura:		
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
;----------------------------------------------------------------------IMPRIME-TECLADO---------------------------------//	

;----------------------------------------------------------------------IMPRIME-SEGUNDA-TELA----------------------------//
imprimeTela2:
	push r0
	push r1
	push r2
	push r3
	push r4
	push r5
	push r6
	push r7
	
	loadn r1, #tela2linha0 ; carrega endereco inicial novo da segunda tela
	loadn r2, #256 ; cor da letra
	loadn r0, #0 ; pos inicial OBS: TEM QUE SER O COMECO DA Tela
	loadn r3, #40 ; Incremento da pos da tela
	loadn r4, #41 ; Incremento do ponteiro das linhas da tela
	loadn r5, #1200 ; Limite da tela, criterio de parada
	
	ImprimeTelaLoop2:
		call Imprimestr
		
		add r0, r0, r3 ; Incrementa pos para a segunda linha na tela --> r0 = r0 + 40
		add r1, r1, r4 ; incrementa o ponteiro para o comeco da proxima linha na memoria (40 + 1 ...)
		cmp r0, r5 ; compara r0 com 1200
		jne ImprimeTelaLoop2 ; Enquanto r0 < 1200
		
		loadn r0, #8 ; pos na tela para impressao do nickname
		loadn r1, #nickname ; end. inicial da string nickname
		loadn r2, #1792 ; cor prata
		call Imprimestr
	
	pop r7
	pop r6
	pop	r5
	pop r4
	pop r3
	pop r2
	pop r1
	pop r0
	
	rts
;----------------------------------------------------------------------IMPRIME-SEGUNDA-TELA----------------------------//