require_relative "kasse_leser"
require "Set"
class Auswerter

  def initialize()
    @kasse = KasseLeser.new().als_hash()
    #Kasse kann nicht nil sein. wegen der Implementirung von "als_hash"
    #[] oder {} sind nicht nil.
  end

  def [](nr)
    return @kasse[nr]
  end

  def in_flaches_array()
    # TODO
    # hash[0] : nr , hash[1] : bestellung_hash
    #return @kasse.inject(Array.new){|ary,hash| ary<<[hash[0], hash[1].to_a]}.flatten
    return @kasse.map(){|nr,bestellung_hash| [nr, bestellung_hash.to_a]}.flatten
  end

  #inject
  def alle_produkte()
    # TODO
    @kasse.inject(Set.new()) {|set, (nr, hash_zweiten_eben)| set<< hash_zweiten_eben.keys }
    # set = Set.new()
    # @kasse.each{|nr, bestellung|  bestellung.keys.map(){|elem| set << elem}}
    # return set

  end

  #{ 'Insalata frutti di mare' => [1, 15] , ... }
  def wert(positionen)
    # TODO
    return positionen.inject(0) { |sum, (_productname, anzahl_preis_array)| sum +  anzahl_preis_array[1] }
    #Preis ist gesamte Preis
    #return positionen.inject(0){ |sum,paar| sum +=paar[1][0]*paar[1][1]}
  end

  def in_bestellung_mit_wert()
    # TODO
    #return @kasse.map(){|hash| [hash[0], wert(hash[1])]}
    return @kasse.map { |(nr, positionen_hash)| [nr, wert(positionen_hash)]}
  end

  def gesamt_bestellwert()
    # TODO
    #return in_bestellung_mit_wert.inject(0){|sum, ary| sum += ary[1] }
    return in_bestellung_mit_wert().inject(0) { |sum, (_nr, wert)| sum + wert }
  end


  def hoechste_bestellung()
    # TODO
      # if the max number are only one
      # if the max number are not one
      #return in_bestellung_mit_wert.find_all(){|elem| elem[1] == in_bestellung_mit_wert.max_by{|ary| ary[1]}[1]}.map(){|elem| elem[0]}.join(" ")
      # das Ergebenisse von "find_all()"  ist  ein geschachteltes array
      @kasse.max_by{|_nr, produkt_hash| wert(produkt_hash)}[0]
    # Alternative:
      # return in_bestellung_mit_wert.max_by {|ary| ary[1]}[0]
  end

  def anzahl_produkte(pos_hash)
    # TODO
    #anzahl_preis_array[0] : anzahl
    pos_hash.inject(0) { |sum, (_produktname, anzahl_preis_array)| sum + anzahl_preis_array[0] }
    # Alternative:
    #return pos_hash.inject(0){|sum, paar| sum += paar[1][0]}
  end

  def umfangreichste_bestellung()
    # TODO
    # if the max number are only one
    @kasse.max_by(){|nr, produkt_hash| anzahl_produkte(produkt_hash)}[0]

    # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Info ueber Nil!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # return @kasse.max_by {|bestellung_hash| anzahl_produkte(bestellung_hash[1])}[0]  if !@kasse.nil?
    #  if !@kasse.nil?  nicht noetig #Kasse kann nicht nil sein. wegen der Implementirung von "als_hash"
    #  #[] oder {} sind nicht nil.
    # # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Info ueber Nil!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # return "UNKNOWN"
  end

  #geschachtelte Each uber Kasse
  def in_produkte_mit_gesamt_bestellwert()
    # TODO
    hash = Hash.new()
    @kasse.each_value do|produkt_hash|
      produkt_hash.each do |name, anzahl_preis|
        !hash.key?(name) ? (hash[name] = anzahl_preis[1]) : (hash[name] += anzahl_preis[1]) #anzahl_preis[1] : Gesamte_Preis
      end
    end
    return hash #wichtig , sonst return @kasse, Fehler!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # all_produ = {}
    # for produkt in alle_produkte()
    #   sum = 0
    #   @kasse.each(){|nr, bestel| bestel.each {|elem|  sum += elem[1][1]*elem[1][0] if elem[0].eql?(produkt) }}
    #   all_produ[produkt] = sum
    # end
    # return all_produ
  end


  def produkte_mit_gesamt_bestellanzahl()
    #TODO
    hash = Hash.new()
    @kasse.each_value do|produkt_hash|
      produkt_hash.each do |name, anzahl_preis|
        !hash.key?(name) ? (hash[name] = anzahl_preis[0]) : (hash[name] += anzahl_preis[0]) #anzahl_preis[0] :Anzahl
      end
    end
    return hash  #mussen geben, Sonst return @kasse, Fehler!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    # all_produ = {}
    # for produkt in alle_produkte()
    #   sum = 0
    #   @kasse.each(){|nr, bestel| bestel.each {|elem|  sum += elem[1][0] if elem[0].eql?(produkt) }}
    #   all_produ[produkt] = sum
    # end
    # return all_produ

  end

  def sortiere_produkte_nach_anzahl_name()
    # TODO

    return produkte_mit_gesamt_bestellanzahl.sort_by{|(name, anzahl)| [anzahl, name]}
  end

  # in_produkte_mit_gesamt_bestellanzahl
  # {Vitello tonnato=>4
  # name_anzahl_ary_2[1] : anzahl
  # name_anzahl_ary_2[0] : name
  def sortiere_produkte_nach_anzahl_name_absteigend()
    return produkte_mit_gesamt_bestellanzahl.sort do |name_anzahl_paar_1,name_anzahl_paar_2|
      [name_anzahl_paar_2[1], name_anzahl_paar_2[0]] <=> [name_anzahl_paar_1[1], name_anzahl_paar_1[0]]
    end
  end
end



