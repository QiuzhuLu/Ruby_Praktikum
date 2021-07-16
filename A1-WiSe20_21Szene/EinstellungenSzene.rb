$CLASSES = [:Szene, :Haus, :Baum, :Hund ]

#
# Methodenspezifikation fuer die Objekt- und Klassen-methoden der Klassen der Toolbox
#

$METHOD_CONFIG = {
  :Szene => {
  :sichtbar_machen => { :label => :sichtbar_machen },
  :unsichtbar_machen => { :label => :unsichtbar_machen },
  :in_tag_szene_aendern => { :label => :in_tag_szene_aendern },
  :in_nacht_szene_aendern => { :label => :in_nacht_szene_aendern },
  :animieren => {:label => :animieren}
  },
  :Szene_class => {
  :new => { :label => :'new()' },
  },
  :Haus => {
      :sichtbar_machen => { :label => :sichtbar_machen },
      :unsichtbar_machen => { :label => :unsichtbar_machen },
      :position => { :label => :position, :ergebnis => :Punkt },
      :auf_position_setzen => {:label => :'auf_position_setzen(...)', :args => [[:x, :Integer] ,[:y,:Integer]]},
      :in_farbig_aendern => { :label => :in_farbig_aendern },
      :in_schwarz_weiss_aendern => { :label => :in_schwarz_weiss_aendern },
  },
  :Haus_class => {
      :new => { :label => :'new()' },
  },
  :Baum => {
  :sichtbar_machen => { :label => :sichtbar_machen },
  :unsichtbar_machen => { :label => :unsichtbar_machen },
  :position => { :label => :position, :ergebnis => :Punkt },
  :auf_position_setzen => {:label => :'auf_position_setzen(...)', :args => [[:x, :Integer] ,[:y,:Integer]]},
  :in_farbig_aendern => { :label => :in_farbig_aendern },
  :in_schwarz_weiss_aendern => { :label => :in_schwarz_weiss_aendern },
  },
  :Baum_class => {
  :new => { :label => :'new()' },
  },
  :Hund => {
      :sichtbar_machen => { :label => :sichtbar_machen },
      :unsichtbar_machen => { :label => :unsichtbar_machen },
      :position => { :label => :position, :ergebnis => :Punkt },
      :auf_position_setzen => {:label => :'auf_position_setzen(...)', :args => [[:x, :Integer] ,[:y,:Integer]]},
      :in_farbig_aendern => { :label => :in_farbig_aendern },
      :in_schwarz_weiss_aendern => { :label => :in_schwarz_weiss_aendern },
      :animieren => {:label  => :animieren},
      :zuruecksetzen => {:label => :zuruecksetzen}

  },
  :Hund_class  => {
    :new => { :label => :'new()'}
  },
}

