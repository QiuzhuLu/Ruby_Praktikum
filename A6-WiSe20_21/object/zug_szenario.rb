require_relative '../utils'
require_relative 'zug'
require_relative 'lok'
require_relative 'abteil'

trenner("Zug erzeugen")

zug = Zug.new()
puts zug

trenner("10 Abteils mit zufällig belegten Plätzen ankoppeln")

srand(123456)
max_plaetze = 50

for i in (0...10)
  zug.ankoppeln(Abteil.new(max_plaetze,rand(max_plaetze)))
end

puts zug

trenner("A6.3.7 ")

puts zug.count()
puts zug.inject(0){|acc,abteil| acc + abteil.sitzplaetze}
puts zug.inject(0){|acc,abteil| acc + (abteil.sitzplaetze-abteil.besetzte_plaetze)}
puts zug.max_by(){|abteil| abteil.sitzplaetze-abteil.besetzte_plaetze}
n = 10
puts zug.select(){|abteil| (abteil.sitzplaetze-abteil.besetzte_plaetze >=n)}.join(" ")
