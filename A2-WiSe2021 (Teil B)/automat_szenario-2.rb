require "./KinokartenAutomat"
require "./Tarif"

def kein_tarif_gewaehlt
  tester = KinokartenAutomat.new
  # prüfen, ob hinweis konsole und return 0 (.karten_preis)
  puts "Aufruf Kartenpreis ohne Tarifwahl:"
  puts "Rückgabe bei nicht-gewähltem Tarif:  #{tester.karten_preis}"
  # prüfen, ob betrag ignoriert wird (.betrag_einwerfen(betrag))
  puts "Aufruf betrag_einwerfen ohne Tarifwahl"
  tester.betrag_einwerfen(10)
  puts "Rückgabe eingeworfener Betrag bei nicht-gewähltem Tarif: #{tester.eingeworfen}"
  # prüfen, (.karte_drucken)
  puts "Aufruf karte_drucken ohne Tarifwahl"
  tester.karte_drucken
end

def bereits_tarif_gewaehlt
  # prüfen, ob @tarif gesetzt wurde!
  puts "Doppelte Tarifwahl ausführen"
  tester = KinokartenAutomat.new
  tarif1 = Tarif.new("Normal", 20)
  tarif2 = Tarif.new("Ermaessigt", 10)
  tester.tarif_waehlen(tarif1)
  puts "Einwurf von 5€"
  tester.betrag_einwerfen(5)
  puts "Automat hat nun #{tester.eingeworfen}€ eingeworfen. Der aktuelle Umsatz beträgt #{tester.summe_automat}. Nun wird ein weiterer Tarif gewählt:"
  tester.tarif_waehlen(tarif2)
  puts "Automat hat nun #{tester.eingeworfen}€ eingeworfen. Der aktuelle Umsatz beträgt #{tester.summe_automat}."
end

def zu_wenig_geld_eingeworfen
  # prüfen, ob .karte_drucken widerspricht und offenen Betrag ausgibt
  puts "Aufruf von karte_drucken mit zu wenig Penunsen"
  tester = KinokartenAutomat.new
  tarif1 = Tarif.new("Normal", 20)
  tarif2 = Tarif.new("Ermaessigt", 10)
  tester.tarif_waehlen(tarif2)
  tester.betrag_einwerfen(7)
  tester.karte_drucken
end

def zu_viel_geld_eingeworfen
  tester = KinokartenAutomat.new
  tarif1 = Tarif.new("Normal", 20)
  tarif2 = Tarif.new("Ermaessigt", 10)
  # karte gedruckt?
  puts "Aufruf von karte_drucken mit zu viel Monetas"
  tester.tarif_waehlen(tarif2)
  tester.betrag_einwerfen(12)
  tester.karte_drucken
  # wechselgeld?
  puts "Rückgabe Wechselgeld?"
  puts "Das Wechselgeld beträgt #{tester.wechsel_geld} Euro"
  # @eingeworfen reduziert?
  puts "Wurde eingeworfen auf Null gesetzt?"
  puts "@eingeworfen beträgt #{tester.eingeworfen}"
  # @tarif nil?
  puts "Wurde @tarif auf nil gesetzt?"
  puts "Tarif ist nil: #{!tester.tarif_gewaehlt?}"
  # @summe_automat erhöht?
  puts "Wurde die Summe aller eingeworfenen Beträge erhöht?"
  puts "Die Summe aller eingeworfenen Beträge I"
  puts "Die Summe beträgt derzeit #{tester.summe_automat}"
  puts "Kauf Testkarte"
  tester.tarif_waehlen(tarif2)
  tester.betrag_einwerfen(10)
  tester.karte_drucken
  puts "Die Summe aller eingeworfenen Beträge II"
  puts "Die Summe beträgt derzeit #{tester.summe_automat}"
end

kein_tarif_gewaehlt
bereits_tarif_gewaehlt
zu_wenig_geld_eingeworfen
zu_viel_geld_eingeworfen

