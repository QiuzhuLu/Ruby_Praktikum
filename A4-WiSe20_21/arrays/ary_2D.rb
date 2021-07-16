require "../arrays/ary_1D"

# TODO Erzeugen

def erzeuge_matrix_random_in_range(n,m,range)
  # TODO
  matrix = Array.new(n){Array.new(m) {rand(range)}}
  return matrix
end

def erzeuge_unregelmaessiges_random_in_range(n,min,max,range)
  # TODO
  matrix = Array.new(n){Array.new(rand(min..max)) {rand(range)}}
  return matrix
end


def transponierte?(m1,m2)
  # TODO
  # !!!!!!!!!!!!!!!Info ueber Exception!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #raise ArgumentError.new("")  #darf Keine Exception enthalten.
  #die Methode ist mit ?, liefert boolesche Ergebnisse zurueck.
  #!!!!!!!!!!!!!!!Info ueber Exception!!!!!!!!!!!!!!!!!!!!!!!!!!!
  return false if !matrix?(m1) || !matrix?(m2)  || !(m1.length == m2[0].length && m1[0].length == m2.length)
  for i in (0..m1.length-1)
    for j in (0..m1[0].length-1)
      if m1[i][j] != m2[j][i]
        return false
      end
    end
  end
  return true
  #Alternative:    transpose()
  #   if matrix?(m1) && matrix?(m2)
  #     return m1.transpose().eql?(m2)
  #   end
  #   return false
end

# GEGEBEN!!!!!
def matrix?(m)
  return m.is_a?(Array) && !m.empty?() && m.all?() do |ary1D| ary1D.is_a?(Array) &&
      ary1D.size()==m[0].size() &&
      ary1D.none?(){|elem| elem.is_a?(Array)}
  end
end

# Kniffliger
def addiere_ary2D(ary1,ary2)
  # TODO
  addiere_matrix_length = ary1.length >= ary2.length ? ary1.length : ary2.length
  kopie_von_plus_matrix1 = kopie_von_plus_matrix(ary1, addiere_matrix_length-ary1.length)
  kopie_von_plus_matrix2 = kopie_von_plus_matrix(ary2, addiere_matrix_length-ary2.length)
  addiere_matrix = Array.new()
  for zeile in (0...addiere_matrix_length)
    addiere_matrix << addiere_ary1D(kopie_von_plus_matrix1[zeile], kopie_von_plus_matrix2[zeile])
  end
  return addiere_matrix
end

#Hilfsmethode:
# kopie_von_plus_matrix(matrix, zeile_plus)
# Die Methode im Matrix der Länge (matrix.length + zeile_plus) die Zeile von matrix kopiert
# und die zusätzlichen Zeile mit [0] belegt.
# Parameter:
# matrix : die kopierte Matrix (2D_Array)
# zeile_plus : die Anzahl der verlangte Zeile (Integer)
def kopie_von_plus_matrix(matrix, zeile_plus)
  matrix_plus = Array.new()                  # Achtung :  falsch :  ary_plus = Array,new(ary.length + plus) , ary _plus wird mit (ary.length + plus) mal Nil erzeugt.
  matrix.each(){|zeile| matrix_plus << zeile}
  for i in (0..zeile_plus-1)
    matrix_plus << [0]
  end
  return matrix_plus
end
