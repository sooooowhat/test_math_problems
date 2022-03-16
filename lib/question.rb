1:
arr = 'xyz165c5671lki6789cc121113'.split("")
nums = ('1'..'9').to_a
len = 0
a,b = [],[]
arr.each_with_index do |x,i|
	if nums.include?(x)
		len += 1
		# p [x,len]
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


2:
 attrs.sort {|a, b| b[:gender] <=> a[:gender] && b[:age] <=> a[:age]}


3:
 class Store
	def initialize(&p)
		@args = p.call([])
	end

	def next
		a = @args.shift
		a.class == Proc ? a = a.call : a
		a
	end
end


4:
 require 'active_support/concern'

module Injection

	extend ActiveSupport::Concern

	included do
		@@fields = []
	end

	class_methods do

		def field name, path
			result = class_variable_get(:@@fields)
			result << name.to_sym
			class_variable_set(:@@fields, result)

			define_method(name) do
				case path
				when String
					path.split(".").inject(self.data) { |datas, key| datas[key] }
				when Proc
					path.call(self)
				end
			end
		end
	end

	def fields
		self.class.class_variable_get :@@fields
	end

end



5:
before_save
