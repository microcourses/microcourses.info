def atm(number)
  if number <= 0             # no chance, buster (base case)
    []
  elsif number == 20
    [20]                     # OK fine, one 20 dollar note (base case)
  elsif number == 70
    [50] + atm(number - 50)  # a 50, plus whatever other notes (recursive case)
  else
    []                       # not sure, what do you think?
  end
end

require 'minitest/spec'
require 'minitest/autorun'

describe 'atm' do
  [
    [   0, []               ],
    [  70, [50, 20]         ],
    [  80, [20, 20, 20, 20] ],
    [ 100, [50, 50]         ],
    [ 101, []               ],
  ].each do |input, expected|
    it "should convert the number #{input} to #{expected}" do
      atm(input).must_equal expected
    end
  end
end
