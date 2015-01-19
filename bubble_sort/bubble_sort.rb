def bubble_sort(list) 
	sorted = false
	list_copy = list.dup
	until sorted
		sorted = true
		index = 0
		while index < list_copy.length - 1
			if list_copy[index] > list_copy[index + 1]
				list_copy[index], list_copy[index + 1] = list_copy[index + 1], list_copy[index]
				sorted = false				
			end
			index += 1
		end
	end
	list_copy
end


def bubble_sort_by(list) 
	sorted = false
	list_copy = list.dup
	until sorted do
		sorted = true
		index = 0
		while index < list_copy.length - 1 do
			sort = yield(list_copy[index], list_copy[index + 1])
			if sort < 0
				list_copy[index], list_copy[index + 1] = list_copy[index + 1], list_copy[index]
				sorted = false
			end
			index += 1
		end
	end
	list_copy
end




