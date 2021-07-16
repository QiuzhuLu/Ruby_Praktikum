require_relative 'Gegenstand'
class Wertgegenstand < Gegenstand

  def initialize(name,gewicht,wert)
    # TODO
    super(name)
    @gewicht = gewicht
    @wert = wert
  end

  def gegenstand_spezifisch_to_s(kurzform=false)
    # TODO
    if kurzform
      "#{@gewicht}.#{@wert}"
    else
      "(#{@gewicht}kg) Wert #{@wert}"
    end
  end
end