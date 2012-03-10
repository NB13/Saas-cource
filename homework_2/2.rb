class CartesianProduct < Range
	include Enumerable
	
	@a
	@b
	
	def initialize(a, b)	
		@a = a
		@b = b
	end
	
	def each(&block)
		@a.each_entry{ |a_entry| @b.each_entry{ |b_entry| yield [a_entry, b_entry] } }
	end
end