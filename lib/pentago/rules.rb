module Rules
  def has_5_in_a_row?(game_field)
    6.times do |i|
      x = game_field.take(6)
      return true if x.has_5_in_a_row?
      game_field.shift(6)
    end
    false
  end
end
