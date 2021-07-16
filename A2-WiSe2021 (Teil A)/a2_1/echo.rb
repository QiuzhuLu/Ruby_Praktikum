# Methode echo

# Bedingung gesteuerte Schleife :

# 1)vorprüfenden while-Schleife, 2)nachprüfenden while-Schleife,
# 3)vorprüfenden until-Schleife, 4)nachprüfenden until -Schleife
class Gebirge
  #vorprüfenden while-Schleife.
  def echo1()
    #vorpruefenden while-schleife muss eingabe vordefiniert werden.
    eingabe = ""
    puts "Hallo ich bin Dein Echo1. Beenden kannst Du mich mit 'bye'"
    while (!eingabe.eql?("bye" ))
      eingabe = gets().chomp()
      puts eingabe
    end
  end

  #nachprüfenden while-Schleife
  # wird minds einmal ausgefuehrt.
  def echo2()
    puts "Hallo ich bin Dein Echo2. Beenden kannst Du mich mit 'bye'"
    begin
      eingabe = gets().chomp()
      puts eingabe
    end while(!eingabe.eql?("bye" ))
  end

  #vorprüfenden until-Schleife
  def echo3()
    eingabe = ""
    puts "Hallo ich bin Dein Echo3. Beenden kannst Du mich mit 'bye'"
    until (eingabe.eql?("bye" ))
      eingabe = gets().chomp()
      puts eingabe
    end
  end

  # nachprüfenden until -Schleife
  def echo4()
    puts "Hallo ich bin Dein Echo4. Beenden kannst Du mich mit 'bye'"
    begin
      eingabe = gets().chomp()
      puts eingabe
    end until(eingabe.eql?("bye" ))
  end

end

echo = Gebirge.new()
echo.echo1()
echo.echo2()
echo.echo3()
echo.echo4()
