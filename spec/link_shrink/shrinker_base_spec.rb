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
    context 'when api_key is found' do
      it 'returns base_url with api_query_parameters' do
        link_shrink.stub(:sub_klass).and_return('Blahblah')
        link_shrink.stub(:api_key).and_return('12345')
        link_shrink.stub(:api_key?).and_return(true)

        link_shrink.stub(:base_url).and_return('http://blah.io/api')
        link_shrink.stub(:api_query_parameter).and_return('?key=12345')
        expect(link_shrink.api_url).to eq('http://blah.io/api?key=12345')
      end
    end

    context 'when api_key is not found' do
      it 'returns base_url' do
        link_shrink.stub(:sub_klass).and_return('Blahblah')
        link_shrink.stub(:base_url).and_return('http://blah.io/api')
        expect(link_shrink.api_url).to eq('http://blah.io/api')
      end
    end
  end

  describe '#generate_chart_url' do
    it 'raises error due to other methods not being overridden' do
      expect{ link_shrink.generate_chart_url('something') }.to raise_error
    end
  end

  describe '#api_key?' do
    it 'returns false when API is not found' do
      link_shrink.stub(:sub_klass).and_return('blahblah')
      expect(link_shrink.api_key?).to be_false
    end
  end

  describe '#api_key' do
    context 'when not found' do
      it 'returns nil' do
        link_shrink.stub(:sub_klass).and_return('Blah')
        expect(link_shrink.api_key).to eq(nil)
      end
    end

    context 'when found' do
      it 'returns api_key' do
        link_shrink.stub(:sub_klass).and_return('Blah')
        #link_shrink.stub(:api).and_return('Blah')
        ENV.store('BLAH_URL_KEY', '12345')
        expect(link_shrink.api_key).to eq('12345')
      end
    end
  end

  describe '#sanitize_url' do
    it 'cleans URL' do
      expect(link_shrink.sanitize_url("http://www.google.com/ "))
      .to eq("http://www.google.com/%20")
    end
  end

  describe '#http_method' do
    it 'returns :get' do
      expect(link_shrink.http_method).to eq(:get)
    end
  end

  describe '#content_type' do
    it 'returns application/json by default' do
      expect(link_shrink.content_type).to eq('application/json')
    end
  end

  describe '#url' do
    context 'when set' do
      it 'returns url' do
        link_shrink.url = 'http://www.google.com'
        expect(link_shrink.url).to eq('http://www.google.com')
      end
    end

    context 'when called without being set' do
      it 'returns nil' do
        expect(link_shrink.url).to eq(nil)
      end
    end
  end
end