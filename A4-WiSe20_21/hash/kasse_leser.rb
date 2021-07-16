class KasseLeser

  DATEI = "../rechnungen.sv"

  def als_hash()
    kasse_hash = {}
    # TODO
    File.open(DATEI, 'r') do |f|
      f.each do |line|
        if !line.strip.empty?
          ary = line.split("||")
          bestellnummer =  ary.delete_at(0).strip
          hash_zweiten_eben = {}
          ary.each do |elem|
            position_info = elem.split(";")
            produktname = position_info.delete_at(0).strip
            hash_zweiten_eben[produktname] = [position_info[0].strip.to_i, position_info[1].strip.to_i]
          end
          kasse_hash[bestellnummer] = hash_zweiten_eben
        end
      end
    end
    return kasse_hash
  end
end

