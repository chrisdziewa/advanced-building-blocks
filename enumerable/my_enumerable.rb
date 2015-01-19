module Enumerable
	def my_each 
		i = self.length
		n = 0
		while n < i
			yield(self[n])
			n += 1
		end
		self
	end

	def my_each_with_index 
		i = self.length
		n = 0
		while n < i
			yield(self[n], n)
			n += 1
		end
		self
	end

end