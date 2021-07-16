require_relative "Kasse"

class KasseLeser
  
  def lese_kasse_von(datei_name)
    kasse = Kasse.new
    # output_info = "" # nicht empfohlen
    File.open(datei_name, 'r') do |f|
      f.each_with_index do |line,index|
        if line.strip.empty?
          # output_info += "Leerzeile in Zeile #{index+1}. Ignoriert.\n" # nicht empfohlen
          puts "Leerzeile in Zeile #{index+1}. Ignoriert.\n"
          # Fehlermeldungen werden auf dem Console ausgegeben.
        else
          ary = line.split("||")
          rechnung = Rechnung.new(ary[0].strip)
          ary.delete_at(0)
          ary.each do |elem|
            position_info = elem.split(";")
            position = Position.new(position_info[0] , position_info[1].to_i , position_info[2].to_i)
            rechnung.position_eintragen(position)
          end
          kasse.rechnung_eintragen(rechnung)
        end
      end
    end
    # output_info += "#{kasse.to_s}\n" # nicht empfohlen
    return kasse
    # gibt ein Objekt zurueck
    # nicht empfohlen: gibt ein Zeichenkette zurueck,
    # Dadurch kann man auch Fehlungenmeldung und richtige Ausgabe getrennt zurueckgeben.
  end
end

