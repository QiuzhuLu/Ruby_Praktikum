require_relative 'Akteur'
class Bewohner < Akteur

  def initialize(name, lebenspunkte, effekt)
    super(name, lebenspunkte)
    @effekt = effekt
  end

  def to_s(kurzform = false)

    if !kurzform
      super + bewohner_spezifisch_to_s + "#{@effekt}lp"
    else
      super + ".#{@effekt}"
    end

  end

  def bewohner_spezifisch_to_s
    ""
  end

end
