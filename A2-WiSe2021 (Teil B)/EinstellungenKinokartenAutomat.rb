$CLASSES = [:KinokartenAutomat, :Tarif]

# Methodenkonfiguration der Objektmethoden und Klassenmethoden
# von KinokartenAutomat
$METHOD_CONFIG = {
    :KinokartenAutomat => {
        :tarif_waehlen => {:label => :tarif_waehlen, :args => [[:tarif , :Tarif]]},
        :abbrechen => {:label => :abbrechen, :ergebnis => :Integer},
        :karten_preis => {:label => :karten_preis, :ergebnis => :Integer},
        :summe_automat => {:label => :summe_automat, :ergebnis => :Integer},
        :eingeworfen => {:label => :eingeworfen, :ergebnis => :Integer},
        :betrag_einwerfen => {:label => :betrag_einwerfen, :args => [[:betrag, :Integer]]},
        :wechsel_geld => {:label => :wechsel_geld, :ergebnis => :Integer },
        :karte_drucken => {:label => :karte_drucken}
    },
    :KinokartenAutomat_class => {
        :new => {:label => :new}
    },
    :Tarif => {},
    :Tarif_class => {
        :new => {:label => :"new(...)", :args => [[:name,:String],[:betrag,:Integer]]}
    }
}
