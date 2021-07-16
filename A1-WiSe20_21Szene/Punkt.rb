# Author::    Birgit Wendholt 
# Copyright:: Adaptiert die BlueJ Implementierung (Michael Kölling & David J. Barnes) für Ruby und Tcl-TK

class Punkt
  def initialize(x,y)
    @x = x
    @y = y
  end
  
  def x
    return @x
  end
  def y
      return @y    
  end
  def + (point)
    return Punkt.new(@x+point.x, @y+point.y)
  end
  
  def *(n)
    return Punkt.new(@x*n, @y*n)
  end
  
  
  def to_s()
      return "Point(#@x,#@y)"    
  end
end