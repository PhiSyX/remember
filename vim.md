# VIM

Ce document me sert à me rappeler de certaines combinaisons de touches à
effectuer pour certaines manipulations de textes avec vim avec des exemples.

> **WARNING**: Tout d'abord, j'aimerai préciser que je ne suis pas un expert de
> vim. Je n'ai pas suivi de formations avancées ou particulières sur vim. Mes
> connaissances sur le sujet sont simples, et basiques. J'ai appris sur le tas,
> grâce à des recherches sur le moteur de recherche que j'utilise, et grâce à
> des personnes qui m'ont gentiment répondu dans des Chat IRC ou Discord sur
> certaines combinaisons/séquences de touches.
>
> Le but de ce document n'est pas de décrire toutes les combinaisons/séquences
> de touches. Ce n'est pas un cours de / un tutoriel sur / une introduction à /
> ou un document de référence pour : vim. Il y a d'ailleurs de forte chance que
> je puisse raconter quelques âneries quant à l'explication de certaines
> combinaisons/séquences de touches.\
> Il se peut également qu'il y ait quelques fautes/coquilles par ci, par là.

---

Les touches décrites dans ce document correspondent à une disposition AZERTY
BELGE, car j'ai ce type de clavier.

![Disposition AZERTY BE](https://upload.wikimedia.org/wikipedia/commons/2/2a/KB_-_AZERTY_-_BE_-_Windows_-_BE.png)

> Source de l'image:
> [Wikipédia](https://fr.wikipedia.org/wiki/AZERTY#/media/Fichier:KB_-_AZERTY_-_BE_-_Windows_-_BE.png)

---

## Vocabulaires

- `une/la touche` correspond à une touche du clavier.
- `de/des/les touches` correspond à une combinaison/séquence de touches du
  clavier.

- `curseur` correspond au curseur du texte et non pas le curseur de la souris,
  ou autre curseur.

- `char` correspond à un seul caractère, n'importe lequel.
- `chars` correspond à plusieurs caractères, n'importe lesquels.

Pour les exemples qui seront donnés:

- les touches sont reconnaissables sous cette forme <kbd>KDB</kbd> ;
- les touches ressemblant à <kbd>&lt;C-char&gt;</kbd>, représenteront les
  touches de `Control` / `CTRL` ;\
  Par exemple: <kbd>&lt;C-a&gt;</kbd> équivaut à `CTRL`+`a`.

- le caractère ▒ représente la position du curseur de texte ;
- deux caractères `▒` englobant du texte, représente une ▒sélection de texte▒.

- les lignes mises en évidence avec la couleur orange, sont des des lignes où il
  y a une ▒sélection de texte▒.
- les lignes commençant par `@@ keystroke:` et se terminant par `@@` sont des
  instructions effectués sur la position du curseur, des frappes du clavier à
  effectuer.

- du texte qui contient ces caractères `<>` correspond à quelque chose qui est
  obligatoire.\
  Par exemple: `<char>`
- du texte qui contient ces caractères `[]` correspond à quelque chose qui est
  optionnel.\
  Par exemple: `[number]`

---

## Recherche dans le fichier courant

La "commande" <kbd>/`<chars>`</kbd> permet de faire une recherche à partir de la
position du curseur vers la droite/le bas. Nous avons également la possibilité
de faire une recherche "inverse" à partir de la position du curseur vers la
gauche/le haut en utilisant <kbd>?`<chars>`</kbd>.

Pour aller à l'occurrence suivante, il suffit d'entrer <kbd>/</kbd> ou d'appuyer
sur <kbd>n</kbd> pour aller plus vite.\
Pour aller à l'occurrence précédente, il suffit d'entrer <kbd>?</kbd> ou
d'appuyer sur <kbd>N</kbd>.

```diff
# ▒Lorem ipsum dolor, sit amet consectetur adipisicing el.
# Commodi quae architecto assumenda, fugit dicta ducimus.
# Amet illum sint laborum earum id modi saepe cumque, facere dolorem quibusdam veritatis omnis ullam?

@@  keystroke: /it    @@
@@  keystroke: ENTER ↵  @@
! Lorem ipsum dolor, s▒it▒ amet consectetur adipisicing el.
# Commodi quae architecto assumenda, fugit dicta ducimus.
# Amet illum sint laborum earum id modi saepe cumque, facere dolorem quibusdam veritatis omnis ullam?

@@  keystroke: /        @@
@@  keystroke: ENTER ↵  @@
# Lorem ipsum dolor, sit amet consectetur adipisicing el.
! Commodi quae arch▒it▒ecto assumenda, fugit dicta ducimus.
# Amet illum sint laborum earum id modi saepe cumque, facere dolorem quibusdam veritatis omnis ullam?

@@  keystroke: N        @@
! Lorem ipsum dolor, s▒it▒ amet consectetur adipisicing el.
# Commodi quae architecto assumenda, fugit dicta ducimus.
# Amet illum sint laborum earum id modi saepe cumque, facere dolorem quibusdam veritatis omnis ullam?
```

---

La touche <kbd>.</kbd> permet de répéter la dernière action effectuée.\
La touche <kbd>;</kbd> permet de répéter la dernière action, qui n'altère pas le
texte (couper/coller), effectuée.

Certaines touches s'attendent à recevoir d'autres _séquences de_ touches, qui
les suffixes, pour effectuer leur action. Suivant les touches qui les suivent,
l'action peut être totalement différente. Nous appellerons ça, une "sequence de
touches".

## Déplacement du curseur

Il est possible de déplacer le curseur sur **une ligne** jusqu'à un caractère
donné ou avant un caractère donné. Par exemple, avec la séquence de touches
<kbd>f`<char>`</kbd> ou <kbd>t`<char>`</kbd>.

```diff
+ S░alut tout le monde

@@  keystroke: fo  @@
- S░alut tout le monde
+ Salut t░out le monde

@@  keystroke: to  @@
- Salut t░out le monde
+ Salut tout le ░monde
```

Pour aller dans le sens inverse, il suffit d'utiliser la touche
<kbd>F`<char>`</kbd> ou <kbd>T`<char>`</kbd>.

De manière générale, lorsqu'une touche est écrite en **MAJUSCULE**, c'est
qu'elle est associée à une action qui a pour but d'effectuer une action vers le
sens inverse d'un texte, **avant** le(s) caractère(s) qui le(s) sui(ven)t. Ça
n'est pas une "règle" que j'aie lu officiellement ou lu dans les bas-fonds des
internets, mais il s'agit d'une constatation. Ne pas prendre pas cette phrase au
pied de la lettre. Nous verrons d'ailleurs _peut-être_ plus tard des
contres-exemples.

## Suppression

(En vérité, vim ne supprime pas tout à fait le texte qu'on lui demande de
retirer. Il le garde plutôt en tampon/mémoire. Comme le bon vieux classique
`couper` avec `CTRL + X`.)

- Séquence avec <kbd>d`<char>`</kbd> : après son action, le mode reste en
  "`NORMAL`".
- Séquence avec <kbd>c`<char>`</kbd> : après son action, le mode passe en
  "`INSERT`".

Ce qui est cool avec vim, c'est que nous pouvons enchaîner les actions. C'est à
dire que si nous voulions supprimer du texte depuis la position du curseur
jusqu'à un caractère précis, nous pourrions le faire. Car rappelons le:

> Certaines touches s'attendent à recevoir d'autres _séquences de_ touches, qui
> les suffixes, pour effectuer leur(s) action(s).

En l'occurrence ici <kbd>d</kbd> est une séquence et nous pouvons donc très bien
nous imaginer donner une séquence de touches pour le déplacement du curseur, que
nous avions vu plus précédemment, à cette dernière. Que se passera donc t'il si
nous donnons la combinaison <kbd>f`<char>`</kbd> à <kbd>d</kbd> ?
(<kbd>df`<char>`</kbd>)

```diff
+ Hey!
+ Salut tout le monde
+ Comment va░ t'on ?

@@  keystroke: dfn  @@
+ Hey!
+ Salut tout le monde
- Comment va░ t'on ?
+ Comment va░ ?

@@  keystroke: dFm  @@
+ Hey!
+ Salut tout le monde
- Comment va░ ?
+ Com░ ?
```

C'est cool non?

Mais il y a un problème. Lequel? Comment faisons-nous pour supprimer quelque
chose qui se situe entre la position du curseur ET un mot ou un caractère précis
qui se situe plusieurs lignes plus bas dans un texte par exemple? Car
actuellement, le curseur ne peut se déplacer que sur la ligne courante.\
Et bien, puisque nous pouvons enchaîner les actions, nous n'avons qu'à
"enchaîner" la suppression et la recherche me diriez-vous? Et bien oui! C'est
une très belle idée, Jamy! Faisons ça.

- <kbd>d/`<chars>`</kbd> supprime jusqu'au caractère, le dernier caractère non
  inclus.

Imaginons que nous voulions supprimer tout le texte qui se situe entre le
curseur et le caractère `!` dans l'exemple qui suit:

```diff
+ C'est cool non?░ 
+
+ Mais il y a un problème. Lequel? Comment faisons-nous pour supprimer quelque
+ chose qui se situe entre la position du curseur ET un mot ou un caractère précis
+ qui se situe plusieurs lignes plus bas dans un texte par exemple? Car
+ actuellement, le curseur ne peut se déplacer que sur la ligne courante.\
+ Et bien, puisque nous pouvons enchaîner les actions, nous n'avons qu'à
+ "enchaîner" la suppression et la recherche me diriez-vous? Et bien oui! C'est une
+ très belle idée, Jamy! Faisons ça.

@@  keystroke: d        @@
@@  keystroke: /!       @@
@@  keystroke: ENTER ↵  @@
- C'est cool non?░ 
- 
- Mais il y a un problème. Lequel? Comment faisons-nous pour supprimer quelque
- chose qui se situe entre la position du curseur ET un mot ou un caractère précis
- qui se situe plusieurs lignes plus bas dans un texte par exemple? Car
- actuellement, le curseur ne peut se déplacer que sur la ligne courante.\
- Et bien, puisque nous pouvons enchaîner les actions, nous n'avons qu'à
- "enchaîner" la suppression et la recherche me diriez-vous? Et bien oui! C'est une
+ C'est cool non?░! C'est une
+ très belle idée, Jamy! Faisons ça.
```

Pour supprimer la ligne courante (où le curseur est positionné) : <kbd>dd</kbd>
ou <kbd>cc</kbd>.

```diff
+ Hey!
+ Salut to░ut le monde
+ Comment va-t-on ?

@@  keystroke: dd  @@
+ Hey!
- Salut to░ut le monde
+ ░Comment va-t-on ?
```

Pour supprimer du texte qui se trouve entre des caractères spéciaux :
<kbd>di`<char>`</kbd> ou <kbd>ci`<char>`</kbd> (caractères spéciaux non inclus).

Pour supprimer du texte qui se trouve entre des caractères spéciaux :
<kbd>da`<char>`</kbd> ou <kbd>ca`<char>`</kbd> (caractères spéciaux inclus).

```diff
+ let my_str = "Hello world !";

@@  keystroke: ci"    @@
- let my_str = "He░llo world !";
+ let my_str = "░";
@@  keystroke: Salut  @@
- let my_str = "░";
+ let my_str = "Salut░";
```

## Ajouter du texte

Imaginons que nous avons copié du code et que celui-ci n'a pas les
points-virgules à la fin de chaque ligne. Et nous trouvons ça très embêtant, car
nous aimons très fortement les points-virgules en fin de ligne. Nous allons
devoir les ajouter. Mais comment faire avec vim ?

Nous allons utiliser <kbd>A</kbd> qui nous permet d'aller en fin de ligne et de
passer en mode "INSERT" automatiquement pour y rajouter notre point-virgule.
Ensuite <kbd>j↓</kbd> et <kbd>.</kbd> pour ne pas se répéter.

```diff
+ let my░_num = 7
+ let my_str = "PhiSyX"
+ let my_bool = true

@@  keystroke: A;␛  @@
- let my░_num = 7
+ let my_num = 7;░

@@  keystroke: j↓    @@
@@  keystroke: .     @@
- let my_str = "PhiSyX"
+ let my_str = "PhiSyX";░
@@  keystroke: j↓ .  @@
- let my_bool = true
+ let my_bool = true;░
```

## Remplacer du texte

Pour remplacer un caractère par un caractère donné : <kbd>r`<char>`</kbd>

```
Nous aimerions transformer cette exemple:

// Mon super commentaire // 
// Mon super commentaire // 
// Mon super commentaire //

en

// --------------------- // 
// Mon super commentaire //
// --------------------- //
```

<kbd>vt/hr-jj.</kbd>

```diff
@@  keystroke: vt/  @@
- // ░Mon super commentaire // 
+ // ░Mon super commentaire ░// 
@@  keystroke: h ←  @@
- // ░Mon super commentaire ░// 
+ // ░Mon super commentaire░ // 
@@  keystroke: r-   @@ 
- // ░Mon super commentaire░ // 
+ // ░--------------------- // 
@@  keystroke: jj.   @@ 
- // Mon super commentaire //
+ // --------------------- //
```

## Incrémenter/Décrémenter

Pour incrémenter un nombre qui se trouverait au plus proche du curseur vers la
droite sur une ligne: <kbd> `[number]<C-`a`>`</kbd>. Pour décrémenter :
<kbd> `[number]<C-`x`>`</kbd>

- `number` est optionnel. Par défaut, ça incrémente de `1`.

```diff
+ let m░y_str = "J'ai 19 ans, 2 chiens";

@@  keystroke: <C-a>   @@
- let m░y_str = "J'ai 19 ans, 2 chiens.";
+ let my_str = "J'ai 2░0 ans, 2 chiens.";
@@  keystroke: 4<C-a>  @@
- let my_str = "J'ai 2░0 ans, 2 chiens.";
+ let my_str = "J'ai 2░4 ans, 2 chiens.";
@@  keystroke: .       @@
- let my_str = "J'ai 2░4 ans, 2 chiens.";
+ let my_str = "J'ai 2░8 ans, 2 chiens.";
@@  keystroke: <C-x>   @@
- let my_str = "J'ai 2░8 ans, 2 chiens.";
+ let my_str = "J'ai 2░7 ans, 2 chiens.";
@@  keystroke: l →     @@
- let my_str = "J'ai 2░7 ans, 2 chiens.";
+ let my_str = "J'ai 27░ ans, 2 chiens.";
@@  keystroke: 3<C-a>  @@
- let my_str = "J'ai 2░7 ans, 2 chiens.";
+ let my_str = "J'ai 27 ans, ░5 chiens.";
```

```diff
+ .my-css-selector { position: absolute: top: 0x; }

@@  keystroke: 120<C-x>  @@
- .my-css-selector { position: absolute; top: 0px; }
+ .my-css-selector { position: absolute; top: -120px; }
```

```diff
+ version = "0.1.0"

@@  keystroke: $      @@
@@  keystroke: h ←    @@
@@  keystroke: <C-a>  @@
- version = "0.1.0"
+ version = "0.1.1"
```
