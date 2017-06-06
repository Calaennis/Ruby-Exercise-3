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
    words = self.downcase.split
    anagram_array = []
    
    words.each do |word|
      placed = false
      anagram_array.each do |set|
        placed = is_anagram?(set[0],word)
        set.push(word) if placed
        break if placed
      end
      anagram_array.push([word]) unless placed
    end
    anagram_array
  end
  
  private
  def is_anagram?(word1, word2)
    return false unless word1.length == word2.length
    array1 = word1.downcase.chars.sort
    array2 = word2.downcase.chars.sort
    array1.each_with_index do |letter, index|
      return false unless letter == array2[index]
    end
    true
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
