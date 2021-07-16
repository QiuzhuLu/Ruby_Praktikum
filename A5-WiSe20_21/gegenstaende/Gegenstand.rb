class Gegenstand
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def to_s(kurzform = false)
    if kurzform
      "#{self.class.name[0..1]}." + gegenstand_spezifisch_to_s(kurzform)
    else
      "#{self.class}:#{@name}" + gegenstand_spezifisch_to_s(kurzform)
    end
  end

  def gegenstand_spezifisch_to_s(kurzform = false)
    ""
  end
end
