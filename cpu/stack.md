# Pile (Stack) & pile matérielle (Hardware stack)

Une pile en général est une structure de données. Elle supporte deux\
opérations: 1) pousser un élément au-dessus d'elle et 2) extraire l'élément le\
plus haut. Plus communément appelée:
[LIFO](https://fr.wikipedia.org/wiki/Last_in,_first_out).

La pile matérielle implémente cette abstraction sur la mémoire par le biais\
d'instructions et d'un registre, pointant sur le dernier élément de la pile.\
Il s'agit donc d'une émulation de la pile (stack) dans la mémoire existante,\
où chaque byte à son adresse.

Une pile est non seulement utilisée pour les calculs, mais aussi pour stocker\
les variables locales et met en oeuvre la séquence d'appel de fonctions dans\
les différents langages de programmation.

L'émulation est implémentée à l'aide :

- du registre `rsp` (`register stack pointer`), qui pointe sur le dernier\
  élément qui a été mis dans la pile.
- d'instructions de la machine qui utilisent `rsp` pour identifier le dernier\
  élément de la pile. Elles poussent (push) et extraient (pop) des éléments\
  de la pile et changent `rsp` en conséquence.

  Ces instructions sont :
  - `push`
  - `pop`
  - `call`
  - `ret`
  - `int`
