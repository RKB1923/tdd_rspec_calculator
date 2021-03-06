require 'rspec'
require './lib/calculator'

describe Calculator do
  describe ".total" do
    it "should be 0 on a new calculator" do
      expect(subject.total).to eq(0)
    end
  end

  describe ".add" do
    it "should add a number to the total" do
      subject.add(5)
      expect(subject.total).to eq(5)
    end

    it "should handle multiple calls to add" do
      subject.add(5).add(2)
      expect(subject.total).to eq(7)
    end

    it "should handle negative numbers" do
      subject.add(-2)
      expect(subject.total).to eq(-2)

      subject.add(5).add(-27).add(10).add(-12)
      expect(subject.total).to eq(-26)
    end

    it "should handle floats" do
      subject.add(2.5)
      expect(subject.total).to eq(2.5)

      subject.add(-3.1).add(4.5).add(-31.257)
      expect(subject.total).to be_within(0.0001).of(-27.357)
    end
  end

  describe ".subtract" do
    it "should subtract a positive number from the total" do
      subject.subtract(5)
      expect(subject.total).to eq(-5)
    end

    it "should subtract a negative number from the total" do
      subject.subtract(-5)
      expect(subject.total).to eq(5)
    end

    it "should subtract a negative number subtracted from a negative number" do
      subject.subtract(5).subtract(-5)
      expect(subject.total).to eq(0)
    end


  end

  # add(5).add(2)
  # add(5,2)
end
