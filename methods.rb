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

=begin 
  Description:
    -morseCode: A string representation of a morse code value.
    -pattern: Pattern used to split the words/message by the spaces added to them.
    -decodeMethod: Is the method used to reuse the decode_char and decode_word methods.
=end
def decode_loop(morseCode, pattern, decodeMethod)
  decodedMessage = ""
  stringArray = morseCode.split(pattern)
  stringArray.each do |n|
    if pattern 
      decodedMessage.concat(decodeMethod.(n).concat(" "))
    else
      decodedMessage.concat(decodeMethod.(n))
    end
  end
  decodedMessage
end

=begin 
  Description: It returns a letter in UPPERCASE by passing a morse code word to it.
=end
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


=begin 
  Description: Calls the decode_loop method to return a whole WORD by using the decode_char method created before.
=end
def decode_word(word)
  decode_loop(word, nil, method(:decode_char))
end

puts decode_word("-- -.--")

=begin 
  Description: Calls the decode_loop method to return a whole MESSAGE by using the decode_char method created before.
=end
def decode(string)
  decode_loop(string, /   /, method(:decode_word))
end

puts decode("-- -.--   -. .- -- .")

puts decode(".-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...")