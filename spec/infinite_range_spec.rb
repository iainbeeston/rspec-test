# frozen_string_literal: true

require 'spec_helper'
require 'timeout'

RSpec.describe 'inclusion matcher' do
  it 'can handle inclusion on infinite ranges' do
    expect(1..).to include(3)
  end

  it 'can handle exclusion on infinite ranges' do
    Timeout.timeout(5) do
      expect(1..).not_to include(0)
    end
  end
end

RSpec.describe 'Range.include?' do
  it 'can handle inclusion on infinite ranges' do
    expect((1..).include?(3)).to eq(true)
  end
  
  it 'can handle exclusion on infinite ranges' do
    expect((1..).include?(0)).to eq(false)
  end
end
