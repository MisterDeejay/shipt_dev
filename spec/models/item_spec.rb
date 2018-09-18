require 'spec_helper'

describe Item do
  describe "#created_between scope" do
    let!(:item) { FactoryBot.create(:item) }
    it "returns all items created between the input dates" do
      expect(Item.created_between(2.months.ago, Date.today).include?(item)).to be_truthy

      Timecop.freeze(Time.now + 3.months) do
        expect(Item.created_between(2.months.ago, Date.today).include?(item)).to be_falsey
      end
    end

    context "with a nil argument" do
      it "will raise a NoMethodError" do
        expect do
          Item.created_between(2.months.ago, nil).include?(item)
        end.to raise_error(NoMethodError)

        expect do
          Item.created_between(nil, Date.today).include?(item)
        end.to raise_error(NoMethodError)
      end
    end

    context "missing a date" do
      it "raises an ArgumentError" do
        expect do
          Item.created_between(2.months.ago).include?(item)
        end.to raise_error(ArgumentError)
      end
    end

    context "the same start and end date" do
      it "returns all items created during those 24 hours" do
        expect(Item.created_between(Date.today, Date.today).include?(item)).to be_truthy

        Timecop.freeze(1.month.ago) do
          p = FactoryBot.create(:item)
          expect(Item.created_between(Date.today, Date.today).include?(p)).to be_truthy
        end
      end
    end
  end
end
