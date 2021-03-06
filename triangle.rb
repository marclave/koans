# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  # Satisfying these https://en.wikipedia.org/wiki/Triangle_inequality
  if (a < 0 || b < 0 || c < 0)
    raise TriangleError, "Can't have negative values'"
  elsif ((a == 0) && (b == 0) && (c == 0))
    raise TriangleError, "Can't have spatially empty triangle"
  else
    sides = (a + b + c)/2.0
    h = (sides - a)*(sides - b)*(sides - c) # If this is not positive, not a triangle
    if h <= 0
      raise TriangleError, "Must satisfy hypothesis rule"
    end
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
