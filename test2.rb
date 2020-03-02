KANJI = {(10**68).to_s =>'無量大数', (10**64).to_s => '不可思議', (10**60).to_s => '那由他',
    (10**56).to_s =>'阿僧祇', (10**52).to_s => '恒河沙', (10**48).to_s => '極',
    (10**44).to_s =>'載', (10**40).to_s => '正', (10**36).to_s => '澗',
    (10**32).to_s =>'溝', (10**28).to_s => '穣', (10**24).to_s => '𥝱',
    (10**20).to_s =>'垓', (10**16).to_s => '京', (10**12).to_s => '兆', (10**8).to_s => '億',
    '10000' => '万', '1000' => '千', '100' => '百', '10' => '十', '9' => '九', '8' => '八', '7' => '七',
    '6' => '六', '5' => '五', '4' => '四', '3' => '三', '2' => '二', '1' => '一', '0' => '零'
}.freeze

class Integer
    def to_kansuji
        return '零' if zero?
        KANJI.each do |k, v|
            return v if self < 10 && ( self / k.to_i).positive?
            p "self: #{self} key: #{k} value: #{v}"
            next unless (self / k.to_i).positive?
            return v if (self % k.to_i).zero? && self <= 1000 && self / k.to_i == 1
            return ( self / k.to_i).to_kansuji + v if (self % k.to_i).zero?
            p "self: #{self} key: #{k} value: #{v}"
            return (self - self % k.to_i).to_kansuji + (self % k.to_i).to_kansuji
        end
    end
end

class String
    def to_number
        KANJI.each do |k,v|
            return 0 if self == '' || self == '零'
            return k.to_i if self == v && k.to_i < 10
            next unless include? v
            return k.to_i + sub!(v, '').to_number if index(v).zero?
            return (split(v)[0]).to_number * k.to_i if split(v)[1].nil?
            return (split(v)[0]).to_number * k.to_i + (split(v)[1]).to_number
        end
    end
end
p 100000000000000000000000000000000000000000000000000000000000000000000.to_kansuji