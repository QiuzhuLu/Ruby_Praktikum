require_relative 'lok'
require_relative 'abteil'
class Zug
  #TODO
  include Enumerable
  def initialize()
   #TODO
   @lok =Lok.new()
   @erste_abteil = nil
  end

  def ankoppeln(ein_abteil)
    #TODO
    if @erste_abteil.nil?
      @erste_abteil = ein_abteil
    else
      @erste_abteil.ankoppeln(ein_abteil)
    end
  end

  def each(&b)
    #TODO
    if !@erste_abteil.nil?
      #b.call(@erste_abteil)
      @erste_abteil.each(&b)
    end
  end

  def to_s()
    output_string = "#{@lok.to_s}"
    if !@erste_abteil.nil?
      self.each do |abteil|
        output_string += "°-°" + abteil.to_s
      end
    end
    return output_string
  end

end