class Approximator

  # Methode, die die Näherung  für PI**2/6 berechnet

  def approx_pi_quadrat_sechtel(n)
    summe = 0
    #Zählschleife计数循环
    for i in (1..n)
      summe += 1.0/(i**2)
    end
    return summe
  end

  # Methode, die das n bestimmt für das PI/6- approx_pi_sechstel < 10e-6

  def n_fuer_differenz_kleiner(abweichung) # Abweichung 10e-6
    i = 0
    begin
        i += 1
        sum = approx_pi_quadrat_sechtel(i)
    end while ((Math::PI**2/6 - sum) >= abweichung)
    return i
  end

end

wvf = Approximator.new()

puts Math::PI**2/6
puts wvf.approx_pi_quadrat_sechtel(100000)
puts wvf.n_fuer_differenz_kleiner(10e-5) # 10*10^(-5)    10 ist Koeffizient系数coefficient. e = 10
puts wvf.approx_pi_quadrat_sechtel(10000)
puts Math::PI**2/6 - wvf.approx_pi_quadrat_sechtel(10000)
