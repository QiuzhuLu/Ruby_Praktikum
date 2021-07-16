require "Set"
module Enumerable

  # A6.2.1	Schreiben Sie die Methode count_inner_nodes()
  # für das Modul Enumerable. Die Methode zählt alle
  # in einem beliebig geschachtelten Enumerable
  # enthaltenen Enumerables.
  # Überschreiben Sie die Methode in der Klasse Hash, so dass
  # die Methode für beliebige Enumerables korrekt arbeitet

  def count_inner_nodes(ct = 0)
    self.each do |elem|
        if elem.is_a?(Enumerable)
          ct = elem.count_inner_nodes(ct + 1)
        end
    end
    return ct
  end


  #	A6.2.2 Schreiben Sie die Methode deep_count(elem) für die Modul Enumerable,
  # die die Anzahl der Elemente in einem beliebig geschachtelten
  # Enumerable zählt. Die Methode gibt 0 zurück, wenn das Element nicht
  # enthalten ist.

  def deep_count(elem, ct = 0)
    self.each do |my_elem|
      if my_elem.is_a?(Enumerable)
        ct = my_elem.deep_count(elem, ct)
      end
      if my_elem.eql?(elem)
        ct += 1
      end
    end
    return ct
  end

  #A6.2.3 Schreiben Sie eine Methode, die alle Enumerables
  #eines Enumerables einsammelt: deep_collect
  #Überschreiben Sie Methode deep_collect() in der Klasse Hash, so dass
  #die Methode für beliebige Enumerables korrekt arbeitet

  def deep_collect(collector = [])
    self.each do |elem|
      if elem.is_a?(Enumerable)
        collector << elem
        elem.deep_collect(collector)
      end
    end
    return collector
  end

  # A6.2.4	Schreiben Sie eine Methode, die rekursiv das
  # maximale Element eines beliebig geschachtelten Enumerables bestimmt,
  # das sonst nur Zahlen enthält.
  def deep_max_elem(max = nil)
    self.each do |elem|
      if elem.is_a?(Enumerable)
        max = elem.deep_max_elem(max)
      else
         max = max.nil? ? elem :  [elem, max].max
      end
    end
    return max
  end
  [[8],1].deep_max_elem

  # A6.2.5	Schreiben Sie eine Methode für das Modul Enumerable, die rekursiv in einem
  # beliebig geschachtelten Enumerable die Häufigkeit des Auftretens der Typen in einem Hash einsammelt
  # deep_count_types(type_count = {})
  # Überschreiben Sie diese Methode in der Klasse Hash, so dass
  # die Methode für beliebige Enumerables korrekt arbeitet



  def deep_count_types(type_count = Hash.new(0))
    self.each do |elem|
      deep_count_elem_types(elem, type_count)
    end
    return type_count
  end

  ## Hilfemethode für deep_count_types
  def deep_count_elem_types(elem, type_count = Hash.new())
    if type_count[elem.class].nil?
      type_count[elem.class] = 1
    else
      type_count[elem.class] += 1
    end
    if elem.is_a?(Enumerable)
      elem.deep_count_types(type_count)
    end
  end


  # A6.2.6	Schreiben Sie eine Methode für das Modul Enumerable, die rekursiv die maximale Tiefe
  # bestimmt.
  # Überschreiben Sie diese Methode in der Klasse Hash, so dass
  # die Methode für beliebige Enumerables korrekt arbeitet
  def max_depth()
    max_d = 0
    self.each do |elem|
      if elem.is_a?(Enumerable)
        max_d = [max_d, elem.max_depth+1].max
      end
    end
    return max_d
  end

  ary = [1, [2,[3]]]
  p ary.max_depth

end

