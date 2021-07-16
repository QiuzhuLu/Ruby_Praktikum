require_relative "rucksack"
require_relative 'Akteur'
class Spielerin < Akteur

  def initialize(name, aktueller_raum, maximale_tragkraft, lebenspunkte)
    # TODO refaktorisieren
    super(name, lebenspunkte)
    @aktueller_raum = aktueller_raum
    @rucksack = Rucksack.new(maximale_tragkraft)
  end

  # Räume
  def wechsle_raum(richtung)
    naechster_raum = nachbar(richtung)
    unless naechster_raum.nil?()
      betrete_raum(naechster_raum)
    end
  end

  def betrete_raum(raum)
    @aktueller_raum = raum
    # @aktueller_raum.raum_betreten(self) # Später
    info()
  end

  def im_nachbarraum_umsehen(richtung)
    nachbar = nachbar(richtung)
    unless nachbar.nil?
      puts nachbar
    end
  end

  def nachbar(richtung)
    nachbar = @aktueller_raum.ausgang(richtung)
    if nachbar.nil?
      puts("Kein Ausgang nach #{richtung}")
    end
    return nachbar
  end

  # Gegenstände
  def gegenstand_aufnehmen(gegenstand_name)
    gegenstand = @aktueller_raum.gegenstand_aufheben(gegenstand_name)
    unless gegenstand.nil?
      @rucksack << gegenstand
    end
    info()
  end

  def gegenstand_ablegen(gegenstand_name)
    gegenstand = @rucksack.gegenstand_herausnehmen(gegenstand_name)
    unless gegenstand.nil?
      @aktueller_raum.gegenstand_ablegen(gegenstand)
    end
    info()
  end


  def info()
    puts self
  end

  def to_s(kurzform=false)
    # TODO refaktorisieren
    if kurzform
      super + " **"
    else
      super + " \nim #{@aktueller_raum} \nim #{@rucksack}  "
    end
  end

  # ##zusaetzliche methode check_wo_bin_ich
  # def check_wo_bin_ich()
  #   puts "#{@aktueller_raum}"
  # end

end


