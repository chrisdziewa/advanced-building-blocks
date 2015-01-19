module Enumerable
	def my_each 
		i = self.length
		n = 0
		if block_given?
			while n < i
				yield(self[n])
				n += 1
			end
			self
		else
			"#<Enumerator: #{self}:my_each>"
		end
	end

	def my_each_with_index 
		i = self.length
		n = 0
		if block_given?
			while n < i
				yield(self[n], n)
				n += 1
			end
			self
		else
			"#<Enumerator: #{self}:my_each_with_index>"
		end
	end

	def my_select
		selection = []
		if block_given?
			self.my_each do |item|
				selection.push(item) if yield(item)
			end
			selection
		else
			"#<Enumerator: #{self}:my_select>"
		end	
	end

	def my_all? 
		if block_given?
			self.my_each do |item|
				return false unless yield(item)  
			end
		end	
		true
	end

	def my_any? 
		if block_given?
			self.my_each do |item|
				return true if yield(item)  
			end
			return false
		end	
		true
	end

	def my_none? 
		if block_given?
			self.my_each do |item|
				return false if yield(item)  
			end
			return true
		end	
		false
	end

	def my_count
		self.length
	end

	def my_inject(sum=0) 
		if block_given?
			self.my_each do |item|
				sum = yield(sum, item)
			end
			sum
		else
			warn "LocalJumpError: no block given"
		end	
	end

    ##Accepts procs and blocks 
    ##but only runs blocks when proc provided
	def my_map(param=0)
		array = self.dup
		if param.instance_of? Proc
			array.my_each_with_index do |item, index|
				array[index] = param.call(item)
		 	end
		 	if block_given?
		 		array.my_each_with_index do |item, index|
		 			array[index] = yield(item)
		 		end
		 	end
		array
		else
			"#<Enumerator: #{self}:my_map_with_proc>"
		end	
	end

	##Original my_map:
	# def my_map
	# 	array = self.dup
	# 	if block_given?
	# 		array.my_each_with_index do |item, index|
	# 			array[index] = yield(item)
	# 		end
	# 		array
	# 	else
	# 		"#<Enumerator: #{self}:my_map>"
	# 	end	
	# end
end