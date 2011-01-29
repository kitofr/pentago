
 
puts "-------------lambda--------------"
skip_6 = lambda { |array, i|
	@i = @i.nil? ? i : @i + 6 
	@i = i if @i >= array.length
	array[@i]
}

game = (0..35).to_a
6.times do 
	6.times do |i|
		puts "#{i}: #{skip_6.call( game, i)}"
	end
	game.shift(1)
	puts ""
end


puts "-------------yield--------------"
def skip_six(array, i)
	@a = i if @a.nil? || @a >= array.length
	yield array[@a]
	@a += 6
end

game = (0..35).to_a
6.times do
	6.times do |i|
		skip_six(game, i) do |v|
			puts "#{i}: #{v}"
		end
	end
	game.shift(1)
	puts ""
end

puts "-------------iterator--------------"

def iterate(iterator)
	loop {
		yield iterator.next
		5.times do iterator.next end
	}
end


game = (0..35).to_a
6.times do
	iterate(game.each) do |x|
		puts x
	end
	game.shift(1)
	puts ""
end



x = [:w, ".", ".", ".", ".", ".", ".", :w, ".", ".", ".", ".", ".", ".", :w, ".", ".", ".", ".", ".", ".", :w, ".", ".", ".", ".", ".", ".", :w, ".", ".", ".", ".", ".", ".", "."]

cnt = 0
6.times do
  puts "-----------------" if cnt % 18 == 0
  puts "| #{x[cnt..cnt + 2].collect { |z| z }.join(" ")  } | #{x[cnt + 3.. cnt + 5].collect { |z| z }.join(" ")} |"
  cnt += 6
end
puts "-----------------"
