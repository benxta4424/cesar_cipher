class Cipher

    def initialize(word,number)
        @word=word
        @number=number
        @ciphered_word=''
    end

    def cipher_the_word
        ciphered_word=''
        
        @word.chars.each do |letter|
            ascii_value=shift_letter(letter,@number)

            if valid_letter?(ascii_value)
                ciphered_word+=turn_ascii_to_letter(ascii_value)
            elsif overflow?(ascii_value)
                ciphered_word+=turn_ascii_to_letter(ascii_value-26)
            else
                ciphered_word+=letter
            end
        end

        ciphered_word
    end

    def get_ascii(letter)
        letter.ord
    end

    def turn_ascii_to_letter(letter)
        letter.chr
    end

    def shift_letter(letter,number)
        result=get_ascii(letter)+number
    end

    def valid_letter?(letter)
        true if letter.between?(65,90) || letter.between?(97,122)
    end

    def overflow?(letter)
        true if letter>90 || letter>122
    end
end