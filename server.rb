require './connection.rb'
require './anagram_ar_connect.rb'
require 'pry'
require 'active_record'
require 'sinatra'
require 'mustache'
# require 'sinatra/flash'

enable :sessions

get '/' do
	anagrams = Anagram.all.to_a
	Mustache.render(File.read('./checker_anagram.html'), {anagrams: anagrams})
end

post '/checker' do
	if (params['word1'].downcase.scan(/\w/).sort) == (params['word2'].downcase.scan(/\w/).sort)
		puts "Anagrams confirmed"
		Anagram.create(word1: params['word1'], word2: params['word2'])
		anagrams = Anagram.all.to_a
		Mustache.render(File.read('./checker_anagram.html'), {anagrams: anagrams})
	else
		anagrams = Anagram.all.to_a
		# flashes = flash.now[:checker] = "NOT AN ANAGRAM DUDE"
		# flashes = flash[:checker] -- works if you do flash.next.. because it's the next time it's called
		Mustache.render(File.read('./checker_anagram_fail.html'), {anagrams: anagrams})

		#add flashes:flashes inside mustache in line above 
	end
end