$baseNumber = {"1" => "一", "2" => "二", "3" => "三", "4" => "四", "5" => "五", "6" => "六", "7" => "七",
  "8" => "八", "9" => "九"}
$linkNumber = ["","十","百","千","万","億"]
$linkNumber2 = ["","万","億","兆","京","垓","𥝱","穣","溝","澗","正","載","極","恒河沙","阿僧祇","那由他","不可思議","無量大数"]
$last_number_for_linkNumber = [""]
zeroNumber = ["zero": "零"]

##$newArray = Array.new
$new_array_flag = false
$flag = false
$left_result = ""
$mid_result = ""
$count = 0
$count2 = 0
$count_for_last_numbers = 0
$flag2 = false  
$last_number = ""
$left_arr = Array.new
$right_arr = Array.new
$reverse_left_arr = Array.new
$inputNumber = 0
@result = ""
=begin
#start
puts "Input Number: "
$inputNumber = gets.chomp
#get Array, Length of inputNumber
$inputNumberArray = $inputNumber.to_s.split("")
##$inputNumberLength = $inputNumber.to_s.split("").length
$newArray = $inputNumber.split("").join().to_i.to_s.split("")
p "$newArray: #{$newArray}"
=end

puts "Input Number: "
@inputNumber = gets.chomp
p "---------------------------------------------------------------"
@inputNumberArray = @inputNumber.to_s.split("")

def convert_input_arr(arr)
  @newArray = arr.join().to_i.to_s.split("")
  return @newArray
end

def create_left_arr(array)
  left_arr = Array.new
  remainter = array.length % 4
  for i in 0...remainter
    left_arr[i] = array[i]
  end
  return left_arr
end

def create_right_arr(array)
  right_arr = Array.new
  loop_number = @loop_number
  remainter = array.length % 4
  for i in remainter...array.length
    right_arr[i] = array[i]
  end
  #clear nil value in array
  right_arr = right_arr.join().to_i.to_s.split("")
  return right_arr
end

def create_hyaku_juu_su_arr(number)
  p "create_hyaku_juu_su_arr"
  hyaku_remainter = number % 100
  hyaku = number / 100
  juu_remainter = hyaku_remainter % 10
  juu = hyaku_remainter / 10
  su = juu_remainter / 1
  hyaku_juu_su_arr = [hyaku,juu,su]
  return hyaku_juu_su_arr
end

def hyaku_juu_su_to_kanji(array)
  p "hyaku_juu_su_to_kanji"
  result = ""
  left_num = array.join().to_i
  hyaku_juu_su_arr = create_hyaku_juu_su_arr(left_num)
  hyaku = hyaku_juu_su_arr[0]
  juu = hyaku_juu_su_arr[1]
  su = hyaku_juu_su_arr[2]
  if hyaku > 1
    result.concat("#{$baseNumber[hyaku.to_s]}#{$linkNumber[2]}")
  elsif hyaku == 1
    result.concat("#{$linkNumber[2]}")
  end
  if juu > 1
    result.concat("#{$baseNumber[juu.to_s]}#{$linkNumber[1]}")
  elsif juu == 1
    result.concat("#{$linkNumber[1]}")
  end
  if su > 0
    result.concat("#{$baseNumber[su.to_s]}")
  end
  return result
end

#dang lam convert dieu kien loopnumber == 0
def left_arr_convert(array)
  p "left_arr_convert"
  result = hyaku_juu_su_to_kanji(array)
  result.concat("#{$linkNumber2[@loop_number]}")
  @loop_number_count -= 1
  return result
end

def right_arr_convert(array)
  p "right_arr_convert"
  sen_remainter = array.join().to_i % 1000
  sen = array.join().to_i / 1000
  hyaku_juu_su_arr = create_hyaku_juu_su_arr(sen_remainter)

  result_test = hyaku_juu_su_to_kanji(hyaku_juu_su_arr)
  p "result_test: #{result_test}"

  result = sen.to_s.concat(hyaku_juu_su_arr.join()).split("").to_s;
  p "result in right_arr_convert 1: #{result}"
  #dang lam loi result in right_arr_convert 2.
  result = hyaku_juu_su_to_kanji(result.split(""))

  result.concat("#{$linkNumber2[@loop_number_count]}")
  p "result in right_arr_convert 2: #{result}"
  @loop_number_count -= 1
  #right_result
  return result
end

###1.convert input arr
@arr = convert_input_arr(@inputNumberArray)
@loop_number = @arr.length / 4
@loop_number_count = @loop_number
@left_arr = create_left_arr(@arr)
@right_arr = create_right_arr(@arr)

p "input array: #{@inputNumberArray}"
p "converted array: #{convert_input_arr(@inputNumberArray)}"
p "left arr: #{@left_arr}"
p "right arr: #{@right_arr}"

if @loop_number == 0
  p "@loop_number = 0"
  @result = left_arr_convert(@left_arr)
  p "result: #{@result}"
elsif @loop_number >= 1
  p "@loop_number > 1"
  left_result = left_arr_convert(@left_arr)
  p "left_result: #{left_result}"
  @loop_count = 0
  for loop in 1..@loop_number
    @loop_arr = Array.new
    for i in 0...4
      @loop_count += 1
      @loop_arr[i] = @right_arr[@loop_count-1]
    end
    if @loop_arr.length == 4
      right_result = right_arr_convert(@right_arr)
      p "right_result: #{right_result}"
    end
  end
  @result = left_result.concat(right_result)
  p "result: #{@result}"
end