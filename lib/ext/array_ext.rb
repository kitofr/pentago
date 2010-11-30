class Array
  def has_5_in_a_row?
    cnt = 0
    self.each_index do |i|
      item = self[i]
			prev = self[i-1]

			cnt = (item != '.') && (item == prev || prev == '.') ? cnt + 1 : 0
      break if cnt == 5
    end
    cnt == 5
  end
end

