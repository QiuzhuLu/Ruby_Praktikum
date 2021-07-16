require "./Position"

class Rechnung
  # Gegeben
  attr_reader :positionen,:nr
  protected :positionen

  def initialize(nr)
    # TODO
    @nummer = nr
    @positionen = Array.new()
    # []
  end

  def position_eintragen(pos)
    # TODO
    @positionen << pos
    return self
    # Die Methode gibt eine Referenz auf self zurück.
    # falls es kein "return self" gibt, gibt ein array zurueck.
    # Array ist ein veraenderliches Ergebnis, man kann von aussen das Array aendern.
    # Deshalb gibt hier self zurueck, damit man von aussen nicht das Array aendern kann.
  end

  # Gegeben
  def rechnungs_betrag()
    return @positionen.inject(0){|akku,pos| akku + pos.gesamt_preis()} # 2 Pkt
  end

  def to_s()
    return "R#{@nummer}:(#{rechnungs_betrag()}):#{@positionen.join(",")}"
  end

end

