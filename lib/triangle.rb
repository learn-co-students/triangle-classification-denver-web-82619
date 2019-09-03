require 'pry'

class Triangle
  attr_reader :length_one, :length_two, :length_three
  
  def initialize (length_one, length_two, length_three)
    @length_one = length_one.to_f
    @length_two = length_two.to_f
    @length_three = length_three.to_f
    @lengths = [@length_one, @length_two, @length_three].sort
  end

  def kind
    if !self.is_valid
      raise TriangleError
    elsif is_equilateral
      :equilateral
    elsif is_isosceles
      :isosceles
    else
      :scalene 
    end
  end

  def is_equilateral
    length_one == length_two && length_one == length_three
  end

  def is_isosceles
    has_equal_sides = length_one == length_two || length_one == length_three || length_two == length_three
    has_equal_sides && !is_equilateral
  end

  def is_valid
    if !has_sides || @lengths[2] >= @lengths[0] + @lengths[1]
      false
    else
      true
    end
  end

  def has_sides 
    @lengths.each do |length|
      if length <= 0
        return false
      end
    end
  end

  class TriangleError < StandardError

  end
end

# t = Triangle.new(1,2,2)

# t.is_valid