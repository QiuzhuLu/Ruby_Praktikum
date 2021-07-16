require_relative '../utils'
require_relative 'nested_enumerables'
require "Set"


def expected_calculated(nested_enum, expected, calculated)
  puts "#{nested_enum}"
  puts "Expected:   #{expected}\nCalculated: #{calculated}\n\n"
end

empty_ary = []
empty_hash = {}
empty_set = Set.new()
nested_hash2 = {2 => 9}
nested_hash3 = {1 => 7}
nested_hash4 = {[2, 11] => Set[Set[3, 24], 7]}
nested_hash5 = {2 => [9, 14]}
nested_hash1 = {1 => [4, 5, Set[1, [3], 7, Set[1, 2]]],
                nested_hash2 => Set[1, 3, 11],
                nested_hash3 => nested_hash4,
                3 => nested_hash5}

nested_ary = [1, 2, nested_hash1,
              [2, Set[1, 7, 9]], [[[1], 2], 3]]

trenner("A6.2.1 count_inner_nodes")

p empty_ary
puts empty_ary.count_inner_nodes()
p empty_set
puts empty_set.count_inner_nodes()
p empty_hash
puts empty_hash.count_inner_nodes()

if Hash.instance_methods(false).include?(:count_inner_nodes)
  puts "WITH OVERRIDE IN HASH"
  expected_calculated(nested_hash4, 3, nested_hash4.count_inner_nodes())
  expected_calculated(nested_ary, 19, nested_ary.count_inner_nodes)
else
  puts "WITHOUT OVERRIDE IN HASH"
  expected_calculated(nested_hash4, 4, nested_hash4.count_inner_nodes())
  expected_calculated(nested_ary, 27, nested_ary.count_inner_nodes)
end


trenner("A6.2.2 deep_count(3)")

expected_calculated(nested_ary, 5, nested_ary.deep_count(3))

trenner("A6.2.3 deep_collect")

if Hash.instance_methods(false).include?(:deep_collect)
  puts "WITH OVERRIDE IN HASH"
  expected_calculated(nested_hash2, [], nested_hash2.deep_collect())
  expected_calculated(nested_hash3, [], nested_hash3.deep_collect())
  expected_calculated(nested_hash4, "[[2, 11], #<Set: {#<Set: {3, 24}>, 7}>, #<Set: {3, 4}>]", nested_hash4.deep_collect())
  expected_calculated(nested_hash5, "[[9, 14]]", nested_hash5.deep_collect())
  expected_calculated(nested_hash1, "[[4, 5, #<Set: {1, [3], 7, #<Set: {1, 2}>}>], #<Set: {1, [3], 7, #<Set: {1, 2}>}>, [3], #<Set: {1, 2}>, {2=>9}, #<Set: {1, 3, 11}>, {1=>7}, {[2, 11]=>#<Set: {#<Set: {3, 24}>, 7}>}, [2, 11], #<Set: {#<Set: {3, 24}>, 7}>, #<Set: {3, 24}>, {2=>[9, 14]}, [9, 14]]", nested_hash1.deep_collect())
else
  puts "WITHOUT OVERRIDE IN HASH"
  expected_calculated(nested_hash2, [[2, 9]], nested_hash2.deep_collect())
  expected_calculated(nested_hash3, [[1, 7]], nested_hash3.deep_collect())
  expected_calculated(nested_hash4, "[[[2, 11], #<Set: {#<Set: {3, 24}>, 7}>], [2, 11], #<Set: {#<Set: {3, 24}>, 7}>, #<Set: {3, 24}>]", nested_hash4.deep_collect())
  expected_calculated(nested_hash5, "[[2, [9, 14]], [9, 14]]", nested_hash5.deep_collect())
  expected_calculated(nested_hash1, "[[1, [4, 5, #<Set: {1, [3], 7, #<Set: {1, 2}>}>]], [4, 5, #<Set: {1, [3], 7, #<Set: {1, 2}>}>], #<Set: {1, [3], 7, #<Set: {1, 2}>}>, [3], #<Set: {1, 2}>, [{2=>9}, #<Set: {1, 3, 11}>], {2=>9}, [2, 9], #<Set: {1, 3, 11}>, [{1=>7}, {[2, 11]=>#<Set: {#<Set: {3, 24}>, 7}>}], {1=>7}, [1, 7], {[2, 11]=>#<Set: {#<Set: {3, 24}>, 7}>}, [[2, 11], #<Set: {#<Set: {3, 24}>, 7}>], [2, 11], #<Set: {#<Set: {3, 24}>, 7}>, #<Set: {3, 24}>, [3, {2=>[9, 14]}], {2=>[9, 14]}, [2, [9, 14]], [9, 14]]", nested_hash1.deep_collect())
end

trenner("A6.2.4 deep_max_elem")

expected_calculated(nested_ary, 24, nested_ary.deep_max_elem())

