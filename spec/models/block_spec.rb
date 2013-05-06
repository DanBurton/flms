require 'spec_helper'

describe Flms::Block do
  include NamedFactories

  describe 'associations' do
    it 'has pages' do
      block.pages << page_1
      expect(block).to have(1).pages
      expect(block.pages.first).to eql page_1
    end
  end

  describe 'scroll_duration' do
    let(:block) { create :block }
    let!(:layer_1) { l = block.layers.build(name: 'abc').build_default_keyframes
                     l.start_state_keyframe.scroll_start = 1
                     l.save! }
    let!(:layer_2) { l = block.layers.build(name: 'def').build_default_keyframes
                     l.start_state_keyframe.scroll_start = 2
                     l.save! }

    it 'returns the total scroll duration for the block' do
      expect(block.scroll_duration).to eql 302
    end

    it 'returns 0 when the block has no layers' do
      expect(subject.scroll_duration).to eql 0
    end
  end
end

