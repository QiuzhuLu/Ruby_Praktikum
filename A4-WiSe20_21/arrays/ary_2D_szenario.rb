require "../arrays/ary_2D"
require "../utils"


trenner("4.2.1 Matrix erzeugen")
m1 = erzeuge_matrix_random_in_range(4,7,(0..9))
p m1
m1t = m1.transpose()
m2 = erzeuge_matrix_random_in_range(6,4,(0..9))

trenner("4.2.2 2D Array erzeugen")
ary2D_1 = erzeuge_unregelmaessiges_random_in_range(5,2,9,(0..9))
ary2D_2 = erzeuge_unregelmaessiges_random_in_range(3,2,9,(0..9))
puts "ary2D_1:#{ary2D_1}"
puts "ary2D_2:#{ary2D_2}"

trenner("4.2.3 Test \"transponierte?\"")
m1t = m1.transpose() #Transponierte Matrix
# #a = [[1,2], [3,4], [5,6]]
# a.transpose   #=> [[1, 3, 5], [2, 4, 6]]
m2 = erzeuge_matrix_random_in_range(6,4,(0..9))

puts "m1:#{m1}"
puts "m1 transponiert:#{m1t}"
puts transponierte?(m1,m1t)
puts transponierte?(m1,m1)
puts transponierte?(m1,m2)
puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
puts transponierte?([[1,2], [3,4], [5,6]],[[1, 3, 5], [2, 4, 6]])
puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
puts transponierte?([[1,2], [3,4], [5,6]],[[1, 3, 5], [2, 4, 7]])
puts matrix?([])
# puts transponierte?(m1,[])
# puts transponierte?([],m1)
# puts transponierte?([],[])
# puts transponierte?([[]],[[]])
# puts transponierte?([[1]],[[1]])

trenner("4.2.4 Addiere")
puts "ary2D_1:#{ary2D_1}"
puts "ary2D_2:#{ary2D_2}"
p addiere_ary2D(ary2D_1,ary2D_2)

# ary2D_1=[[4, 6], [7, 6, 1, 7, 1, 7, 1, 8, 5], [1, 2, 3, 6], [1, 8, 2, 1], [1, 1]]
# ary2D_2=[[5, 4, 5], [9, 6, 5, 2], [6, 2, 3, 4, 7, 9, 8]]
# p addiere_ary2D(ary2D_1,ary2D_2)

