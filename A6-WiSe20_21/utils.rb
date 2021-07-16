def trenner(text,sym="-")
  puts
  puts text.ljust(120,sym)
  puts
end

def pp_nested_hash(a_hash, indent=0)
  a_hash.each_with_index() do |(key,val),index|

    if val.is_a?(Hash)
      puts "#{" "*indent}#{key}=>"
      pp_nested_hash(val, "#{" "*indent}#{key}=>".size())
    else
      puts "#{" "*indent}#{key}=>#{val}"
    end
  end
end

def pp_hash(a_hash)
  print "{"
  size = a_hash.size()
  a_hash.each_with_index() do |(key,val),index|
    key_val_string = "#{key}=>#{val}"
    if index < size-1
      puts key_val_string
    else
      print key_val_string
    end

  end
  puts "}"
end