def get_string
    gets.chomp
end
def get_number
    gets.chomp.to_i
  end
def get_letter_code(letter)
    letter.ord
end

def cipher(result,number)
    result=get_letter_code(result)+number
end

def de_cipher(string)
    string.chr
end

puts 'Introduceti va rog sirul de caractere:'
string=get_string
puts 'Introduceti va rog numarul cu care vreti sa shiftati:'
number=get_number
string2=''
string=string.split('')

string.each do |item|

    get_code=get_letter_code(item)
    cipher_the_code=cipher(get_code,number)

    if cipher_the_code.between?(65,90) || cipher_the_code.between?(97,122) 
    
    de_cipher_the_code=de_cipher(cipher_the_code)
    string2+=de_cipher_the_code

    elsif cipher_the_code>90 || cipher_the_code>122 
        cipher_the_code-=26
        de_cipher_the_code=de_cipher(cipher_the_code)
        string2+=de_cipher_the_code
    end
end
   

    
puts 'Vom avea: '+string2
