require File.expand_path(File.dirname(__FILE__) + '/neo')

# You need to write the triangle method in the file 'triangle.rb'
require './triangle'

class AboutTriangleProject < Neo::Koan

  def triangle(a, b, c)
    assert_equal false, (a < 0 || b < 0 || c < 0), "Can't have negative length"

    # Transitivity applies, we eval from left to right
    # so if a == b is true and b == c is true, then a == c and 
    # it is equilateral
    if ((a == b) && (b == c))
      return :equilateral
    elsif ((a == b) || (a == c) || (b == c))
      # we only need at least two sides to be equal
      return :isosceles
    else
      return :scalene
    end
  end

  def test_equilateral_triangles_have_equal_sides
    assert_equal :equilateral, triangle(2, 2, 2)
    assert_equal :equilateral, triangle(10, 10, 10)
  end

  def test_isosceles_triangles_have_exactly_two_sides_equal
    assert_equal :isosceles, triangle(3, 4, 4)
    assert_equal :isosceles, triangle(4, 3, 4)
    assert_equal :isosceles, triangle(4, 4, 3)
    assert_equal :isosceles, triangle(10, 10, 2)
  end

  def test_scalene_triangles_have_no_equal_sides
    assert_equal :scalene, triangle(3, 4, 5)
    assert_equal :scalene, triangle(10, 11, 12)
    assert_equal :scalene, triangle(5, 4, 2)
  end
end
