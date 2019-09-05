require "pry"

class Triangle
  attr_reader :a, :b, :c
  def initialize a, b, c 
    @a = a
    @b = b
    @c = c 
  end

  def kind
    if a <= 0 || b <= 0 || c <= 0
      raise TriangleError
    elsif a + b > c && a + c > b && b + c > a
      if a == b && a == c && b == c
        :equilateral
      elsif a == b || b == c || a == c
        :isosceles
      elsif a != b && a != c && b != c
        :scalene
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end

end
