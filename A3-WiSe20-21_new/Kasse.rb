require "./Rechnung"

class Kasse

  def initialize()
    # TODO
    @rechnungen = Array.new()
  end

  # Gegeben
  def rechnung_eintragen(rechnung)
    # TODO
    @rechnungen << rechnung
    return self
    #Die Methode gibt eine Referenz auf self zurück
  end

  # Gegeben
  def kassen_sturz()
    @rechnungen.inject(0) {|akku,rechnung| akku + rechnung.rechnungs_betrag()}
  end

  def to_s()
    return "Kasse:\n #{@rechnungen.join("\n ")}\n Gesamt:#{kassen_sturz()}"
  end

end

