def combine_anagrams(words)
	hash = Hash.new
	hash.default_proc = proc do |hash,key|
		hash[key] = Array.new
	end

	words.each{ |word| hash[wordHash(word)] << word }
	return hash.values
end

def wordHash(word)
	return word.downcase.chars.sort.join
end