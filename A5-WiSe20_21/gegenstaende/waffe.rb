require_relative 'Gegenstand'

class Waffe < Gegenstand

  attr_reader :effekt,:reichweite,:verbraucht_sich, :gewicht

  def initialize(name, gewicht, effekt,reichweite=effekt,verbraucht_sich= false)
    # TODO
    super(name)
    @gewicht = gewicht
    @effekt = effekt
    @reichweite = reichweite
    @verbraucht_sich = verbraucht_sich
  end

  def gegenstand_spezifisch_to_s(kurzform=false)
    # TODO
    if kurzform
      "#{@gewicht}.#{@effekt}.#{@reichweite}"
    else
      "(#{@gewicht}kg) kostet #{@effekt}lp Reichweite #{@reichweite}lp"
    end
  end

end