trenner("A6.2.5 deep_count_types")

if Hash.instance_methods(false).include?(:deep_count_types)
  puts "WITH OVERRIDE IN HASH"
  expected_calculated(nested_hash2, "{Integer=>2}", nested_hash2.deep_count_types())
  expected_calculated(nested_hash3, "{Integer=>2}", nested_hash3.deep_count_types())
  expected_calculated(nested_hash4, "{Array=>1, Set=>2, Integer=>5}", nested_hash4.deep_count_types())
  expected_calculated(nested_hash5, "{Integer=>3, Array=>1}", nested_hash5.deep_count_types())
  expected_calculated(nested_hash1, "{Integer=>24, Array=>4, Set=>5, Hash=>4}", nested_hash1.deep_count_types())
  expected_calculated(nested_ary, "{Integer=>33, Hash=>5, Array=>8, Set=>6}", nested_ary.deep_count_types())
else
  puts "WITHOUT OVERRIDE IN HASH"
  expected_calculated(nested_hash2, "{Array=>1, Integer=>2}", nested_hash2.deep_count_types())
  expected_calculated(nested_hash3, "{Array=>1, Integer=>2}", nested_hash3.deep_count_types())
  expected_calculated(nested_hash4, "{Array=>2, Integer=>5, Set=>2}", nested_hash4.deep_count_types())
  expected_calculated(nested_hash5, "{Array=>2, Integer=>3}", nested_hash5.deep_count_types())
  expected_calculated(nested_hash1, "{Array=>12, Integer=>24, Set=>5, Hash=>4}", nested_hash1.deep_count_types())
  expected_calculated(nested_ary, "{Integer=>33, Hash=>5, Array=>16, Set=>6}", nested_ary.deep_count_types())
end

trenner("A6.2.6 max_depth")

if Hash.instance_methods(false).include?(:max_depth)
  puts "WITH OVERRIDE IN HASH"
  expected_calculated(nested_hash2, 0 ,nested_hash2.max_depth())
  expected_calculated(nested_hash3,0,nested_hash3.max_depth())
  expected_calculated(nested_hash4,2,nested_hash4.max_depth())
  expected_calculated(nested_hash5,1,nested_hash5.max_depth())
  expected_calculated(nested_hash1,3,nested_hash1.max_depth())
  expected_calculated(nested_ary,4,nested_ary.max_depth())
else
  puts "WITHOUT OVERRIDE IN HASH"
  expected_calculated(nested_hash2, 1 ,nested_hash2.max_depth())
  expected_calculated(nested_hash3,1,nested_hash3.max_depth())
  expected_calculated(nested_hash4,3,nested_hash4.max_depth())
  expected_calculated(nested_hash5,2,nested_hash5.max_depth())
  expected_calculated(nested_hash1,5,nested_hash1.max_depth())
  expected_calculated(nested_ary,6,nested_ary.max_depth())
end

trenner("A6.2.7 deep_to_a")

nested_hash6 = {1 => 2}
nested_hash7 = {1 => {2 => 3}}
nested_hash8 = {{1 => 2} => 3}
nested_hash9 = {{1 => 2} => {3 => 4}}
nested_hash10 = {{{1 => 2} => 3} => {4 => {{5 => 6} => 7}}}
nested_hash11 = {{1 => [{2 => 3, 4 => 5, 6 => 7}]} => 8}

expected_calculated(nested_hash6,[[1, 2]],nested_hash6.deep_to_a())
expected_calculated(nested_hash7,[[1, [[2, 3]]]],nested_hash7.deep_to_a())
expected_calculated(nested_hash8,[[[[1, 2]], 3]],nested_hash8.deep_to_a())
expected_calculated(nested_hash9,[[[[1, 2]], [[3, 4]]]],nested_hash9.deep_to_a())
expected_calculated(nested_hash10,[[[[[[1, 2]], 3]], [[4, [[[[5, 6]], 7]]]]]],nested_hash10.deep_to_a())
expected_calculated(nested_hash11,[[[[1, [{2=>3, 4=>5, 6=>7}]]], 8]],nested_hash11.deep_to_a())

trenner("A6.2.8 deep_invert")

expected_calculated(nested_hash6,{2=>1},nested_hash6.deep_invert())
expected_calculated(nested_hash7,{{3=>2}=>1},nested_hash7.deep_invert())
expected_calculated(nested_hash8,{3=>{2=>1}},nested_hash8.deep_invert())
expected_calculated(nested_hash9,{{4=>3}=>{2=>1}},nested_hash9.deep_invert())
expected_calculated(nested_hash10,{{{7=>{6=>5}}=>4}=>{3=>{2=>1}}},nested_hash10.deep_invert())
expected_calculated(nested_hash11,{8=>{[{2=>3, 4=>5, 6=>7}]=>1}},nested_hash11.deep_invert())
