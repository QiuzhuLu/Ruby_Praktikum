class Position

  attr_reader :produkt

  def initialize(produkt,anzahl,einzelpreis)
    #TODO
    @produkt = produkt
    @anzahl = anzahl
    @preis = einzelpreis
  end


  def gesamt_preis()
    # TODO
    return @anzahl * @preis
  end

  # Gegeben
  def to_s()
    return "#{@produkt}(#{@anzahl}):#{gesamt_preis}"
  end

end


