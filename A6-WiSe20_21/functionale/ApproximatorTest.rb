require_relative 'approximator'
require 'test/unit'
# 6.1.1_f_int
class ApproximatorTest < Test::Unit::TestCase
  def setup
    @n_minus_1 = -1
    @n_string = "a"
    @n_float = 0.5
    @n100 = 100
    @n50 = 50
    @n10 = 10
    @n0 = 0
    @naehrungswert = 2.0/3
    @delta_n100 = 1.1102230246251565e-16
    @delta_n50 = 3.3306690738754696e-16
    @delta_n10 = 0.00032552083333337034
    @f_n0 = 1
  end

  #positive test
  def test_f_rek_end_pos
    assert_in_delta(@naehrungswert, f_rek_end(@n100), @delta_n100 )
    assert_in_delta(@naehrungswert, f_rek_end(@n50), @delta_n50 )
    assert_in_delta(@naehrungswert, f_rek_end(@n10), @delta_n10 )
  end

  #negative test
  def test_f_rek_end_neg
    assert_raise ArgumentError do
      f_rek_end(@n_string)
    end
    assert_raise ArgumentError do
      f_rek_end(@n_minus_1)
    end
    assert_raise ArgumentError do
      f_rek_end(@n_float)
    end
  end

  #grenzfälle
  def test_f_rek_end_grenz
    assert_equal(@f_n0, f_rek_end(@n0))
  end
end
