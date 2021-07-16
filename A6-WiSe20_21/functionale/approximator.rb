require_relative '../utils.rb'
# f(n) = 1 für n==0; f(n) = f(n-1)+(-1)^n*1/2^n

# TODO f_rek einfach rekursiv mit Exceptions, wenn n nicht vom korrekten Typ oder ungültiger Wert
# A.6.1.1

def f_rek(n)
  check_type(n, Integer)
  check_greater(n,-1) # n >= 0
  return formel1(0) if n == 0
  return f_rek(n-1) + formel1(n)
end

def formel1(n)
  return (-1.0)**n * 1/2**n
end

def check_type(val,type)
  raise ArgumentError, "#{val} gehört nicht zum Typ #{type}." unless val.is_a?(type)
end

def check_greater(val,lower_bound)
  raise ArgumentError, "#{val} ist lower oder gleich als #{lower_bound}." unless val > lower_bound
end

# TODO f_rek_end Endrekursiv mit Exceptions
# A6.1.1

def f_rek_end(n,sp=formel1(0))
  check_greater(n,-1)
  check_type(n, Integer)
  return sp if n == 0
  return f_rek_end(n-1,sp + formel1(n))
end

# TODO f_iter
# A6.1.1

def f_iter(n)
  check_greater(n,-1)
  check_type(n, Integer)
  return (0..n).inject(0) {|sum, i| sum + formel1(i)}
end


# ln(x,n) = summe_i=(1..n) (x-1)^i/(i*x^i) für x > 0.5
# TODO ln_rek einfach rekursiv mit Prüfung auf Type und Wert
# A6.1.2

def ln_rek(x,n)
  checks_ln(x,n)
  return formel_x_n(x, 1) if n==1
  return formel_x_n(x, n) + ln_rekursiv(x, n-1)
end


def checks_ln(x,n)
  check_type(x, Numeric)
  check_greater(x, 0.5)
  check_type(n, Integer)
  check_greater(n, 0) # n >= 1
end

def formel2(x,n)
  return (x-1.0)**n / (n * x**n)
end

# TODO ln_rek end-rekursiv mit Prüfung auf Type und Wert
# A6.1.2

def ln_rek_end(x,n,sp=formel2(x,1))
  checks_ln(x,n)
  return sp if n == 1
  return ln_rek_end(x, n-1, sp + formel2(x,n))
end

# TODO iterativ

def ln_iter(x,n)
  checks_ln(x,n)
  return (1..n).inject(0){|sum, i | sum + formel_x_n(x, i)}
end



