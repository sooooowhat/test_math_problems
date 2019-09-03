# 1.冒泡排序 

# 百科:http://baike.baidu.com/view/254413.html?wtp=tt 
# Wiki:http://zh.wikipedia.org/zh-tw/%E5%86%92%E6%B3%A1%E6%8E%92%E5%BA%8F 

 def bubble_sort(arr)
  1.upto(arr.length-1) do |i|
    (arr.length-i).times do |j|
      if arr[j]>arr[j+1]
        arr[j],arr[j+1] = arr[j+1],arr[j]
      end
    end
  end
    arr
end

array = [2.3,1.3,15.02,25.02,45,85.14,56.1,35.2,4.2,15.4]
puts bubble_sort(array)


# 2.漢諾塔 
# 百科:http://baike.baidu.com/view/191666.html?wtp=tt 
# Wiki: http://zh.wikipedia.org/zh-tw/%E6%B1%89%E8%AF%BA%E5%A1%94 

 def move(from,to)
  puts "#{from} move to #{to}"
end

def hanoi(n,first,second,third)
  if n==1
    move(first,third)
  else
    hanoi(n-1,first,third,second)
    move(first,third)
    hanoi(n-1,second,first,third)
  end
end

hanoi(6,"A","B","C")


# 3.插入排序 
# 百科:http://baike.baidu.com/view/396887.html?wtp=tt 
# Wiki:http://zh.wikipedia.org/zh-tw/%E6%8F%92%E5%85%A5%E6%8E%92%E5%BA%8F 

 def insertion_sort(a)  
    a.each_with_index do |el,i|  
      j = i - 1  
        while j >= 0  
          break if a[j] <= el  
          a[j + 1] = a[j]  
          j -= 1  
        end  
      a[j + 1] = el  
    end  
    return a  
  end  


# 4.選擇排序 
# 百科:http://baike.baidu.com/view/547263.html?wtp=tt 
# Wiki:http://zh.wikipedia.org/zh-tw/%E9%80%89%E6%8B%A9%E6%8E%92%E5%BA%8F 

 def selection_sort(a)
  b = []
  a.size.times do |i|
    min = a.min
    b << min
    a.delete_at(a.index(min))
  end
  return b
end


# 5.Shell排序 
# 百科:http://baike.baidu.com/view/549624.html?wtp=tt 
# Wiki:http://zh.wikipedia.org/zh-tw/%E5%B8%8C%E5%B0%94%E6%8E%92%E5%BA%8F 

 def shell_sort(a)
  gap = a.size
  while(gap > 1)
    gap = gap / 2
    (gap..a.size-1).each do |i|
      j = i
      while(j > 0)
        a[j], a[j-gap] = a[j-gap], a[j] if a[j] <= a[j-gap]
        j = j - gap
      end
    end
  end
  return a
end


# 6.合并排序 
# 百科:http://baike.baidu.com/view/3668564.html?wtp=tt 
# Wiki:http://zh.wikipedia.org/zh-tw/%E5%90%88%E4%BD%B5%E6%8E%92%E5%BA%8F 

 def merge(l, r)
  result = []
  while l.size > 0 and r.size > 0 do
    if l.first < r.first
      result << l.shift
    else
      result << r.shift
    end
  end
  if l.size > 0
    result += l
  end
  if r.size > 0
    result += r
  end
  return result
end

def merge_sort(a)
  return a if a.size <= 1
  middle = a.size / 2
  left = merge_sort(a[0, middle])
  right = merge_sort(a[middle, a.size - middle])
  merge(left, right)
end


# 7.堆排序 
# 百科:http://baike.baidu.com/view/157305.html?wtp=tt 
# Wiki:http://zh.wikipedia.org/zh-tw/%E5%A0%86%E6%8E%92%E5%BA%8F 

 def heapify(a, idx, size)
  left_idx = 2 * idx + 1
  right_idx = 2 * idx + 2
  bigger_idx = idx
  bigger_idx = left_idx if left_idx < size && a[left_idx] > a[idx]
  bigger_idx = right_idx if right_idx < size && a[right_idx] > a[bigger_idx]
  if bigger_idx != idx
    a[idx], a[bigger_idx] = a[bigger_idx], a[idx]
    heapify(a, bigger_idx, size)
  end
end

def build_heap(a)
  last_parent_idx = a.length / 2 - 1
  i = last_parent_idx
  while i >= 0
    heapify(a, i, a.size)
    i = i - 1
  end
end

def heap_sort(a)
  return a if a.size <= 1
  size = a.size
  build_heap(a)
  while size > 0
    a[0], a[size-1] = a[size-1], a[0]
    size = size - 1
    heapify(a, 0, size)
  end
  return a
end


# 8.快速排序 
# 百科:http://baike.baidu.com/view/115472.html?wtp=tt 
# Wiki:http://zh.wikipedia.org/zh-tw/%E5%BF%AB%E9%80%9F%E6%8E%92%E5%BA%8F 

 def quick_sort(a)
  (x=a.pop) ? quick_sort(a.select{|i| i <= x}) + [x] + quick_sort(a.select{|i| i > x}) : []
end


# 9.計數排序 
# 百科:http://baike.baidu.com/view/1209480.html?wtp=tt 
# Wiki:http://zh.wikipedia.org/zh-tw/%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F 

 def counting_sort(a)
  min = a.min
  max = a.max
  counts = Array.new(max-min+1, 0)

  a.each do |n|
    counts[n-min] += 1
  end

  (0...counts.size).map{|i| [i+min]*counts[i]}.flatten
end


# 10.基數排序 
# 百科:http://baike.baidu.com/view/1170573.html?wtp=tt 
# Wiki:http://zh.wikipedia.org/zh-tw/%E5%9F%BA%E6%95%B0%E6%8E%92%E5%BA%8F 

 def kth_digit(n, i)
  while(i > 1)
    n = n / 10
    i = i - 1
  end
  n % 10
end

def radix_sort(a)
  max = a.max
  d = Math.log10(max).floor + 1

  (1..d).each do |i|
    tmp = []
    (0..9).each do |j|
      tmp[j] = []
    end

    a.each do |n|
      kth = kth_digit(n, i)
      tmp[kth] << n
    end
    a = tmp.flatten
  end
  return a
end
