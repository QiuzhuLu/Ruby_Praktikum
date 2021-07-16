require "./Tarif"
# Der Kinokarten-Automat Version 1:
#
# Der Automat gibt nur Karten für einen Film aus 
# Es gibt nur einen Einheitspreis (keine Ermäßigungen)
# Der Automat wechselt nicht
# 

# Author::    Birgit Wendholt 
# Copyright Hinweis:: Adaptiert die BlueJ Implementierung des NaivenTicketautomaten von Michael Kölling & David J. Barnes für Ruby und Tcl-TK

class KinokartenAutomat

  # initialize: initialisiert das Objekt der Klasse KinokartenAutomat
  # 
  # Parameter: 
  #   karten_preis: Einheitspreis für alle Kinokarten

  def initialize()
    @eingeworfen = 0
    # Summe aller Einzahlungen für diesen Automat
    @summe_automat = 0
    # TODO Tarif setzen
    @tarif = nil
  end

  def tarif_gewaehlt?()
    # TODO
    if @tarif.nil?
      return false
    else
      return true
    end
  end

  def tarif_waehlen(tarif)
    # TODO
    if tarif_gewaehlt?
      puts "Ein Tarif wurde gewählt und der Vorgang wird abgebrochen."
      abbrechen()
    end
    @tarif = tarif
end

  def abbrechen()
    # TODO
    ausgabe = @eingeworfen
    @tarif = nil
    @eingeworfen = 0
    return ausgabe
    #gibt den bereits eingeworfenen Betrag zurück.
  end

  def karten_preis
    # TODO
    if !tarif_gewaehlt?
      puts "Kein Tarif ist gewählt."
      return 0
    end
    return @tarif.betrag
  end

  # Liefert die Summe aller eingeworfenen Beträge
  def summe_automat()
    return @summe_automat
  end

  # Liefert die bisher gezahlte Summe für ein Ticket
  def eingeworfen()
    return @eingeworfen
  end

  # Nimmt den eingeworfenen Betrag entgegen und erhöht den 
  # bisher gezahlten Betrag für eine Kinokarte

  def betrag_einwerfen(betrag)
    # TODO
    if !tarif_gewaehlt?
      puts "Kein Tarif ist ausgewählt."
    else
      @eingeworfen += betrag
    end
  end


  # Gibt das Wechselgeld zurück und setzt den eingeworfenen Betrag auf 0
  def wechsel_geld()
    # TODO
    wechsel_geld = @eingeworfen
    @eingeworfen = 0
    return wechsel_geld
  end

  # Druckt die Kinokarte
  # Der Druck wird als Ausgabe auf der Konsole simuliert
  # Am Ende des Drucks wir der bisher eingeworfene Betrag wieder auf 0 gesetzt,

  def karte_drucken()
    # TODO ÄNDERN
    if !tarif_gewaehlt?
      puts "Kein Tarif wurde gewählt."
    else
      if @eingeworfen <= @tarif.betrag
        puts "Der offener Betrag: #{@tarif.betrag - @eingeworfen }"
      else
        puts("------------------")
        puts("- Cinema Magico -")
        puts("- Phantastische Tierwesen")
        # TODO diese Zeile ändern
        puts("- Preis " + @tarif.betrag().to_s + " Euro") # vordefiniert  to_s , von Integer zum String wandeln
        puts("- Bezahlt " + @eingeworfen.to_s + " Euro")  # vordefiniert  to_s , von Integer zum String wandeln
        puts("------------------")
        # die Gesamtsumme, mit dem der Automat nach der letzten Leerung
        # gefuettert wurde
        @eingeworfen -= @tarif.betrag
        @summe_automat = @summe_automat + @tarif.betrag
        @tarif = nil
        return
      end
    end

  end

  def to_s()
    return "KartenAutomat #{@number} Tarif #{@tarif} Euro Summe #{@summe_automat}"
  end
end

