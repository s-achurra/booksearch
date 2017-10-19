require_relative 'default_library'
require 'set'

class Library

  attr_reader :index

  def initialize(library=$default_library)
    @index = setup(library)
  end

  def setup(library)
    index = Hash.new { |h, k| h[k] = Set.new }

    library.each do |key, value|
      book = "#{key}: #{value[:title]}"

      [value[:title], value[:description]].each do |words|
        deconstruct_text(words).each do |word|
          index[word].add?(book)
        end
      end
    end

    return index
  end

  def deconstruct_text(text)
    return text.gsub(/[\.,\-!?]/, '').split.map(&:downcase)
  end

  def search(words)
    result = Set.new
    words.each { |word| result += @index[word.downcase] }
    result.inspect
  end

end

if __FILE__ == $PROGRAM_NAME
  library = Library.new()

  user_input = ''
  until user_input[0] == 'q'
    puts library.search(user_input) unless user_input == ''
    puts 'What words would you like to search? Enter q to exit'
    user_input = gets.chomp.split(' ')
  end
end
