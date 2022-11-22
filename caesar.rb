#create function that converts message into ascii values and encodes it
def caesar_cipher(message,shift)
    #regular expression that takes all punctuation to match     against string values
      regex = /[!@#\$%^&*()-=_+|;’:”,.<>?’{}]/
      p "original message: ", message
    #ascii letter values
      p 'ascii values: ',ascii_values = message.bytes
    
    #if number is between 97 and 122
      def lower_case_shift(num,shift)
        temp_num = num + shift
        if temp_num > 122
          temp_num = temp_num - 122
          temp_num = temp_num + 96
        end
        return temp_num
      end
    
    #if number is between 65 and 90
      def upper_case_shift(num, shift)
        temp_num = num + shift
        if temp_num > 90
          temp_num = temp_num - 90
          temp_num = temp_num + 64
        end
        return temp_num
      end
        
    # take ascii values and create an array of shifted values
      shifted_values = ascii_values.map do |num| 
        if num == 32 || regex.match(num.chr)
          num 
        elsif num.between?(97, 122) #if number is lower cased
          lower_case_shift(num,shift)
        elsif num.between?(65, 90) #if number is upper cased
          upper_case_shift(num, shift)
        end
      end
    
      p 'shifted values: ', shifted_values
    
    #convert new num values to ascii letter values
      new_ascii_shifted_letters = shifted_values.map {|num|num.chr}.join()  
      p 'encrypted message: ', new_ascii_shifted_letters
end
    
#run the encode message function with new message
caesar_cipher("What a string!", 5)