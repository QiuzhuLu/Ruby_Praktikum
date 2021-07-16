class Akteur
  def initialize(name, lebenspunkte)
    @name = name
    @lebenspunkte = lebenspunkte
  end

  def to_s(kurzform=false)
    # TODO refaktorisieren
    if kurzform
      "#{self.class.name[0]}.#@lebenspunkte"
    else
      "Ich #{self.class.name} #{@name}(#{@lebenspunkte}lp)"
    end
  end

  # def akteur_spezifisch_to_s(kurzform=false)
  #   ""
  # end

end
