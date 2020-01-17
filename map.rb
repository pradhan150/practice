class Array

	def my_map(&block)
		ans=[]
		self.each do |i|
			ans << (block.call(i))
		end

		p ans
	end

	def my_map2
		ans=[]
		self.each do |i|
			ans << (yield(i))
		end

		p ans
	end
end

a=[1,2,3,4]
a.my_map2{|i| i+2}
a.my_map{|i| i*2}





