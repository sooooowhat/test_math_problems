# 1至9九个数字组成两个四位数和一个一位数（九个数字正好用完,不重复）问满足其中一个四位数乘那个一位数正好等于另一个四位数的组合方法

(2..8).to_a.each do |m|
  i = 1233
  loop do
    if i < 9876
      i+= 1
      n = i * m
      next if n.to_s.length > 4
      arr = (n.to_s + i.to_s + m.to_s).split("").uniq - ["0"]
        if arr.count == 9
          p i,m,n
        end
    else
      break
    end
  end
end