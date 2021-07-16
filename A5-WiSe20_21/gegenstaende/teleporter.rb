require_relative 'Gegenstand'
class Teleporter < Gegenstand
  attr_reader :gewicht
  def initialize(name, gewicht, strecke_in_quadranten)
    #TODO
    super(name)
    @gewicht = gewicht
    @strecke_in_quadranten = strecke_in_quadranten
  end


  # def to_s(kurform=false)
  def gegenstand_spezifisch_to_s(kurzform=false)
    # TODO
    if kurzform
      "#{@gewicht}.#{@strecke_in_quadranten}"
    else
      "(#{@gewicht}kg) überwindet #{@strecke_in_quadranten} Quadranten"
    end
  end


end

