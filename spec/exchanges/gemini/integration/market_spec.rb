require 'spec_helper'

RSpec.describe 'Gemini integration specs' do
  client = Cryptoexchange::Client.new

  it 'fetch pairs' do
    pairs = client.pairs('gemini')
    expect(pairs).not_to be_empty

    pair = pairs.first
    expect(pair.base).to_not be nil
    expect(pair.target).to_not be nil
    expect(pair.market).to eq 'gemini'
  end

  it 'fetch ticker' do
    btc_usd_pair = Cryptoexchange::Models::MarketPair.new(base: 'BTC', target: 'USD', market: 'gemini')
    ticker = client.ticker(btc_usd_pair)

    expect(ticker.base).to eq 'BTC'
    expect(ticker.target).to eq 'USD'
    expect(ticker.market).to eq 'gemini'
    expect(ticker.bid).to_not be nil
    expect(ticker.ask).to_not be nil
    expect(ticker.volume).to_not be nil
    expect(ticker.timestamp).to be_a Numeric
    expect(ticker.payload).to_not be nil
  end
end
