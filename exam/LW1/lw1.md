1.

let tuple = (( 1, 'a'), "abc")

snd(fst(cort))


2.

2.1)

let list1 = ['a', 'b', 'c']

head(tail(list1))



2.2)

let list2 = [['a', 'b'], ['c','d']]

tail(head(list2))


2.3)

let list3 = [['a', 'c', 'd'], ['a','b']]

tail(head(tail(list3)))



2.4)

let list4 = [['a','d'], ['b', 'c']]

head(head(tail(list4)))



3.
3.1)

[1, 3 .. 39]


3.2)

take 20 [1, 3..]



3.3)


take 20 (repeat 5)



3.4)

replicate 20 5



3.5)
[x*2-1 | x <- [1..20]]



4.

triangleFerma x = round(x*(x+1)/2)
map triangleFerma [1 .. 50]

5.
piramidFerma x = round(((2*x^3)+(3*x^2)+x)/6)
map piramidFerma [1 .. 50]