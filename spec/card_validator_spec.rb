require_relative '../main.rb'

describe CardValidator do
	it "should be true" do
		expect(CardValidator.new("4408 0412 3456 7893").valid?).to be true
	end

	it "should be false" do
		expect(CardValidator.new("4408 0412 3456 7893 2").valid?).to be false
	end
end