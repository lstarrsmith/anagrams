require './connection.rb'
require './anagram_ar_connect.rb'
require 'pry'
require 'active_record'


word1= ARGV[0]
word2= ARGV[1]

if (word1.downcase.scan(/\w/).sort) == (word2.downcase.scan(/\w/).sort)
	puts "Anagrams confirmed"
	Anagram.create(word1: word1, word2: word2)
else
	puts "Sorry, no anagrams here, dog"
end