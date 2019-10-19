# 找出字符串中连续出现次数大于1的字符串
arr = "aaasdfasdasddffddffaassddfasdfaacccccddd".split("")
len= 1
a = []
arr.each_with_index do |x,i|
	if i > 0
		if x == arr[i-1]
			len += 1
			if x != arr[i+1]
				a << arr[i-1] * len
				len = 1
			end
		else
			if len > 1
				a << arr[i-1] * len
				len = 1
			end
		end
	end
end
p a
