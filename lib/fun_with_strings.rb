module FunWithStrings
  def palindrome?
    self.downcase.gsub(/\W/, '').reverse == self.downcase.gsub(/\W/, '')
  end
  def count_words
    words_hash = {}
    self.downcase.split(/\W|\s/).each do |word| 
      words_hash[word] ||= 0
      words_hash[word] += 1
    end
    words_hash.delete("")
    words_hash
  end
  def anagram_groups
    # your code here
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
