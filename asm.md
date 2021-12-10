# Assembleur

## Code de retour (Exit Status)

Le code de retour (exit status) d'un programme est le nombre qu'il renvoie pour\
signifier l'état d'exécution du programme. S'il est exécuté correctement, la\
convention est de retourner 0, sinon on renvoie un code différent de 0, un code\
d'erreur. Il est à la responsabilité du développeur de définir les codes de\
retour appropriés pour chaque cas.

Les programmes ASM renvoient le code de retour en le passant à l'appel système\
(syscall) `exit` comme premier argument, en `rdi`.

## Constantes numériques avec [NASM](https://www.nasm.us/doc/nasmdoc3.html#section-3.4.1)

```asm
mov     ax,200          ; decimal 
mov     ax,0200         ; still decimal 
mov     ax,0200d        ; explicitly decimal 
mov     ax,0d200        ; also decimal 
mov     ax,0c8h         ; hex 
mov     ax,$0c8         ; hex again: the 0 is required 
mov     ax,0xc8         ; hex yet again 
mov     ax,0hc8         ; still hex 
mov     ax,310q         ; octal 
mov     ax,310o         ; octal again 
mov     ax,0o310        ; octal yet again 
mov     ax,0q310        ; octal yet again 
mov     ax,11001000b    ; binary 
mov     ax,1100_1000b   ; same binary constant 
mov     ax,1100_1000y   ; same binary constant once more 
mov     ax,0b1100_1000  ; same binary constant yet again 
mov     ax,0y1100_1000  ; same binary constant yet again
```

## L'instruction `xor rdi, rdi`

Est l'équivalente de

```asm
mov rdi, 0
```

Elles mettent à zéro le registre `rdi`. L'utilisation de `xor` est plus petite\
que `mov` en mémoire (1 byte contre 9 bytes pour `mov` avec opérande).

## Instructions `je` et `jz`

Il s'agit de la même instruction, écrite différemment.

# Instructions `ja`/`jb` et `jl`/`jg`

`jg` et `jl` sont utilisés pour effectuer des `jumps` après une comparaison\
signée.

```asm
mov rax, 42
mov rcx, -1
cmp rax, rcx
jl rcx          ; ce jump ne ser pas effectué
```

`ja` et `jb` sont utilisés pour effectuer des sauts après une comparaison non\
signée

```asm
mov rax, 42
mov rcx, -1
cmp rax, rcx
jb rcx          ; ce jump sera effectué
```

## Tester si `rax` est 0 sans `cmp`

```asm
test rax, rax
jz _my_label

_my_label:
    ; on jump ici si rax égal à 0
```

## Little Endian

```asm
section .data
test: dq -1         ; on a commencé avec test = 0xFFFFFFFFFFFFFFFF

section .text

; dans les lignes suivantes, on écrit les 8 premiers bytes séparément 
; dans le registre
mov byte[test], 1	; test: 01 FF FF FF FF FF FF FF
mov word[test], 1	; test: 01 00 FF FF FF FF FF FF
mov dword[test], 1	; test: 01 00 00 00 FF FF FF FF
mov qword[test], 1	; test: 01 00 00 00 00 00 00 00
```

La convention Little Endian explique pourquoi on voit le format 8 bytes se\
remplir de zéros de gauche à droite. Les bytes en mémoire sont stockés dans\
l'ordre inverse, le byte le moins significatif étant le premier.
