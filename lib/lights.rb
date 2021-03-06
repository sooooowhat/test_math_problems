# 有编号1~100个灯泡，起初所有的灯都是灭的。有100个同学来按灯泡开关，如果灯是亮的，那么按过开关之后，灯会灭掉。
# 如果灯是灭的，按过开关之后灯会亮。

# 现在开始按开关。

# 第1个同学，把所有的灯泡开关都按一次(按开关灯的编号： 1,2,3,......100)。
# 第2个同学，隔一个灯按一次(按开关灯的编号： 2,4,6,......,100)。
# 第3个同学，隔两个灯按一次(按开关灯的编号： 3,6,9,......,99)。
# ......

# 问题是，在第100个同学按过之后，有多少盏灯是亮着的？

a = [0] * 100
[*0..99].each do |i|
  n = 100/(i+1)
  [*1..n].each do |x|
    a[x*(i+1)-1] = a[x*(i+1)-1] == 0 ? 1 : 0
  end
end
a.reject{|x| x == 0 }.count
