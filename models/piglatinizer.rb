class PigLatinizer
    # my attempt
    # def initialize(string)
    #     @string_to_translate = string
    # end
    # def translate
    #     translated_string = []
    #     # binding.pry
    #     @string_to_translate
    #     array_to_check = @string_to_translate.split
    #     array_to_check.each do |word|
    #         binding.pry
    #         if !word.downcase[0].scan(/[aeiou]/).empty?
    #             translated_string << (word + 'way')
    #         else
    #             translated_string << word
    #         end 
    #     end
    #     translated_string.join(" ")
    # end

# copied solution
def piglatinize(input_str)
    input_str.split(" ").length == 1 ? piglatinize_word(input_str) : piglatinize_sentence(input_str)
  end

  private

  def consonant?(char)
    !char.match(/[aAeEiIoOuU]/)
  end

  def piglatinize_word(word)
    # word starts with vowel
    if !consonant?(word[0])
      word = word + "w"
    # word starts with 3 consonants
    elsif consonant?(word[0]) && consonant?(word[1]) && consonant?(word[2])
      word = word.slice(3..-1) + word.slice(0,3)
    # word starts with 2 consonants
    elsif consonant?(word[0]) && consonant?(word[1])
      word = word.slice(2..-1) + word.slice(0,2)
    # word starts with 1 consonant
    else
      word = word.slice(1..-1) + word.slice(0)
    end
    word << "ay"
  end

  def piglatinize_sentence(sentence)
    sentence.split.collect { |word| piglatinize_word(word) }.join(" ")
  end

    
end