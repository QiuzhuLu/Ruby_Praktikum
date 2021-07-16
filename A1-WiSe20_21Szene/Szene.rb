require "./Haus"
require "./Leinwand"
require "./Baum"
require "./Hund"

class Szene
  # man kann auch beim Initializieren beliege Parameter eingeben ,dann kann man die methode auf_position_setzen aufrufen,
  # damit das Object in der bestimmten Position ist.
  # Z.B
  # @baum4 = Baum.new(100,100)
  # @baum4.auf_position_setzen(800,680)
  # auf_position_setzen , die Methode ist effenzient , um ein Objekt umzustellen.
  # Die Position vom Baum: beim Initialisieren von default parameter(pos_x =0, pos_y=0): (300,680),unter links Eke von baumstamm
  # Die Position vom Hund: beim Intialisieren mit Default parameter(pos_x =0, pos_y=0) (0,45), hinderberin.unter_linke_ecke vom Hinterbeim
  # Die Position vom Haus:beim Intialisieren mit Default parameter(pos_x =0, pos_y=0) (0,680), unter links Ecke von dem Gebauedeskorpe.
  # Die folgende Objekte sind beim Erzeugen schon in der Position, wo wir moechten. Deshalbe keine Verwendung von der Methode "auf_position_setzen"
  def initialize()
    @baum1 = Baum.new(-160,0)# Position:(140,680)
    @baum2 = Baum.new()# Position:(300,680)
    @baum3 = Baum.new(400,0)# Position:(700,680)
    @haus1 = Haus.new(0,0)#Position:(0,680)
    @haus2 = Haus.new(450,0)#Position:(450,680)
    @haus3 = Haus.new(900,0)#Position:(900,680)
    @hund1 = Hund.new(100,100)
    @hund2 = Hund.new(100,400)
    @backgrund = Rechteck.new(0,0,1000, 680,:orange, false )
   end

  # TODO hier die Methoden implementieren
  def sichtbar_machen
    @backgrund.sichtbar_machen
    @baum1.sichtbar_machen
    @baum2.sichtbar_machen
    @baum3.sichtbar_machen
    @haus1.sichtbar_machen
    @haus2.sichtbar_machen
    @haus3.sichtbar_machen
    @hund1.sichtbar_machen
    @hund2.sichtbar_machen
  end
  def unsichtbar_machen
    @baum1.unsichtbar_machen
    @baum2.unsichtbar_machen
    @baum3.unsichtbar_machen
    @haus1.unsichtbar_machen
    @haus2.unsichtbar_machen
    @haus3.unsichtbar_machen
    @hund1.unsichtbar_machen
    @hund2.unsichtbar_machen
    @backgrund.unsichtbar_machen
  end
  def in_tag_szene_aendern
    @baum1.in_farbig_aendern
    @baum2.in_farbig_aendern
    @baum3.in_farbig_aendern
    @haus1.in_farbig_aendern
    @haus2.in_farbig_aendern
    @haus3.in_farbig_aendern
    @hund1.in_farbig_aendern
    @hund2.in_farbig_aendern
    @backgrund.farbe_aendern("orange")
  end
  def in_nacht_szene_aendern
    @baum1.in_schwarz_weiss_aendern
    @baum2.in_schwarz_weiss_aendern
    @baum3.in_schwarz_weiss_aendern
    @haus1.in_schwarz_weiss_aendern
    @haus2.in_schwarz_weiss_aendern
    @haus3.in_schwarz_weiss_aendern
    @hund1.in_schwarz_weiss_aendern
    @hund2.in_schwarz_weiss_aendern
    @backgrund.farbe_aendern("weiss")
  end
  def animieren
    @hund1.animieren
    @hund2.animieren
  end
end