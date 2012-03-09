class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s  # make sure it's a string 
		class_eval %Q"
			attr_reader :#{attr_name} 
			attr_reader :#{attr_name}_history
			def #{attr_name}=(new_value)
				@#{attr_name} = new_value
				@#{attr_name}_history = [nil] unless @#{attr_name}_history != nil
				@#{attr_name}_history.push( new_value )
			end"
			
	end
end