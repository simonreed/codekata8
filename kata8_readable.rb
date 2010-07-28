class Dictionary

  @@words = ['albums','barely','befoul','convex','hereby','jigsaw','tailor','weaver','bums','tail','foul','aver','here','bar','ely','con','vex','jig','saw','al','or','be','by','or','we','a','i']

  @@six_letter_words = ['albums','barely','befoul','convex','hereby','jigsaw','tailor','weaver']

  class << self
    
    def kata
      @@six_letter_words.each do | word |
             
        5.times do | first_word_position |
          w = word.clone
          first_word = w.slice!(0..first_word_position)
          second_word = w
          
          next unless @@words.include?(first_word) and @@words.include?(second_word)
          
          puts "#{first_word} + #{second_word} => #{word}"          
        end
      end
    end
    
  end

end

require "benchmark"
 
time = Benchmark.realtime do
  Dictionary.kata
end
puts "Time elapsed #{time*1000} milliseconds"