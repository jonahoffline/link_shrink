require 'spec_helper'

describe LinkShrink::Options do
  let(:options_class) { described_class }
  let(:empty_hash) { described_class.new({}) }

  describe '#initialize' do
    it 'inherits from Hash' do
      expect(options_class.superclass).to be(Hash)
    end
  end

  describe '#json?' do
    context 'when :json is set to true in the options hash' do
      it 'returns true' do
        options = options_class.new(json: true)
        expect(options.json?).to be_true
      end
    end

    context 'when :json is set to false in the options hash' do
      it 'returns false' do
        options = options_class.new(json: false)
        expect(options.json?).to be_false
      end
    end

    context 'when called with empty hash' do
      it 'returns false' do
        expect(empty_hash.json?).to be_false
      end
    end
  end

  describe '#qr_code?' do
    context 'when :qr_code is set to true in the options hash' do
      it 'returns true' do
        options = options_class.new(qr_code: true)
        expect(options.qr_code?).to be_true
      end
    end

    context 'when :qr_code is set to false in the options hash' do
      it 'returns false' do
        options = options_class.new(qr_code: false)
        expect(options.qr_code?).to be_false
      end
    end
  end

  describe '#qr_code?' do
    context 'when :qr_code is set to true in the options hash' do
      it 'returns true' do
        options = options_class.new(qr_code: true)
        expect(options.qr_code?).to be_true
      end
    end

    context 'when :qr_code is set to false in the options hash' do
      it 'returns false' do
        options = options_class.new(qr_code: false)
        expect(options.qr_code?).to be_false
      end
    end
  end

  describe '#image_size?' do
    context 'when :image_size has a custom size' do
      it 'returns true' do
        options = options_class.new(qr_code: '300x300')
        expect(options.qr_code?).to be_true
      end
    end

    context 'when :image_size is not defined in the options hash' do
      it 'returns false' do
        expect(empty_hash.image_size?).to be_false
      end
    end
  end
end
