#make array constants with the ascii code for letters
SMALLS = Array.new(26){|index| index + 97 }
CAPITALS = Array.new(26) {|index| index + 65 }

def caesar_cipher(phrase, shift_factor)
  new_caps = Array.new #to put the wraped capitals
  new_smalls = Array.new #to put the wraped smalls
  new_codes = Array.new #to put the shifted ascii codes
  
  codes = phrase.bytes #convert the string to ascii code

  codes.each do |num|
  
    if CAPITALS.include?(num) 
    
        index = CAPITALS.index(num) #get the index of num in CAPITALS array
        CAPITALS.cycle(2){|element| new_caps.push(element)} #make the CAPITALS wrap from Z to A
        new_codes.push(new_caps[index + shift_factor])

    elsif SMALLS.include?(num) 
    
        index = SMALLS.index(num)
        SMALLS.cycle(2){|element| new_smalls.push(element)} #make the SMALLS wrap from z to a
        new_codes.push(new_smalls[index + shift_factor])

    else 
        new_codes.push(num)
    end 
    
  end
p new_codes
p new_codes.pack('c*')
end
caesar_cipher("What a string!", 5)
