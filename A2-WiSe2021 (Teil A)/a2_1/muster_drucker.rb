class MusterDrucker

  def rechteck(n)
    for i in (1..n)
      for j in (1..n)
        if ( i == 1 || i == n || j == 1 || j == n)
          print "*"
        else
          print " "
        end
      end
      puts
    end
  end

  def kreuz(n)
    if n.even?
      puts "Kreuz nicht definiert fuer gerades n"
    else
      for i in (1..n)
        for j in (1..n)
          if (i==j || j+i == 1+n)
            print "*"
          else
            print " "
          end
        end
        puts
      end
    end
  end

  def dreieck_oben(n)
    if n.even?
      puts  "Dreieck nicht definiert fuer gerades n"
    else
      for i in (0..n-1)
        for j in (0..n-1)
          if (j >= i)
            print "*"
          else
            print " "
          end
        end
        puts
        # new line j ist wie x kante
      end
    end
  end



  def raute(n)#菱形Rhombus
    if n.even?
      puts "Raute nicht definiert fuer gerades n"
    else
      mittel = n/2
      for i in (0..n-1)
        for j in (0..n-1)
          if (i<=mittel && (j == mittel+i || j == mittel-i)) ||((i>mittel)&& (j == i- mittel || j == (n-1) -(i-mittel)))
          print "*"
          else
            print " "
          end
        end
        puts
      end
    end
  end
end

drucker = MusterDrucker.new()

drucker.rechteck(8)
puts
drucker.kreuz(9)
drucker.kreuz(8)
puts
drucker.raute(7)
drucker.raute(6)
puts
drucker.dreieck_oben(9)
drucker.dreieck_oben(8)
