baseNumber = {"0": "零", "1": "一", "2": "二", "3": "三", "4": "四", "5": "五", "6": "六", "7": "七",
  "8": "八", "9": "九"}

linkNumber = {"juu": "十", "hyaku": "百", "sen": "千", "man": "万", "oku": "億"}


zeroNumber = {"zero": "零"}

kanji_dict = {"0": "零", "1": "一", "2": "二", "3": "三", "4": "四", "5": "五", "6": "六", "7": "七",
  "8": "八", "9": "九", "10": "十", "100": "百", "1000": "千", "10000": "万", "100000000": "億",
  "300": "三百", "600": "六百", "800": "八百", "3000": "三千", "8000": "八千"}

result = ""
  
  

#start
puts "Input Number: "
inputNumber = gets.chomp
puts "number = #{inputNumber}" 

#get Array, Length of inputNumber
inputNumberArray = inputNumber.to_s.split("")
inputNumberLength = inputNumber.to_s.split("").length

case_when_for_length.call
puts result




#switch-key for InputNumberLength
def case_when_for_length
  case InputNumberLength
  when 0
    puts 'You typed zero'
  when 1
    tranform_number_to_kanji(inputNumber)
  when 2
    puts 'n is a prime number'
    puts 'n is an even number'
  when 3, 5, 7
    puts 'n is a prime number'
  when 4, 6, 8
    puts 'n is an even number'
  else
    puts 'Only single-digit numbers are allowed'
  end
end







#tranform base number to kanji
def tranform_number_to_kanji(number)
  baseNumber.each do |key,value|
    if key == number.to_s
      result = value
      break
    end
  end
end



=begin
 baseNumber.each do |key,value|
  puts "key: #{key}, value: #{value}"
end 
=end

