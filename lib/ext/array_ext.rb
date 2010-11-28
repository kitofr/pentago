class Array
  def has_5_in_a_row?
    cnt = 0
    self.each_index do |i|
      item = self[i]
      cnt = 1 if item != '.' && i == 0
      cnt = (item != '.' && (item == self[i-1] || self[i-1] == '.')) ? cnt + 1 : 0 if i > 0
      break if cnt == 5
    end
    cnt == 5
  end
end

