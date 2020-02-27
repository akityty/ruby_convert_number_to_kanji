$baseNumber = {"1": "一", "2": "二", "3": "三", "4": "四", "5": "五", "6": "六", "7": "七",
  "8": "八", "9": "九"}
$linkNumber = ["","十","百","千","万","億"]
$linkNumber2 = ["","万","億"]
$last_number_for_linkNumber = [""]
zeroNumber = ["zero": "零"]

$newArray = Array.new
$new_array_flag = false
$flag = false
$left_result = ""
$count = 0
$count2 = 0
$count_for_last_numbers = 0
$flag2 = false  
$last_number = ""
$left_arr = Array.new
$reverse_left_arr = Array.new

#start
puts "Input Number: "
$inputNumber = gets.chomp
#get Array, Length of inputNumber
$inputNumberArray = $inputNumber.to_s.split("")
$inputNumberLength = $inputNumber.to_s.split("").length
$newArray = $inputNumber.split("").join().to_i.to_s.split("")
p "$newArray: #{$newArray}"



$loop_number = $newArray.length / 4
$remainter = $newArray.length % 4
p "$remainter: #{$remainter}"

for i in 0...$remainter
  $left_arr[i] = $newArray[i]
end
$reverse_left_arr = $left_arr.reverse()

p "inputNumberArray: #{$inputNumberArray}"
p "left_arr: #{$left_arr}"
p "reverse_left_arr: #{$reverse_left_arr}"

#if $left_arr.join().to_i > 100
  @hyaku_r = $left_arr.join().to_i % 100
  @hyaku = $left_arr.join().to_i / 100
   p "@hyaku_r: #{@hyaku_r}"
   p "@hyaku: #{@hyaku}"
  @juu_r = @hyaku_r % 10
  @juu = @hyaku_r / 10
  p "@juu_r: #{@juu_r}"
  p "@juu: #{@juu}"
  @su = @juu_r / 1
  p "@su: #{@su}"
#end


for i in 0...$left_arr.length
  
end


=begin 
def calc_first_kanj
  for i in 0..$reverse_left_arr.length-1
    $baseNumber.each do |key,value|
      if $reverse_left_arr[i] != 0.to_s
        $flag = true 
      end
      if $reverse_left_arr[i].to_s == 0.to_s && $flag == false
        $count+=1
        break
      elsif $reverse_left_arr[i].to_s == 0.to_s
        #$left_result.concat("#{$linkNumber[i]},#{value},")
        $count+=1
        break
      elsif $reverse_left_arr[i].to_s == 1.to_s && $left_result == ""
        $left_result.concat(",")

        $count+=1
        break
      elsif $reverse_left_arr[i].to_s == key.to_s
        $left_result.concat(",#{$linkNumber[i]},#{value}")
        $count+=1
        break
        # if $left_result == ""
        #   p "if"
        #   $left_result.concat("#{$linkNumber[i]},")
        #   $count+=1
        #   break
        # elsif $reverse_left_arr[i].to_s == key.to_s
        #   p "else if"
        #   $left_result.concat("#{$linkNumber[i]},#{value}")
        #   $count+=1
        #   break
        # end
      end
    end
  end
  p "left_result reverse: #{$left_result}"
  $left_result = $left_result.reverse()
  p "left_result: #{$left_result}"

end
calc_first_kanj()

 =end

# for i in 0 $left_arr...length
  #   $left_result.concat("#{$linkNumber[i]}")
  # end

=begin 
def set_count()
  if $count > 3
    $count = 0
    $count2 += 1
    $count_for_last_numbers += 1
  end
end
=end
#duyet mang tu cuoi -> dau
=begin def count_0_for_reverseArray()
  for i in 0..$reverseArray.length-1
    $baseNumber.each do |key,value|
      # neu gap so khac khong 
      if $reverseArray[i] != 0.to_s
        $flag2 = true 
      end
      # xet truong hop cac so 0 tu cuoi
      if $reverseArray[i].to_s == 0.to_s && $flag2 == false
        $count_for_last_numbers += 1
        break
        # neu la so khong nhung k phai trong day toan so k o cuoi
      elsif $reverseArray[i].to_s == 0.to_s
        $count += 1
        break
        #$reverseArray[i].to_s == key.to_s
      elsif $reverseArray[i].to_s == key.to_s && $count_for_last_numbers <= 4
        if $reverseArray[i].to_s == 1
          $count += 1
          break
        else
          $result.concat("#{$linkNumber[$count]},#{value},")
          $count += 1
          break
        end
      else
        $result.concat("#{$linkNumber2[$count2]},#{value},")
        $count += 1
        set_count()
        break
      end
    end
  end
end
 count_0_for_reverseArray()
 def calc_last_number()
  if $count_for_last_numbers < 4
    p "1"
    $last_number = $linkNumber[$count_for_last_numbers]
    p $last_number
  else
    p "0"
   @first_string = $linkNumber[$count_for_last_numbers % 4]
   p "@first_string: #{@first_string}"
   @second_string = $linkNumber2[$count_for_last_numbers / 4]
   $last_number = @first_string + @second_string
  end
end
$last_number = calc_last_number()
=end

#  puts "count for last number: #{$count_for_last_numbers}"
#  puts "last number: #{$last_number}"
#  puts "result: #{$result}"