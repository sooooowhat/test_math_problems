2.
class MyClass; end

obj = MyClass.new
obj.class  # => MyClass
obj.class.class # => Class
obj.class.class.superclass # => Module
obj.class.class.superclass.superclass # => Object
obj.class.superclass  # => Object
obj.class.superclass.class  # => Class


3.
## 只对单个对象生效的方法，叫单件方法
str = "asd"
def str.hello
  puts "aaaa1"
end

str.hello # => "aaaa1"
"asss".hello # => NoMethodError


## 
str = "asd"
class << str
	def hello
		puts "aaaa1"
	end
end

str.hello   # => "aaaa1"
str.singleton_class # => #<Class:#<String:0x0000000001874708>>
str.singleton_class.superclass # => String

4.
module M
	def hello
		puts "hello1"
	end

	module M1
		def haha
			puts "haha1"
		end
	end
end

class A
	include M
	extend M::M1
end

A.new.hello   # => "hello"
A.haha   # => "haha1"




5.
浏览器发出请求，rails路由把请求交给某controller的某个action处理
  1)直接渲染视图，生成html发给浏览器
  2) controller与 model交互，获取数据，controller再渲染视图，生成html发送给浏览器


6.
require  加载类库，重复加载会返回错误
require 'rails'   # => true
require 'rails'   # => false


load 加载代码，每次都会重新加载
# 1.rb
@arr = []
load '2.rb'
p @arr

# 2.rb
[*1..10].map {|n| @arr << n }


# ruby 1.rb   # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

