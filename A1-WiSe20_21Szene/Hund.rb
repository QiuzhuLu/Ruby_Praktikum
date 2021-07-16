require './Rechteck'
require "./Kreis"

class Hund

  def initialize(pos_x=0, pos_y=0)
    # die präsentierten Inhalte anzeigt
    #@pos_x,@pos_y um die umsprunglische Position(pos_x, pos_y+45) zu speichern.
    # Die Position vom Hund: beim Intialisieren mit Default parameter(pos_x =0, pos_y=0) (0,45), hinderbein.unter_linke_ecke vom Hinterbeim
    @pos_x = pos_x
    @pos_y = pos_y
    @koerper = Rechteck.new(pos_x, pos_y,40,30,:blue,false )
    @vorderbein = Rechteck.new(pos_x+30, pos_y+30, 10,15,:green,false )
    @hinderbein = Rechteck.new(pos_x+0, pos_y+30, 10, 15, :green, false )
    @kopf = Rechteck.new(pos_x+40, pos_y, 15, 30,:yellow, false )
    @auge = Kreis.new(pos_x+50, pos_y+10, 2, :blue, false)
    @mund = Rechteck.new(pos_x+50,pos_y+20,5,1,:red,false )
  end

  # TODO Hier die Methoden implementieren
  def sichtbar_machen()
    @koerper.sichtbar_machen
    @vorderbein.sichtbar_machen
    @hinderbein.sichtbar_machen
    @kopf.sichtbar_machen
    @auge.sichtbar_machen
    @mund.sichtbar_machen
  end

  def unsichtbar_machen()
    @koerper.unsichtbar_machen
    @vorderbein.unsichtbar_machen
    @hinderbein.unsichtbar_machen
    @kopf.unsichtbar_machen
    @auge.unsichtbar_machen
    @mund.unsichtbar_machen
  end

  def bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @koerper.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @vorderbein.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @hinderbein.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @kopf.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @auge.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
    @mund.bewegen(x_delta, y_delta, wdhln, wdh_nach, starten_nach)
  end

  def position
    #@hinderbein.obere_linke_ecke.+ (Punkt.new(0,15))
    # nicht gut :  .+(Punkt.new(0,15))
    # da der feste wert 15,der im intialize schon gespeichrt wird.
    @hinderbein.obere_linke_ecke.+ (Punkt.new(0,@hinderbein.hoehe))
    #return Punkt von hinderbein.unter_linke_ecke(hinderbein ist rechteck )
  end

  def auf_position_setzen(x,y)
    x_detal = x - position.x
    y_detal = y - position.y
    bewegen(x_detal,y_detal,1,0,0)
    #wdhln: insgesamt laufzahl, bei wdhln=0 kann nicht mehr laufen
  end

  def in_farbig_aendern
    @koerper.farbe_aendern("blau")
    @hinderbein.farbe_aendern("gruen")
    @vorderbein.farbe_aendern("gruen")
    @kopf.farbe_aendern("gelb")
    @auge.farbe_aendern("blau")
    @mund.farbe_aendern("rot")
  end

  def in_schwarz_weiss_aendern
    @koerper.farbe_aendern("schwarz")
    @hinderbein.farbe_aendern("schwarz")
    @vorderbein.farbe_aendern("schwarz")
    @kopf.farbe_aendern("schwarz")
    @auge.farbe_aendern("weiss")
    @mund.farbe_aendern("weiss")
  end

  def animieren
   bewegen(1,0,400,100,0)
   bewegen(-1,0,400,100,40000)# starten_nach 40000= wdln * wdh.nach =400*100
   # die wichtige Unterschide zwischen den Methoden "animieren" und "auf_position_setzen" ist die parameter whdln, die Zahl von dem Widerholen
   # Hier ist 400 mal, bei der Methode "auf_position_setzen": nur 1 mal

  end

  def zuruecksetzen
    #self.auf_position_setzen(@pos_x,@pos_y+45)
    # Erste nicht gut : es ist nicht ersichtlich, wie ich auf 45 komme.
    # wenn der feste Wert schon in intialize geschpeichert, benutzt man besser nicht den festen Wert,
    self.auf_position_setzen(@pos_x,@pos_y + @koerper.hoehe + @hinderbein.hoehe)
  end

end