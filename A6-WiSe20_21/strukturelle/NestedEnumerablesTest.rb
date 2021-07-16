require_relative 'nested_enumerables'
require 'test/unit'
class NestedEnumerablesTest < Test::Unit::TestCase
  def setup
    @empty_ary = []
    @empty_hash = {}
    @empty_set = Set.new()
    @empty_nested_ary = [[[[[]]]]]
    @nested_hash2 = {2 => 9}
    @nested_hash3 = {1 => 7}
    @nested_hash4 = {[2, 11] => Set[Set[3, 24], 7]}
    @nested_hash5 = {2 => [9, 14]}
    @nested_hash1 = {1 => [4, 5, Set[1, [3], 7, Set[1, 2]]],
                     @nested_hash2 => Set[1, 3, 11],
                     @nested_hash3 => @nested_hash4,
                    3 => @nested_hash5}

    @nested_ary = [1, 2, @nested_hash1,
                  [2, Set[1, 7, 9]], [[[1], 2], 3]]
    @empty_deep_count_types = {}
    @empty_nested_ary_deep_count_types = {Array=>4}
    @nested_hash2_deep_count_types_with_overwrite = {Integer=>2}
    @nested_hash3_deep_count_types_with_overwrite = {Integer=>2}
    @nested_hash4_deep_count_types_with_overwrite = {Array=>1, Set=>2, Integer=>5}
    @nested_hash5_deep_count_types_with_overwrite = {Integer=>3, Array=>1}
    @nested_hash1_deep_count_types_with_overwrite = {Integer=>24, Array=>4, Set=>5, Hash=>4}
    @nested_ary_deep_count_types_with_overwrite = {Integer=>33, Hash=>5, Array=>8, Set=>6}
    {Array=>1, Integer=>2}
    @nested_hash2_deep_count_types_without_overwrite = {Array=>1, Integer=>2}
    @nested_hash3_deep_count_types_without_overwrite = {Array=>1, Integer=>2}
    @nested_hash4_deep_count_types_without_overwrite = {Array=>2, Integer=>5, Set=>2}
    @nested_hash5_deep_count_types_without_overwrite = {Array=>2, Integer=>3}
    @nested_hash1_deep_count_types_without_overwrite = {Array=>12, Integer=>24, Set=>5, Hash=>4}
    @nested_ary_deep_count_types_without_overwrite = {Integer=>33, Hash=>5, Array=>16, Set=>6}
    {Array=>1, Integer=>2}
  end

  def test_deep_count_types_pos
    assert_equal(@nested_hash1_deep_count_types_with_overwrite, @nested_hash1.deep_count_types())
    assert_equal(@nested_hash2_deep_count_types_with_overwrite, @nested_hash2.deep_count_types())
    assert_equal(@nested_hash3_deep_count_types_with_overwrite, @nested_hash3.deep_count_types())
    assert_equal(@nested_hash4_deep_count_types_with_overwrite, @nested_hash4.deep_count_types())
    assert_equal(@nested_hash5_deep_count_types_with_overwrite, @nested_hash5.deep_count_types())
    assert_equal(@nested_ary_deep_count_types_with_overwrite, @nested_ary.deep_count_types())
  end

  def test_deep_count_types_neg
    assert_not_equal(@nested_hash1_deep_count_types_without_overwrite, @nested_hash1.deep_count_types())
    assert_not_equal(@nested_hash2_deep_count_types_without_overwrite, @nested_hash2.deep_count_types())
    assert_not_equal(@nested_hash3_deep_count_types_without_overwrite, @nested_hash3.deep_count_types())
    assert_not_equal(@nested_hash4_deep_count_types_without_overwrite, @nested_hash4.deep_count_types())
    assert_not_equal(@nested_hash5_deep_count_types_without_overwrite, @nested_hash5.deep_count_types())
    assert_not_equal(@nested_ary_deep_count_types_without_overwrite, @nested_ary.deep_count_types())
  end

  def test_deep_count_types_grenz
    assert_equal(@empty_deep_count_types, @empty_ary.deep_count_types())
    assert_equal(@empty_deep_count_types, @empty_set.deep_count_types())
    assert_equal(@empty_deep_count_types, @empty_hash.deep_count_types())
    assert_equal(@empty_nested_ary_deep_count_types, @empty_nested_ary.deep_count_types())
  end
end
