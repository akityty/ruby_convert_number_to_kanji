$baseNumber = {"1" => "一", "2" => "二", "3" => "三", "4" => "四", "5" => "五", "6" => "六", "7" => "七",
    "8" => "八", "9" => "九"}
  $linkNumber = ["","十","百","千","万","億"]
  $linkNumber2 = ["","万","億","兆","京","垓","𥝱","穣"]
  $last_number_for_linkNumber = [""]
  zeroNumber = ["zero": "零"]
  
  $newArray = Array.new
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
  
  #start
  puts "Input Number: "
  $inputNumber = gets.chomp
  #get Array, Length of inputNumber
  $inputNumberArray = $inputNumber.to_s.split("")
  $inputNumberLength = $inputNumber.to_s.split("").length
  $newArray = $inputNumber.split("").join().to_i.to_s.split("")
  p "$newArray: #{$newArray}"
  
  
  $loop_number = $newArray.length / 4
  $loop_number_count = $loop_number
  $remainter = $newArray.length % 4
  p "$remainter: #{$remainter}"
  
  for i in 0...$remainter
    $left_arr[i] = $newArray[i]
  end
  $reverse_left_arr = $left_arr.reverse()
  for i in $remainter...$newArray.length
    $right_arr[i] = $newArray[i]
  end
  $right_arr = $right_arr.join().to_i.to_s.split("")
  
  p "inputNumberArray: #{$inputNumberArray}"
  p "left_arr: #{$left_arr}"
  p "right_arr: #{$right_arr}"
  p "reverse_left_arr: #{$reverse_left_arr}"
  
  #tinh cac phan tu
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
  
    #tinh kq ben trai
    if @hyaku > 1
      $left_result.concat("#{$baseNumber[@hyaku.to_s]}#{$linkNumber[2]}")
    elsif @hyaku == 1
      $left_result.concat("#{$linkNumber[2]}")
    end
    if @juu > 1
      $left_result.concat("#{$baseNumber[@juu.to_s]}#{$linkNumber[1]}")
    elsif @juu == 1
      $left_result.concat("#{$linkNumber[1]}")
    end
    if @su > 0
      $left_result.concat("#{$baseNumber[@su.to_s]}")
    end
    $left_result.concat("#{$linkNumber2[$loop_number_count]}")
    $loop_number_count -= 1
    
   p "$left_result: #{$left_result}"
  
  #vd newArray: 123,1234,1234,1234
  
  # right arr:  1234,1234,1234
  #vi tri start point mong muon: 4,8,12
  # vi tri end point mong muon: 7,11,15
  #loop*loop_count: 1
  #loop 1: man, startPoint = 1*4*1
  
    
   #tinh phan giua
   if $loop_number == 0
    $result = $left_result
    elsif $loop_number > 0
      @loop_count = 0
      for loop in 1..$loop_number
        p "for loop"
        @loop_arr = Array.new
        for i in 0...4
          p "for in loop"
          @loop_count += 1
          # them cac phan tu vao mang 
          @loop_arr[i] = $right_arr[@loop_count-1]
        end
        if @loop_arr.length == 4
          #dang lam
          # tinh cac phan mang o giua
          p "@loop_arr when length = 4 at loop #{loop}: #{@loop_arr}"
          @sen_r = @loop_arr.join().to_i % 1000
          @sen = @loop_arr.join().to_i / 1000
          p "@sen_r: #{@sen_r}"
          p "@sen: #{@sen}"
          @hyaku_r = @sen_r % 100
          @hyaku = @sen_r / 100
          p "@hyaku_r: #{@hyaku_r}"
          p "@hyaku: #{@hyaku}"
          @juu_r = @hyaku_r % 10
          @juu = @hyaku_r / 10
          p "@juu_r: #{@juu_r}"
          p "@juu: #{@juu}"
          @su = @juu_r / 1
          p "@su: #{@su}"
  
          if @sen > 1
            $mid_result.concat("#{$baseNumber[@sen.to_s]}#{$linkNumber[3]}")
          elsif @sen == 1
            $mid_result.concat("#{$linkNumber[3]}")
          end
          if @hyaku > 1
            $mid_result.concat("#{$baseNumber[@hyaku.to_s]}#{$linkNumber[2]}")
          elsif @hyaku == 1
            $mid_result.concat("#{$linkNumber[2]}")
          end
          if @juu > 1
            $mid_result.concat("#{$baseNumber[@juu.to_s]}#{$linkNumber[1]}")
          elsif @juu == 1
            $mid_result.concat("#{$linkNumber[1]}")
          end
          if @su > 0
            $mid_result.concat("#{$baseNumber[@su.to_s]}")
          end
          $mid_result.concat("#{$linkNumber2[$loop_number_count]}")
          $loop_number_count -= 1
          p "$mid_result: #{$mid_result}"
        end
        # so cua mang, luon nho hon arr_key*
        # @start_point = arr_key*loop
        # @end_point = @start_point + 3
      end
  end
  if $loop_number != 0 && $remainter == 0
    $result = $mid_result
  else
    $result = $left_result.concat($mid_result)
  end
  p "$result: #{$result}"
  
