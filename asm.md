# Assembleur

## Code de retour (Exit Status)

Le code de retour (exit status) d'un programme est nombre qu'il renvoie pour\
signifier l'état d'exécution du programme. S'il est exécuté correctement, la\
convention est de retourner 0, sinon on renvoie un code différent de 0, un code\
d'erreur. Il est à la responsabilité du développeur de définir les codes de\
retour appropriés pour chaque cas.

Les programmes ASM renvoient le code de retour en le passant à l'appel système\
(syscall) `exit` comme premier argument, en `rdi`.

## L'instruction `xor rdi, rdi`

Est l'équivalente de

```asm
mov rdi, 0
```

Elles mettent à zéro le registre `rdi`. L'utilisation de `xor` est plus petite\
que `mov` en mémoire (1 byte contre 9 bytes pour `mov` avec opérande).

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
