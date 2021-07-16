require "../arrays/ary_1D"
require "../utils"

srand(9996677886122)
trenner("4.1.1 Erzeugen")
ary = erzeuge_1D_inhalt_index_reverse(7)
p ary

trenner("4.1.2 Erzeugen")
srand(8877665544)
ary2 = erzeuge_1D_inhalt_random_intervall(10, (2..4))
p ary2

trenner("4.1.3 inverses")
puts inverses?(ary,ary.reverse())
puts inverses?(ary,[])
puts inverses?(ary,ary)
puts inverses?([],[])
puts inverses?([1],[1])

ary1=[4,3,2,1,0]
trenner("4.1.4 tausche(#{ary1},2,4)")

p ary1
tausche(ary1,2,4)
p ary1

ary1=[4,3,2,1,0]
trenner("4.1.5 schiebe_auf_position(#{ary1},3)")
p ary1=[4,3,2,1,0]
schiebe_auf_position(ary1,3)
p ary1

ary =[4,3,0,1,2]
trenner("4.1.6 sortiere_einfach(#{ary1})")
sortiere_einfach(ary1)
p ary1

trenner("4.1.7 loesche_alle(#{ary2},4)")
p ary2
loesche_alle(ary2,4)
p ary2

srand(8877665544)
ary2 = erzeuge_1D_inhalt_random_intervall(10, (2..4))
trenner("4.1.8 alle > 5 || alle > 1 in #{ary2}")
puts alle_elemente_groesser?(ary2,5)
puts alle_elemente_groesser?(ary2,1)

trenner("4.1.9 und 4.1.10 kopie_von(#{ary2}) / kopie_von_plus(#{ary2},2) ")
p ak1 = kopie_von(ary2)
p ak2 = kopie_von_plus(ary2,2)

trenner("4.1.11 addiere_ary1D(#{ary},#{ary2})")
p addiere_ary1D(ary,ary2)
