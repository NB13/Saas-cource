def palindrome?(string)
	if string.nil?
		return true;
	end
	string.downcase!
	string.gsub!(/\W/,'')
	reversed = string.reverse
	return string.eql?(reversed)
end

def count_words(string)
	if string.nil?
		return Hash.new
	end
	string.downcase!
	result = Hash.new
	string.scan(/\w+/){|w| result[w] = result.fetch(w,0)+1 } 
	return result
end