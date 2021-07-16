require "./KasseLeser"

datei_name = "rechnungen.sv"

leser = KasseLeser.new()
kasse = leser.lese_kasse_von(datei_name)
puts kasse


# flogendes zeigt wieso man self zurueck geben soll.
# sonst kann man sogar von aussen das Array loeschen.
#
# l1 = Rechnung.new(1)
# temp = kasse.rechnung_eintragen(l1)
# puts temp.to_s
# puts temp.class
# temp.clear
# puts "__________________________________________________________________"
# puts kasse
