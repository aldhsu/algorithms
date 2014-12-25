require_relative "second_lowest_number"
require "pry"
require "pry-byebug"

describe SecondLowestNumber do
  let(:service) { SecondLowestNumber }

  describe "#find_swap_index" do
    context "number sequence of 123" do
      let(:number) { 123 }

      it "returns the correct number" do
        expect(service.new(number).find_swap_index).to eq ""
      end
    end

    context "number sequence of 132" do
      let(:number) { 132 }

      it "returns the correct number" do
        expect(service.new(number).find).to eq 132
      end
    end
  end
end
