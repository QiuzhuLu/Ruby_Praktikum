require "./Rechteck"
require "./Kreis"
require "./Dreieck"
require "./Leinwand"

class Haus
  # Die Position vom Haus:beim Intialisieren mit Default parameter(pos_x =0, pos_y=0) (0,680), unter links Ecke von dem Gebauedeskorpe.
  # Breit von dem Haus :80, Hoehe von dem Haus:80+40=120
  def initialize(pos_x=0, pos_y=0)
  @dach = Dreieck.new(pos_x+40, pos_y+560 , 40, 80, :grey,false)
  @fenster = Rechteck.new(pos_x+50, pos_y+610 , 20, 20,:yellow, false) # pos_x, pos_y sind obere link ecke.
  @tuer = Rechteck.new(pos_x+10,pos_y+620,20,38,:yellow, false)
  @gebaedekoerpe =  Rechteck.new(pos_x, pos_y+600 , 80, 80,:red, false)
  end


  # TODO Hier die Methoden implementieren
  def sichtbar_machen()
    @dach.sichtbar_machen
    @gebaedekoerpe.sichtbar_machen
    @fenster.sichtbar_machen
    @tuer.sichtbar_machen
  end

  def unsichtbar_machen()
    @dach.unsichtbar_machen
    @fenster.unsichtbar_machen
    @tuer.unsichtbar_machen
    @gebaedekoerpe.unsichtbar_machen
  end

  def bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @dach.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @fenster.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @tuer.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @gebaedekoerpe.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
  end

  def position
    # @gebaedekoerpe.obere_linke_ecke.+ (Punkt.new(0,80))
    # nicht gut :  .+(Punkt.new(0,80))
    # da der feste wert 80,der im intialize schon gespeichrt wird.
    @gebaedekoerpe.obere_linke_ecke.+ (Punkt.new(0,@gebaedekoerpe.hoehe))
    #return Punkt von gebaedekoerpe.unter_linke_ecke(gebaedekoerpe ist rechteck )
  end

  def auf_position_setzen(x,y)
    x_detal = x - position.x
    y_detal = y - position.y
    bewegen(x_detal,y_detal,1,10,0)
  end

  def in_farbig_aendern
    @dach.farbe_aendern("grau")
    @gebaedekoerpe.farbe_aendern("rot")
    @fenster.farbe_aendern("gelb")
    @tuer.farbe_aendern("gelb")
  end

  def in_schwarz_weiss_aendern
    @dach.farbe_aendern("hellgrau")
    @gebaedekoerpe.farbe_aendern("schwarz")
    @fenster.farbe_aendern("weiss")
    @tuer.farbe_aendern("weiss")
  end

end