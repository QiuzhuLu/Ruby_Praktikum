class Abteil
  attr_reader :besetzte_plaetze, :sitzplaetze
  def initialize(sitzplaetze, besetzte_plaetze)
    @sitzplaetze = sitzplaetze
    @besetzte_plaetze = besetzte_plaetze
    @nachfolger = nil
  end

  def ankoppeln(ein_abteil)
    if @nachfolger.nil?
      @nachfolger = ein_abteil
    else
      @nachfolger.ankoppeln(ein_abteil)
    end
  end

  def each(&b)
    if !@nachfolger.nil?
      b.call(@nachfolger)
      @nachfolger.each(&b)
    end
  end

  def to_s()
    "A[#{@sitzplaetze},#{@besetzte_plaetze}]"
  end
end