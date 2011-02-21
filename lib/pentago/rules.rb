module Rules
  def game_ended?(squares)
    tmp = squares_to_array(squares)
    return true if has_5_in_a_row? tmp
		
    tmp = zip_squares(turn_field_left(squares), [[0,1],[2,3]])
    return true if has_5_in_a_row? tmp

    c = []
    tmp = squares_to_array(squares).flatten
    [0,1,6].each{ |x| x.step(tmp.length, 7){|i| c << tmp[i] }}
    return true if c.has_5_in_a_row?

    false
  end
  def has_5_in_a_row?(zipped_squares)
    game_field = zipped_squares.flatten
    6.times do |i|
      x = game_field.take(6)
      return true if x.has_5_in_a_row?
      game_field.shift(6)
    end
    false
  end
  def squares_to_array(squares)
    zip_squares(squares, [[0,1],[2,3]])
  end
  def zip_squares(squares, order)
    order.collect{|a,b| squares[a].zip(squares[b])}
  end
  def turn_field_left(squares)
    [1,3,0,2].collect { |i| squares[i].rotate(:left) }
  end
end
