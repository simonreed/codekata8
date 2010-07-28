class Dictionary

  @@six_letter_words = ['albums','barely','befoul','convex','hereby','jigsaw','tailor','weaver']
  @@five_letter_words = []
  @@four_letter_words = ['bums','tail','foul','aver','here']
  @@three_letter_words = ['bar','ely','con','vex','jig','saw']
  @@two_letter_words = ['al','or','be','by','or','we']
  @@one_letter_words = ['a','i']

  class << self
    
    def kata
      @@six_letter_words.each do | word |
             
        5.times do | first_word_position |
          w = word.clone
          first_word = w.slice!(0..first_word_position)
          second_word = w
          
          next unless valid_word?(first_word) and valid_word?(second_word)
          
          puts "#{first_word} + #{second_word} => #{word}"          
        end
      end
    end
    
    def valid_word?(word)
      case word.size
        when 1 
          @@one_letter_words.include?(word)
        when 2 
          @@two_letter_words.include?(word)
        when 3
          @@three_letter_words.include?(word)
        when 4
          @@four_letter_words.include?(word)
        when 5
          @@five_letter_words.include?(word)
      end      
    end    
    
  end

end

require "benchmark"

time = Benchmark.realtime do
  Dictionary.kata
end
puts "Time elapsed #{time*1000} milliseconds"