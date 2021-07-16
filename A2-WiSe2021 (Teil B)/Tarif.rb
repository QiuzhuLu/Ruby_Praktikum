class Tarif

  attr_reader :betrag

  def initialize(name,betrag)
    @name = name
    @betrag = betrag
  end

  def to_s()
    "#{@name} #{@betrag}"
  end
  # in Toolbox wird die Method to_s() beutzt.
end