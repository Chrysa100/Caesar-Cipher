def caesar_cipher(phrase, shift_factor) 
  new_codes = Array.new #to put the shifted ascii codes
  smalls = [*(97..122)] #make array of ascii code for all small letters
  capitals = [*(65..90)] #make array of ascii code for all capital letters
  codes = phrase.bytes #convert the string to ascii code

  codes.each do |num|
    if capitals.include?(num) 
      index = capitals.index(num) #get the index of num in capitals array
      new_codes.push((index + shift_factor)%26+65)#encryption
    elsif smalls.include?(num) 
      index = smalls.index(num) #get the index of num in smalls array
      new_codes.push((index + shift_factor)%26+97) #encryption
    else #it's not a letter
      new_codes.push(num) 
    end 
  end
  p new_codes.pack('c*') #convert the ascii code to string
end

caesar_cipher("What a string!",5)