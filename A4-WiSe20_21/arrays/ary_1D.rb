def erzeuge_1D_inhalt_index_reverse(n)
  # TODO
  # ary = Array.new(n){|index| n-1-index}
  # return ary
  return Array.new(n){|index| n-1-index}
  end

def erzeuge_1D_inhalt_random_intervall(n,range)
  # TODO
  return Array.new(n){rand(range)}
end

#Ohne reverse
def inverses?(ary1,ary2)
  # TODO
  for index in (0...ary1.length)
    return false if ary1[index] != ary2[ary2.length-1-index]
  end
  return true

  #Alternative:
  # return (ary1==ary2.reverse())
  #
  # !!!!Wichtig!!!!!!!!!!!!!!Info zur ==, eql?!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #  ==  , eql? beim Arry gleich
  # vermutlich beim Arry : eql macht ==  . 2 Objekte sind in der Definition von Array.class schon der gleiche Typ
  #
  # Array sucht  Elemente mit "==" (Z.B include?)
  # Hash  sucht  Elemente  mit "eql?"
  # eql? und == sind im meisten Faellen gleich. Z.B Array
  #
  # Beim Interger Float sind eql? und == unterschiedlich.(Was wir bisher kennen)
  # eql? : prueft den Wert
  # ==   : prueft den Typ
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!==, eql?!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

end


def tausche(ary, i, j)
  # TODO
  temp = ary[i]
  ary[i] = ary[j]
  ary[j] = temp
end

#downto ,spaceship
def schiebe_auf_position(ary, index)
  # TODO
  (index).downto(1) do |i|
    return if (ary[i] <=> ary[i-1]) >= 0  # If the other object is not comparable then the <=> operator should return nil.
    tausche(ary,i,i-1)
  end
  # "while schleife" nicht empfohlen, weil index muss von selber gezaehlt werden.
  # Das kann zum Fehler verursachen.
  #
  # while(ary[index] < ary[index-1] && index >= 1)
  #   tausche(ary, index, index-1)
  #   index -= 1
  # end
  # return ary
  #

end

def sortiere_einfach(ary)
  # TODO
  for i in (1..ary.length-1)
    schiebe_auf_position(ary,i)
  end
end
# 7. downto(einen geeigneten Iterator für Zahlen).
def loesche_alle(ary, wert)
  # TODO
  (ary.length-1).downto(0) do |index|
    ary.delete_at(index) if ary[index] == wert
  end
  #Alternative 1:
  # for i in (0...ary.length)
  #   if ary[ary.length-1-i] == wert
  #     ary.slice!(ary.length-1-i)
  #   end
  # end
  # return ary
  #
  #Alternative 2:
  # ary.delete(wert)
  # return ary
  #
  #   # ary.delete(wert), delete alle elem mit dem Wert
  #   # https://programmingresources.fandom.com/wiki/Ruby-_Remove_Elements_From_An_Array
  #   # you can also use the Array.slice!(index) method to remove elements at a given index. I am repeating the above example using A.slice!(2)
  #   # If you want to remove an element of an array at an index, use Array.delete_at(index) command. It will remove the element at the given index.
end

def alle_elemente_groesser?(ary, wert)
  # TODO
  # for elem in ary
  #   if elem < wert
  #     return false
  #   end
  # end
  # return true
    ary.each() do |elem|
      return false  if(elem < wert)
    end
    return true
end

def kopie_von(ary)
  # TODO
  ary_kopie = []
  ary.each{|elem| ary_kopie<<elem}
  return ary_kopie
end

def kopie_von_plus(ary,plus)
  # TODO
  # ary_plus = Array.new()                  # Achtung :  falsch :  ary_plus = Array,new(ary.length + plus) , ary _plus wird mit (ary.length + plus) mal Nullen erzeugt.
  Array.new(ary.length + plus) do |index|
    index < ary.length ? ary[index] : 0
  end
  # Alternative:
  # ary_plus = kopie_von(ary)
  # for i in (0..plus-1)
  #   ary_plus << 0
  # end
  # return ary_plus
end

# kniffliger
def addiere_ary1D(ary1,ary2)
  addiert_ary_length = ary1.length >= ary2.length ? ary1.length : ary2.length
  ary1_plus = kopie_von_plus(ary1, addiert_ary_length - ary1.length)
  ary2_plus = kopie_von_plus(ary2, addiert_ary_length - ary2.length)
  addiert_ary  = Array.new(addiert_ary_length) {|index| ary1_plus[index] + ary2_plus[index] }
  return addiert_ary
end


