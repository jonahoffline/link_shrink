require 'spec_helper'

describe LinkShrink::Shrinkers::Base do
  let(:link_shrink) { described_class.new }

  describe '#base_url' do
    it 'raise error when not overriden' do
      expect{ link_shrink.base_url }.to raise_error 'base_url not implemented'
    end
  end

  describe '#api_query_parameter' do
    it 'raises error due to other methods not being overridden' do
      expect{ link_shrink.api_query_parameter }.to raise_error
    end
  end

  describe '#body_parameters' do
    it 'raises nil when called without arguments' do
      expect(link_shrink.body_parameters).to eq(nil)
    end
  end

  describe '#api_url' do
    it 'raises error due to other methods not being overridden' do
      expect{ link_shrink.base_url }.to raise_error
    end
  end
  #
  describe '#api_key?' do
    it 'returns false when API is not found' do
      link_shrink.stub(:sub_klass).and_return('blahblah')
      expect(link_shrink.api_key?).to be_false
    end
  end

  describe '#api_key' do
    it 'returns the api key' do
      link_shrink.stub(:sub_klass).and_return('blahblah')
      expect(link_shrink.api_key).to eq(nil)
    end
  end

  describe '#sanitize_url' do
    it 'cleans URL' do
      expect(link_shrink.sanitize_url("http://www.google.com/ "))
      .to eq("http://www.google.com/%20")
    end
  end
end