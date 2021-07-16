$BYE = 'bye'
$PADX = 5
$TOOLBOXTITLE = 'KinokartenAutomat'
$METHODS = :Methoden
$INSTANCES = :Instanzen
$BACKGROUND_COLOR = 'white'
$INSPECTOR = 'Inspektor'
$FILEMENU = 'Datei'
$CLASSMENU = 'Klassen'

require './EinstellungenKinokartenAutomat'

# DIE REIHENFOLGE DARF NICHT GEÄNDERT WERDEN
# VARIABLE $CLASSES MUSS DEFINIERT SEIN
# Metaprogrammierung: generischer Instancecount
class Object
  def intern_to_s()
    to_s()
  end
end

class InstanceCounter
  class << self
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

# Für eine geeignete Darstellung von Enumerable
# Array, Hash, Range und Set
class Object
  def enum_to_s()
    to_s()
  end
end

class Array
  def enum_to_s()
    enum_str = self.inject("[") { |enum_str,elem |  "#{enum_str} #{elem.enum_to_s()}," }
    enum_str[enum_str.length-1] = "]"
    return enum_str
  end
end

class Set
  def enum_to_s()
    enum_str = self.inject("{") { |enum_str,elem |  "#{enum_str} #{elem.enum_to_s()}," }
    enum_str[enum_str.length-1] = "}"
    return enum_str
  end
end

class Range
  def enum_to_s()
    self.exclude_end?() ? "(#{self.first.enum_to_s()}...#{self.last.enum_to_s()})"  : "(#{self.first.enum_to_s()}..#{self.last.enum_to_s()})"
  end
end

class Hash
  def enum_to_s()
    enum_str = self.inject("{") { |enum_str,key,value |  "#{enum_str} #{key.enum_to_s()} => #{value.enum_to_s()}," }
    enum_str[enum_str.length-1] = "}"
    return enum_str
  end
end

# Hier wird für alle registrierten Klassen in $CLASSES
# der  InstanceCounter  eingebunden
# Metaprogrammierung: generischer Instancecount

$CLASSES.each do |class_sym|
  self.class.const_set(class_sym, Class.new(InstanceCounter) {
    def intern_to_s()
      string = self.class.to_s()
      string[0] = string[0,1].downcase
      return "#{string}_#{@number}"
    end

    def self.method_added(p)
      # Ergänzt initialize um den Instance Count
      if (p == :initialize)
        if (!@initialize_hooked)
          @initialize_hooked = true
          module_eval{
            alias :alias_initialize :initialize
            define_method(:initialize) {|*args|
              alias_initialize(*args)
              @number = instance_count() if !@number
            }
          }
        end
      end
    end
  })
end

require "./KinokartenAutomat"
require "./Tarif"