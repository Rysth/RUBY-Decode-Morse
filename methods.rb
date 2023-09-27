#
#   Description:
#     -morse_code: A string representation of a morse code value.
#     -pattern: Pattern used to split the words/message by the spaces added to them.
#     -decoded_method: Is the method used to reuse the decode_char and decode_word methods.
def decode_loop(morse_code, pattern, decoded_method)
  decoded_message = ''
  string_array = morse_code.split(pattern)
  string_array.each do |n|
    if pattern
      decoded_message.concat(decoded_method.call(n).concat(' '))
    else
      decoded_message.concat(decoded_method.call(n))
    end
  end
  decoded_message
end

#
#   Description: It returns a letter in UPPERCASE by passing a morse code word to it.
def decode_char(morse)
  uppercase_letter = ''
  morse_dict = { 'a' => '.-', 'b' => '-...', 'c' => '-.-.', 'd' => '-..', 'e' => '.', 'f' => '..-.', 'g' => '--.',
                 'h' => '....', 'i' => '..', 'j' => '.---', 'k' => '-.-', 'l' => '.-..', 'm' => '--', 'n' => '-.',
                 'o' => '---', 'p' => '.--.', 'q' => '--.-', 'r' => '.-.', 's' => '...', 't' => '-', 'u' => '..-',
                 'v' => '...-', 'w' => '.--', 'x' => '-..-', 'y' => '-.--', 'z' => '--..', ' ' => ' ', '1' => '.----',
                 '2' => '..---', '3' => '...--', '4' => '....-', '5' => '.....', '6' => '-....', '7' => '--...',
                 '8' => '---..', '9' => '----.', '0' => '-----' }

  morse_dict.each do |key, value|
    next unless morse == value

    uppercase_letter = key.upcase
    break
  end

  uppercase_letter
end

puts decode_char('.-')

#
#   Description: Calls the decode_loop method to return a whole WORD by using the decode_char method created before.
def decode_word(word)
  decode_loop(word, nil, method(:decode_char))
end

puts decode_word('-- -.--')

#
#   Description: Calls the decode_loop method to return a whole MESSAGE by using the decode_char method created before.
def decode(string)
  decode_loop(string, /   /, method(:decode_word))
end

puts decode('-- -.--   -. .- -- .')

puts decode('.-   -... --- -..-   ..-. ..- .-.. .-..   --- ..-.   .-. ..- -... .. . ...')