class Hash

  # A6.2.1	Schreiben Sie die Methode count_inner_nodes()
  # für das Modul Enumerable. Die Methode zählt alle
  # in einem beliebig geschachtelten Enumerable
  # enthaltenen Enumerables.
  # Überschreiben Sie die Methode in der Klasse Hash, so dass
  # die Methode für beliebige Enumerables korrekt arbeitet

  def count_inner_nodes(ct = 0)
    self.each do |key, value|
      if key.is_a?(Enumerable)
        ct = key.count_inner_nodes(ct+1)
      end
      if value.is_a?(Enumerable)
        ct = value.count_inner_nodes(ct+1)
      end
    end
    return ct
  end

  #A6.2.3 Schreiben Sie eine Methode, die alle Enumerables
  #eines Enumerables einsammelt: deep_collect
  #Überschreiben Sie Methode deep_collect() in der Klasse Hash, so dass
  #die Methode für beliebige Enumerables korrekt arbeitet

  def deep_collect(collector = [])
    self.each do |key, value|
      if key.is_a?(Enumerable)
        collector << key
        key.deep_collect(collector)
      end
      if value.is_a?(Enumerable)
        collector << value
        value.deep_collect(collector)
      end
    end
    return collector
  end

  # A6.2.5	Schreiben Sie eine Methode für das Modul Enumerable, die rekursiv in einem
  # beliebig geschachtelten Enumerable die Häufigkeit des Auftretens der Typen in einem Hash einsammelt
  # deep_count_types(ary, type_count = {})
  # Überschreiben Sie diese Methode in der Klasse Hash, so dass
  # die Methode für beliebige Enumerables korrekt arbeitet
  # ary = [1, [2, [3]]] # {Integer => 3, Array => 2}
  def deep_count_types(type_count = Hash.new(0))
    self.each do |key, value|
      deep_count_elem_types(key, type_count)
      deep_count_elem_types(value, type_count)
    end
    return type_count
  end


  # A6.2.6	Schreiben Sie eine Methode für das Modul Enumerable, die rekursiv die maximale Tiefe
  # bestimmt.
  # Überschreiben Sie diese Methode in der Klasse Hash, so dass
  # die Methode für beliebige Enumerables korrekt arbeitet
  def max_depth()
    max_d = -1
    self.each do |key, value|
      if key.is_a?(Enumerable)
        max_d = [ key.max_depth, max_d].max
      end
      if value.is_a?(Enumerable)
        max_d = [value.max_depth, max_d].max
      end
    end
    return max_d + 1
  end

  # A6.2.7 Schreiben Sie die Methode deep_invert für die Klasse Hash, die einen beliebig geschachtelten Hash rekursiv
  # invertiert, d.h. in allen Hashes die Schlüssel mit den Werten vertauscht.
  def deep_invert()
    deep_invert = {}
    self.each do |key, value|
      if !value.is_a?(Hash) && !key.is_a?(Hash)
        deep_invert[value] = key
      else
        if key.is_a?(Hash) && !value.is_a?(Hash)
          deep_invert[value] = key.deep_invert
        elsif value.is_a?(Hash) && !key.is_a?(Hash)
          deep_invert[value.deep_invert] = key
        else
          deep_invert[value.deep_invert] = key.deep_invert
        end
      end
    end
    return deep_invert
  end

  # A6.2.8 Schreiben Sie die Methode deep_to_a für die Klasse Hash, die einen beliebig geschachtelten Hash rekursiv
  # in ein Array von Arrays umwandelt.
  def deep_to_a()
    deep_to_a = []
    self.each do |key, value|
      if !value.is_a?(Hash) && !key.is_a?(Hash)
        deep_to_a << [key, value]
      else
        if key.is_a?(Hash) && !value.is_a?(Hash)
          deep_to_a << [key.deep_to_a, value]
        elsif value.is_a?(Hash) && !key.is_a?(Hash)
          deep_to_a << [key, value.deep_to_a]
        else
          deep_to_a << [key.deep_to_a, value.deep_to_a]
        end
      end
    end
    return deep_to_a
  end

end