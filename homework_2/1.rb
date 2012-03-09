class Symbol
	def to_singular
		return self.to_s.to_singular
	end
end

class String
	def to_singular
		return self.gsub( /s$/, '')
	end
	
	def palindrome?
		if self.nil?
			return true;
		end
		return (self.gsub(/\s/,'') =~ /#{reverse}/ix) != nil
	end
end

class Numeric
	@@currencies = {'rupee' => 0.019, 'yen' => 0.013, 'euro' => 1.292, 'dollar' => 1}
	@current_currency
	def current_currency= (value)
		@current_currency = value
	end
	def current_currency
		if @current_currency.nil?
			@current_currency = 'dollar'
		end
		return @current_currency
	end
	
	
	def method_missing(method_id)
		singular_currency = method_id.to_singular
		if @@currencies.has_key?(singular_currency)
			result = ( self * @@currencies[current_currency] ) / @@currencies[singular_currency]
			result.current_currency = singular_currency
			return result
		else
			super
		end
	end
  
	def in(currency_name)
		method_missing currency_name
	end
end

module Enumerable
	def palindrome?
		return entries.join.palindrome?
end end