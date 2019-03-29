# 1至9九个数字组成两个四位数和一个一位数（九个数字正好用完,不重复）
# 问满足其中一个四位数乘那个一位数正好等于另一个四位数的组合方法

[*2..8].each do |m|
  i = 1234
  [*i..9876].each do |n|
  	c = n * m
  	next if c.to_s.length > 4
  	p [n,m,c] if ((c.to_s + m.to_s + n.to_s).split("").uniq - ["0"]).length == 9
  end
end
