# frozen_string_literal: true

require 'ronin/fuzzing'

def annoying_leet
  'The quick brown fox jumps over the lazy dog'.mutate('e' => ['3'], 'l' => ['1'], 'o' => ['0']) do |str|
    puts str
  end
end

LEET = {
  /a/i => ['4', '@'],
  /b/i => ['8', '13'],
  /e/i => ['3', '&'],
  /g/i => ['6', '9'],
  /i|l/i => ['1', '!'],
  /o/i => ['0', '()'],
  /s/i => ['5', '$'],
  /t/i => ['7', '+']
}

def r34l_5h17
  'Le vif zéphyr jubile sur les kumquats du clown gracieux'.mutate(**LEET) do |str|
    puts str
  end
end

# annoying_leet
r34l_5h17
