require "./KinokartenAutomat"
require "./Tarif"

tarif1 = Tarif.new("Normal",20)
tarif2 = Tarif.new("Ermaessigt", 10)
kka = KinokartenAutomat.new
kka.tarif_waehlen(tarif2)
puts "Karten_Preis: #{kka.karten_preis}"
# usw.
puts "----------------------"
puts "Test mit \"Allgemein\" "
kka.betrag_einwerfen(5)
kka.betrag_einwerfen(8)
kka.karte_drucken
puts "!!!!!!!!!!!!!!!!!!!!!!!!!!"
puts "Wechsel_geld: #{kka.wechsel_geld}"#5+8-10 = 3
kka.tarif_waehlen(tarif1)
kka.betrag_einwerfen(30)
kka.betrag_einwerfen(30)
puts "Eingeworfen: #{kka.eingeworfen}"
kka.karte_drucken
puts "Wechsel_geld: #{kka.wechsel_geld}" #30+30-20 =40
puts "Summe_automat: #{kka.summe_automat}" #10 + 20 =30
puts "----------------------"
puts "Test mit \"tarif_gewaelt\" "
kka.abbrechen
puts "Tarif_gewaehlt: #{kka.tarif_gewaehlt?}"
kka.tarif_waehlen(tarif1)
puts "Tarif_gewaehlt: #{kka.tarif_gewaehlt?}"

puts "----------------------"
puts "Test mit \"tarif_waelen\" "
kka.abbrechen
kka.tarif_waehlen(tarif1)
puts "Tarif_gewaehlt: #{kka.tarif_gewaehlt?}"
kka.tarif_waehlen(tarif2)
puts "Tarif_gewaehlt: #{kka.tarif_gewaehlt?}"

puts "----------------------"
puts "Test mit \"abbrechen\""
#Die Funktion von "abbrechen":
#Setzt die Instanz-Variable @tarif wieder auf nil.
#Setzt @eingeworfen auf 0 und gibt den bereits
#eingeworfenen Betrag zurück.
kka.abbrechen
kka.tarif_waehlen(tarif2)
puts "Karten_Preis: #{kka.karten_preis}"
kka.betrag_einwerfen(20)
puts "Eingeworfen Betrag: #{kka.abbrechen}"
puts "Tarif_gewaehlt: #{kka.tarif_gewaehlt?}"
puts "Eingeworfen: #{kka.eingeworfen}"

puts "----------------------"
puts "Test mit \"karten_preis\""
kka.abbrechen
kka.tarif_waehlen(tarif2)
puts "Karten_preis: #{kka.karten_preis}"
kka.tarif_waehlen(tarif1)
puts "Karten_preis: #{kka.karten_preis}"

puts "----------------------"
puts "Test mit \"betrag_einwerfen\""
kka.abbrechen
puts "Hinweis ausgeben: #{kka.betrag_einwerfen(10)}"
puts "Betrag: #{kka.eingeworfen}" # erwart:0
kka.tarif_waehlen(tarif1)
kka.betrag_einwerfen(20)
puts "Betrag: #{kka.eingeworfen}" # erwart:20

puts "----------------------"
puts "Test mit \"wechsel_geld\""
kka.abbrechen
kka.tarif_waehlen(tarif1)
puts "Karten_preis: #{kka.karten_preis}"
kka.betrag_einwerfen(23)
puts "Betrag: #{kka.eingeworfen}"
puts "Wechsel_geld: #{kka.wechsel_geld}"
puts "Betrag: #{kka.eingeworfen}"
puts "Tarif_gewaehlt: #{kka.tarif_gewaehlt?}"
kka.betrag_einwerfen(30)
kka.karte_drucken()
puts "Wechsel_geld: #{kka.wechsel_geld}"

puts "----------------------"
puts "Test mit \"wechsel_geld\""
kka.abbrechen
kka.karte_drucken
kka.tarif_waehlen(tarif1)
kka.karte_drucken
kka.betrag_einwerfen(21)
kka.karte_drucken
puts "Betrag: #{kka.eingeworfen}"
puts "Tarif_gewaehlt: #{kka.tarif_gewaehlt?}"
puts "Summe: #{kka.summe_automat}"

