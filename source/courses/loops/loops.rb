print "What is your name?\n"
input = gets
letters = input.strip.chars

i = 0
10.times do
  21.times do
    print "\e[01;3#{rand(6)}m" # ANSI color code
    print letters[i]
    $stdout.flush
    i = (i + 1) % letters.size
  end
  print "\n"
end
print "\e[0m" # ANSI color reset
