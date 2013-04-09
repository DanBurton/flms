require 'spec_helper'

describe Flms::KeyframeViewObject do
  let(:test_keyframe) { create :keyframe,
                               scroll_start: 1, scroll_duration: 2,
                               width: 0.3, height: 0.4,
                               position_x: 0.5, position_y: 0.6,
                               opacity: 0.7, scale: 0.8, blur: 0.9 }
  let!(:presenter) { Flms::KeyframeViewObject.new(test_keyframe) }

  describe 'styles' do
    it 'generates correct style attributes' do
      styles = presenter.styles
      expect(styles).to eql 'left: 50.0%; top: 60.0%; opacity: 0.7; transform: scale(0.8); filter: blur(0.9);'
    end
  end

  describe 'style for attribute' do
    describe 'formatted as percent' do
      it 'generates correct format for keyframe attributes' do
        expect(presenter.style_for_attribute(:width)).to eql 'width: 30.0%;'
      end
    end

    describe 'translation using KEYFRAME_ATTRIBUTE_NAMES_TO_CSS' do
      it 'translates :position_x to \'left\'' do
        expect(presenter.style_for_attribute(:position_x)).to eql 'left: 50.0%;'
      end

      it 'translates :position_y to \'top\'' do
        expect(presenter.style_for_attribute(:position_y)).to eql 'top: 60.0%;'
      end
    end

    it 'raises an error if an invalid attribute is specified' do
      expect { presenter.style_for_attribute(:a_bad_attribute) }.to raise_error
    end

    it 'generates correct style when attribute value is overridden' do
      expect(presenter.style_for_attribute(:width, -0.123)).to eql 'width: -12.3%;'
    end
  end

  describe 'attribute formatters' do
    describe 'format_as_decimal' do
      it 'converts correctly' do
        expect(presenter.format_as_decimal('name', -0.123)).to eql 'name: -0.123'
      end
    end

    describe 'format_as_percent' do
      it 'converts correctly' do
        expect(presenter.format_as_percent('name', -0.123)).to eql 'name: -12.3%'
      end

      it 'handles arbitrary number of decimal places' do
        expect(presenter.format_as_percent('name', 0.1)).to eql 'name: 10.0%'
        expect(presenter.format_as_percent('name', -0.123456)).to eql 'name: -12.3456%'
      end
    end

    describe 'format_as_transform' do
      it 'formats attribute correctly' do
        expect(presenter.format_as_transform('name', 'value')).to eql 'transform: name(value)'
      end
    end

    describe 'format_as_filter' do
      it 'formats attribute correctly' do
        expect(presenter.format_as_filter('name', 'value')).to eql 'filter: name(value)'
      end
    end

  end
end

