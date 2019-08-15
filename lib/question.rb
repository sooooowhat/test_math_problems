1:
arr = 'xyz165c5671lki6789cc121113'.split("")
nums = ('1'..'9').to_a
len = 0
a,b = [],[]
arr.each_with_index do |x,i|
 if nums.include?(x)
  len += 1
  p [x,len]
  b << x
  if !arr[i+1] && len > 3
   a << b.join
   b,len = [],0
  end
 else
  a << b.join if len > 3
  b,len = [],0
 end
end
p a
