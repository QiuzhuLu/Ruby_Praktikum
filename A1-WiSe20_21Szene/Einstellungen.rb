# generischer Instanzenzähler für alle Klassen


$BYE = 'bye'
$PADX = 5
$TOOLBOXTITLE = 'Szene'
$METHODS = :Methoden
$INSTANCES = :Instanzen
$BACKGROUND_COLOR = 'white'
$INSPECTOR = 'Inspektor'
$FILEMENU = 'Datei'
$CLASSMENU = 'Klassen'

require './EinstellungenSzene'

# DIE REIHENFOLGE DARF NICHT GEÄNDERT WERDEN
# VARIABLE $CLASSES MUSS DEFINIERT SEIN
# Metaprogrammierung: generischer Instancecount

class Object
  def intern_to_s()
    to_s()
  end
end

class InstanceCounter
  class << self # the class << foo syntax opens up foo's singleton class (eigenclass)特征类.
    attr_reader :instances
    attr_writer :instances
  end

  def instance_count()
    self.class.instances ||=0
    #a ||= b is a conditional assignment operator.
    # It means if a is undefined or falsey, then evaluate b and set a to the result. Equivalently,
    # if a is defined and evaluates to truthy, then b is not evaluated, and no assignment takes place
    self.class.instances +=1
  end

end


# Hier wird für alle registrierten Klassen in $CLASSES
# der  InstanceCounter  eingebunden
# Metaprogrammierung: generischer Instancecount元编程：通用实例计数 Metaprogramming: generic instance count

$CLASSES.each do |class_sym|
  self.class.const_set(class_sym, Class.new(InstanceCounter) {
    def intern_to_s()
      string = self.class.to_s()
      string[0] = string[0,1].downcase
      #string[0] is a new string that contains the first character of string.
      return "#{string}_#{@nummer}"
    end

    def self.method_added(p)
      # Ergänzt initialize um den Instance Count #用实例计数补充初始化
      if (p == :initialize)
        if (!@initialize_hooked)
          @initialize_hooked = true
          module_eval{
            alias :alias_initialize :initialize
            # :initialize can also be called by using :alias_intialize
            define_method(:initialize) {|*args|
              alias_initialize(*args) # == intialize(*args)
              @nummer = instance_count() if !@nummer      ##????
            }
          }
        end
      end
    end
  })
end

require './Szene'
require './Haus'
require './Baum'
require './Hund'


