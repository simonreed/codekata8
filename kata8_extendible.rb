class Dictionary

  @@words = {
    6 => ['albums','barely','befoul','convex','hereby','jigsaw','tailor','weaver'],
    5 => [],
    4 => ['bums','tail','foul','aver','here'],
    3 => ['bar','ely','con','vex','jig','saw'],
    2 => ['al','or','be','by','or','we'],
    1 => ['a','i']
  }

  class << self
    
    def kata(max_word_size=6, &block)
      @@words[max_word_size].each do | word |
             
        (max_word_size - 1).times do | i |
          w = word.clone
          first_word_position  = i + 1
          w.match("^([a-z]\{#{first_word_position}\})([a-z]\*)$")
          first_word = $1
          second_word = $2
          next unless valid_word?(first_word) and valid_word?(second_word)
          
          if block
            yield([first_word, second_word], word)
          else 
            puts "#{first_word} + #{second_word} => #{word}"          
          end
        end
        
      end
    end
    
    def valid_word?(word)
      @@words[word.size].include?(word)
    end    
    
  end

end

require "benchmark"

time = Benchmark.realtime do
  
  Dictionary.kata do | components, full_word |
    puts "Block - #{components.join(' + ')} => #{full_word}"
  end
  
end
puts "Time elapsed #{time*1000} milliseconds"