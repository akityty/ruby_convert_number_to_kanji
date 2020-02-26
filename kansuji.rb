$baseNumber = {"0": "零", "1": "一", "2": "二", "3": "三", "4": "四", "5": "五", "6": "六", "7": "七",
  "8": "八", "9": "九"}

#$linkNumber = {juu: "十", "hyaku": "百", "sen": "千", "man": "万", "oku": "億"}
$linkNumber = ["十","百","千","万","億"]

zeroNumber = {"zero": "零"}

kanji_dict = {"0": "零", "1": "一", "2": "二", "3": "三", "4": "四", "5": "五", "6": "六", "7": "七",
  "8": "八", "9": "九", "10": "十", "100": "百", "1000": "千", "10000": "万", "100000000": "億",
  "300": "三百", "600": "六百", "800": "八百", "3000": "三千", "8000": "八千"}

$result = ""
$count = 0
$count2 = 0
  
  

#start
puts "Input Number: "
$inputNumber = gets.chomp
#get Array, Length of inputNumber
$inputNumberArray = $inputNumber.to_s.split("")
$inputNumberLength = $inputNumber.to_s.split("").length

puts "number = #{$inputNumber}, length = #{$inputNumberLength}, array =  #{$inputNumberArray}" 
reverseArray = $inputNumberArray.reverse()
puts "reverse array: #{reverseArray}"

$newArray = Array.new
flag = false

(0..reverseArray.length-1).each do |i|
  next if reverseArray[i] == "0" && flag == false
  flag = true if reverseArray[i] != "0"
  $newArray.push(reverseArray[i]) if flag == true
end

puts "newArray: #{$newArray}"

def set_count()
  if $count > 3
    $count = 0
    $count2 += 1
  end
end

def count_0()
  for i in 0..$newArray.length-1
    $baseNumber.each do |key, value|
      if $newArray[i].to_s == key.to_s && $count == 0
        $result.concat("#{value},") 
        if $count == 0
          $result.concat("#{value},")
          $count += 1
          set_count()
        elsif $count == 1
          $result.concat("#{$linkNumber[0]},#{value},")
          $count += 1
          set_count()
        end
       
        
        puts "result: #{$result}"
      end
    end
  end
end

case $count
when 0
  p " case 0: "
  count_0()
when 1
  p " case 1: "
when 2
  p " case 2: "
when 3  
  p " case 3: "
else 
  p " case else: "
end

p "count: #{$count}"
