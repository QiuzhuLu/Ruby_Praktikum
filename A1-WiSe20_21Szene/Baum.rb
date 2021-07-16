require "./Rechteck"
require "./Kreis"
require "./Dreieck"
require "./Leinwand"

class Baum
  # Durch Eingabe von pos_x und pos_y kann man belieg Baueme im verschiedenen Positionen erzeugen
  # Die Position vom Baum: beim Initialisieren von default parameter(pos_x =0, pos_y=0): (300,680),unter links Eke von baumstamm
  def initialize(pos_x=0, pos_y=0)
    @stamm = Rechteck.new(pos_x+300, pos_y+600 , 20, 80, :grey,false)
    @baumskroneunter = Dreieck.new(pos_x+310, pos_y+560 , 60, 80,:green, false) # pos_x, pos_y sind obere link ecke.
    @baumskroneoben = Dreieck.new(pos_x+310,pos_y+540,50,80,:green, false)
  end


  # TODO Hier die Methoden implementieren
  def sichtbar_machen()
    @stamm.sichtbar_machen
    @baumskroneoben.sichtbar_machen
    @baumskroneunter.sichtbar_machen
  end

  def unsichtbar_machen()
    @stamm.unsichtbar_machen
    @baumskroneunter.unsichtbar_machen
    @baumskroneoben.unsichtbar_machen
  end

  def bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @stamm.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @baumskroneoben.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @baumskroneunter.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
  end

  def position
    @stamm.obere_linke_ecke.+ (Punkt.new(0,@stamm.hoehe))
    #Anmerkung,
    # nicht gut :  .+(Punkt.new(0,80))
    # da der feste wert 80 stamm_Hoehe ist,der im intialize schon gespeichrt wird.
    #return Punkt von stamm.unter_linke_ecke(Stamm ist rechteck )
  end

  def auf_position_setzen(x,y)
    x_detal = x - position.x  # x: ziel_x, Y:ziel_y:
    y_detal = y - position.y
    bewegen(x_detal,y_detal,1,10,0)
  end

  def in_farbig_aendern
    @stamm.farbe_aendern("grau")
    @baumskroneoben.farbe_aendern("gruen")
    @baumskroneunter.farbe_aendern("gruen")
  end

  def in_schwarz_weiss_aendern
    @stamm.farbe_aendern("schwarz")
    @baumskroneunter.farbe_aendern("hellgrau")
    @baumskroneoben.farbe_aendern("hellgrau")
  end

end