require_relative 'Gegenstand'
class Tankstelle < Gegenstand

  def initialize(name,liter)
    # TODO
      super(name)
      @liter = liter
  end

  def gegenstand_spezifisch_to_s(kurzform=false)
    # TODO
    if kurzform
      "Infinity.#{@liter}"
    else
      "(Infinitykg) Vorrat: #{@liter}liter"
    end
  end
end

