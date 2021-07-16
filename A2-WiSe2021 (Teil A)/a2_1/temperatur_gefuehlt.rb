# Vorsichtig mit impliziert "return"
# besser expliziert "return" schreiben

#geschachtelte if-else-Anweisung:V3-b,seite9
def temperatur1(grad)
  output = :unbekannte
  if grad>=-60 && grad<12
    output = :kalt
  else
    if grad>=12 && grad<20
      output = :moderat
    else
       if grad>=20 && grad<25
         output = :warm
       else
         output = :heiss
       end
    end
  end
  return output
  #besser expliziert return.
end

#if-Kaskade: V3-b,seite10
def temperatur2(grad)
  output = :unbekannte
  if grad>=-60 && grad<12
    output = :kalt
  elsif grad>=12 && grad<20
    output = :moderat
  elsif grad>=20 && grad<25
    output = :warm
  else
    output = :heiss
  end
  return output
end

#case-when V3-b,seite16
def temperatur3(grad)
  output = :unbekannte
  output = case 
           when grad>=-60 && grad<12 then :kalt
           when grad>=12 && grad<20 then :moderat
           when grad>=20 && grad<25 then :warm
           else :heiss
           end
  return output
end

#case-target V3-b,seite17
def temperatur4(grad)
  output = :unbekannte
  output = case grad
          #open ranges... => [)    #closed ranges ..  =>[]
          # https://stackoverflow.com/questions/12493335/open-ranges-in-ruby-using-floats
          # Internal
           when -60...12 then :kalt
           when 12...20 then :moderat
           when 20...25 then :warm
           else :heiss
           end
  return output
end

# ternären Ausdruck V3-b,seite14
def temperatur5(grad)
  return (grad>=-60 && grad<12)? :kalt :
             (grad>=12 && grad<20)? :moderat :
                 (grad>=20 && grad<25)? :warm : :heiss
end

puts temperatur1(-40)
puts temperatur2(-40)
puts temperatur3(-40)
puts temperatur4(-40)
puts temperatur5(-40)

puts temperatur1(15)
puts temperatur2(15)
puts temperatur3(15)
puts temperatur4(15)
puts temperatur5(15)

puts temperatur1(22)
puts temperatur2(22)
puts temperatur3(22)
puts temperatur4(22)
puts temperatur5(22)

puts temperatur1(30)
puts temperatur2(30)
puts temperatur3(30)
puts temperatur4(30)
puts temperatur5(30)

puts temperatur1(-60)
puts temperatur2(-60)
puts temperatur3(-60)
puts temperatur4(-60)
puts temperatur5(-60)

puts temperatur1(12)
puts temperatur2(12)
puts temperatur3(12)
puts temperatur4(12)
puts temperatur5(12)

puts temperatur1(11.5)
puts temperatur2(11.5)
puts temperatur3(11.5)
puts temperatur4(11.5)
puts temperatur5(11.5)

#(grad>=-60 && grad<12)? :kalt :
# Bei allen werten, die die 3 Bedingungen nicht erfuellt , wird "heiss" ausgegeben.
# besser ware: (grad<12)? :kalt :
#
puts temperatur1(-70)
puts temperatur2(-70)
puts temperatur3(-70)
puts temperatur4(-70)
puts temperatur5(-70)