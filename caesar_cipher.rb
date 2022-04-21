def caesar_cipher(phrase, shift_factor)
  new_caps = Array.new #to put the wraped capitals
  new_smalls = Array.new #to put the wraped smalls
  new_codes = Array.new #to put the shifted ascii codes
  smalls = Array.new(26){|index| index + 97 }
  smalls.cycle(2){|element| new_smalls.push(element)} #make the smalls wrap from z to a
  capitals = Array.new(26){|index| index + 65 }
  capitals.cycle(2){|element| new_caps.push(element)} #make the capitals wrap from Z to A
  codes = phrase.bytes #convert the string to ascii code

  codes.each do |num|
  
    if capitals.include?(num) 
    
        index = capitals.index(num) #get the index of num in capitals array
        
        new_codes.push(new_caps[index + shift_factor])

    elsif smalls.include?(num) 
    
        index = smalls.index(num)
        
        new_codes.push(new_smalls[index + shift_factor])

    else 
        new_codes.push(num)
    end 
    
  end
    #p new_codes
  p new_codes.pack('c*')
  
end

caesar_cipher("What a string!",5)