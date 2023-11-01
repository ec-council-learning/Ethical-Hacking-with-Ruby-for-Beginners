# frozen_string_literal: true

require 'ronin/fuzzing'

def gen_pwn(max = 100)
  one_percent = (max / 100).zero? ? 1 : max / 100
  String.generate(['\\x41', (1..max).step(one_percent).to_a]) do |path|
    puts path
  end
end

def gen_crc32
  String.generate([:uppercase_hexadecimal, 8]) do |h|
    puts h
  end
end

def gen_year(base)
  String.generate(base, [(1980..2024).map(&:to_s), 1], [['*', '!'], (1..2)]) do |password|
    puts password
  end
end


# gen_pwn
# gen_pwn(3000)
# gen_crc32
gen_year('Password')
