require "singleton"
require_relative "Raum"
require_relative "akteure/monster"
require_relative "spiel_utility"
require_relative "gegenstaende/waffe"
require_relative "gegenstaende/teleporter"
require_relative "gegenstaende/zaubertrank"
require_relative "akteure/freund"
require_relative 'gegenstaende/tankstelle'
require_relative 'gegenstaende/wertgegenstand'
require_relative 'weltdaten_leser'

class Welt
  include Singleton

  def erschaffen(groesse,weltdaten_datei)
    @groesse = groesse
    @raeume = Array.new(@groesse) {Array.new(@groesse)}
    @weltanzeiger = WeltAnzeiger.new(@raeume)#########################
    @weltdaten_datei = weltdaten_datei
    raeume_erzeugen()
    verbinden()
    bevoelkern()
  end

  def raeume_erzeugen()
    #TODO
    (0...@groesse).each do |zeile_index|
      (0...@groesse).each do |spalt_index|
        raum_eintragen(spalt_index, zeile_index, Raum.new(name_generieren(spalt_index, zeile_index)))
      end
    end
  end

  def verbinden()
    #TODO
    (0...@groesse).each do |zeile_index|
        (0...@groesse).each do |spalt_index|
          aktueller_raum = raum_an_position(spalt_index, zeile_index)
          if gueltiger_quadrant?(spalt_index, zeile_index - 1) then aktueller_raum.setze_ausgang(SpielUtility::NORDEN, raum_an_position(spalt_index, zeile_index - 1)) end
          if gueltiger_quadrant?(spalt_index + 1, zeile_index) then aktueller_raum.setze_ausgang(SpielUtility::OSTEN, raum_an_position(spalt_index + 1, zeile_index)) end
          if gueltiger_quadrant?(spalt_index, zeile_index + 1) then aktueller_raum.setze_ausgang(SpielUtility::SUEDEN, raum_an_position(spalt_index, zeile_index + 1)) end
          if gueltiger_quadrant?(spalt_index - 1, zeile_index) then aktueller_raum.setze_ausgang(SpielUtility::WESTEN, raum_an_position(spalt_index - 1, zeile_index)) end
        end
    end
  end

  def bevoelkern()
    weltdaten = daten_lesen()
    # TODO
    weltdaten.each do |coords, object|
      ablege_raum = raum_an_position(coords[0], coords[1])#
      ablege_raum.gegenstand_ablegen(object)
    end
  end

  def daten_lesen()
    return WeltdatenLeser.lese_daten(@weltdaten_datei)
  end

  def ausgeben()
    @weltanzeiger.ausgeben()
  end

  def name_generieren(x, y)
    return "Q_#{x}_#{y}"
  end

  def raum_an_position(x, y)
    check_in_welt(x, y)
    return @raeume[y][x]
  end

  def raum_eintragen(x,y,raum)
    check_in_welt(x,y)
    @raeume[y][x] = raum
  end

  def gueltiger_quadrant?(x,y)
    return 0 <= x && x <@groesse && 0 <=y && y <@groesse
  end

  def to_s(kurzform = false)
    interim = @raeume.inject("[") {|akku, reihe| akku + "[#{reihe.map() {|raum| raum.to_s(kurzform)}.join(",")}]\n "}
    interim[-2, 2] = "]\n"
    return interim
  end

  private

  def check_in_welt(*x_y_werte)
    raise EndeDerWeltException, "Werte: #{x_y_werte} nicht von dieser Welt" if x_y_werte.any?() {|wert| wert < 0 || wert >= @groesse}
  end

  class WeltAnzeiger
    def initialize(raeume)
      @meine_raeume = raeume
    end

    def ausgeben()
      max_breite = max_bewohner_size() + 4
      if max_breite % 2 != 0
        max_breite += 1
      end
      for hoehe in (0...@meine_raeume.size())
        welt_streifen = @meine_raeume[hoehe]
        puts streifen_oben(max_breite, welt_streifen)
        puts streifen_quadrant(max_breite, welt_streifen)
        puts streifen_leerbereich(max_breite, welt_streifen)
        puts streifen_mitte(hoehe, max_breite, welt_streifen)
        puts streifen_leerbereich(max_breite, welt_streifen)
      end
      puts streifen_unten(max_breite, @meine_raeume[-1])
    end

    def streifen_oben(breite, korridor)
      korridor.inject("") do |acc, raum|
        if raum.ausgang?(SpielUtility::NORDEN)
          acc + "|" + "-" * (breite / 2 - 1) + "  " + "-" * (breite / 2 - 1)
        else
          acc + "|" + "-" * breite
        end
      end + "|"
    end

    def streifen_quadrant(breite, korridor)
      korridor.inject("") do |acc, raum|
        koordinaten = raum.name().split("_")[-2..2]
        padding = (@meine_raeume.size() - 1).to_s().size
        koord_string = "%#{padding}s.%#{padding}s" % koordinaten
        acc +"|" + " " + koord_string.ljust(breite - 1) # + " " * (breite - 1 - koord_string.size())
      end + "|"
    end

    def streifen_leerbereich(breite, korridor)
      korridor.inject("") do |acc, raum|
        acc +"|" + " " * (breite)
      end + "|"
    end

    def streifen_mitte(zeile, breite, korridor)
      anzahl_zeilen = max_inventar(zeile)
      raeume_plus_inventar = korridor.map() do |raum|
        [raum, raum.map() {|elem| elem.to_s(true)}]
      end
      zeilen_mitte = (0..anzahl_zeilen).inject("") do |acc2, index|
        acc2 + raeume_plus_inventar.inject("") do |acc, raum_plus_inventar|
          kurzform = ""
          unless raum_plus_inventar[1][index].nil?
            kurzform = raum_plus_inventar[1][index]
          end
          if raum_plus_inventar[0].ausgang?(SpielUtility::WESTEN)
            acc + " " + kurzform.center(breite) #kurzform + " " * (breite -kurzform.size())
          else
            acc + "|" + kurzform.center(breite) # + " " * (breite-kurzform.size())
          end
        end + "|\n"
      end
      return zeilen_mitte.chomp("\n")
    end

    def streifen_unten(breite, korridor)
      korridor.inject("") do |acc, raum|
        if raum.ausgang?(SpielUtility::SUEDEN)
          acc + "|" + "-" * (breite / 2 - 1) + "   " + "-" * (breite / 2 - 1)
        else
          acc + "|" + "-" * breite
        end
      end + "|"
    end


    def max_bewohner_size()
      max_b_size = @meine_raeume.flatten().reject() {|raum| raum.to_a().empty?()}.map() {|raum| raum.to_a()}.flatten().map() {|obj| obj.to_s(true)}.max_by() {|string| string.size()}
      if ! max_b_size.nil?()
        return max_b_size.size()
      else
        return 0
      end
    end


    def max_inventar(zeile)
      @meine_raeume[zeile].max_by() {|raum| raum.count()}.count()
    end
  end
end

class EndeDerWeltException < StandardError

end
