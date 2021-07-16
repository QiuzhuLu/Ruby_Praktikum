require_relative 'Gegenstand'
class Zaubertrank < Gegenstand

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
      "(#{@gewicht}kg) schenkt/kostet #{@effekt}lp Reichweite #{@reichweite}lp"
    end
  end
end

