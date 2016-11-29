#!/usr/bin/env ruby

format_string = ARGV.first.delete(" ").split("").reverse
#format_string = "4408 0412 3456 7893".delete(" ").split("").reverse

class CardValidator
	attr_accessor :result_string, :format_string

	def initialize(args)
		@result_string = []
		@format_string = args
	end

	def valid?
		to_translate % 10 == 0
	end

	private
	def to_translate
		@format_string.each_with_index do |element, index|
			index.even? ? @result_string << (element.to_i * 2) : @result_string << element.to_i
		end
		@result_string = @result_string.reverse!.join.split("").map{|x| x.to_i }.inject(0, :+)
	end
end

@CardTest = CardValidator.new(format_string)

if @CardTest.valid?
	puts "Thus that card is valid"
else
	puts "That card is not valid"
end