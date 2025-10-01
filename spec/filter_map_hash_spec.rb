# frozen_string_literal: true

RSpec.describe FilterMapHash do
  it "has a version number" do
    expect(FilterMapHash::VERSION).not_to be nil
  end

  describe ".filter_map_hash" do
    subject { described_class.filter_map_hash(input, &block) }

    context "when filtering and transforming even values" do
      let(:input) { { a: 1, b: 2, c: 3, d: 4 } }
      let(:block) { proc { |_k, v| v * 2 if v.even? } }

      it "returns filtered and transformed hash" do
        expect(subject).to eq({ b: 4, d: 8 })
      end
    end

    context "when no values are selected" do
      let(:input) { { a: 1, b: 3, c: 5 } }
      let(:block) { proc { |_k, v| v if v > 10 } }

      it "returns an empty hash" do
        expect(subject).to eq({})
      end
    end
  end

  describe "#filter_map_hash" do
    subject { input.filter_map_hash(&block) }

    it "adds filter_map_hash as instance method to Hash" do
      expect({}.respond_to?(:filter_map_hash)).to be true
    end

    context "when filtering and transforming even values" do
      let(:input) { { a: 1, b: 2, c: 3, d: 4 } }
      let(:block) { proc { |_k, v| v * 2 if v.even? } }

      it "returns filtered and transformed hash" do
        expect(subject).to eq({ b: 4, d: 8 })
      end
    end

    context "when no values are selected" do
      let(:input) { { a: 1, b: 3, c: 5 } }
      let(:block) { proc { |_k, v| v if v > 10 } }

      it "returns an empty hash" do
        expect(subject).to eq({})
      end
    end
  end
end
