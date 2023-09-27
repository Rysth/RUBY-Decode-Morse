$morse_dict = {
  "a" => ".-",
  "b" => "-...",
  "c" => "-.-.",
  "d" => "-..",
  "e" => ".",
  "f" => "..-.",
  "g" => "--.",
  "h" => "....",
  "i" => "..",
  "j" => ".---",
  "k" => "-.-",
  "l" => ".-..",
  "m" => "--",
  "n" => "-.",
  "o" => "---",
  "p" => ".--.",
  "q" => "--.-",
  "r" => ".-.",
  "s" => "...",
  "t" => "-",
  "u" => "..-",
  "v" => "...-",
  "w" => ".--",
  "x" => "-..-",
  "y" => "-.--",
  "z" => "--..",
  " " => " ",
  "1" => ".----",
  "2" => "..---",
  "3" => "...--",
  "4" => "....-",
  "5" => ".....",
  "6" => "-....",
  "7" => "--...",
  "8" => "---..",
  "9" => "----.",
  "0" => "-----"
}

def decode_char(morse)
  uppercaseLetter = ""

  $morse_dict.each do |key, value|
    next unless morse == value
    uppercaseLetter = key.upcase
    break 
  end

   uppercaseLetter
end

puts decode_char(".-")

def decode_word(word)
  decodedWord = ""
  letterArray = word.split
  letterArray.each do |s|
    decodedWord.concat(decode_char(s))
  end
  decodedWord.concat(" ")
end

puts decode_word("-- -.--")


def decode(string)
  decodedMessage = ""
  wordsArray = string.split(/   /)
  wordsArray.each do |word|
    decodedWord = decode_word(word)
    decodedMessage.concat(decodedWord)
  end
  decodedMessage
end

puts decode("-- -.--   -. .- -- .")