require 'spec_helper'

describe Flms::LayerViewObject do

  describe 'view_partial_name' do
    let(:layer_view_object) { Flms::LayerViewObject.new(create :layer) }
    let(:layer_view_object_with_image_layer) { Flms::LayerViewObject.new(create :image_layer) }
    let(:layer_view_object_with_text_layer) { Flms::LayerViewObject.new(create :text_layer) }
    let(:layer_view_object_with_paragraph_layer) { Flms::LayerViewObject.new(create :paragraph_layer) }
    let(:layer_view_object_with_video_layer) { Flms::LayerViewObject.new(create :video_layer) }

    it "should return 'layer' for a Layer" do
      expect(layer_view_object.view_partial_name).to eql 'flms/elements/layer'
    end
    
    it "should return 'image_layer' for an ImageLayer" do
      expect(layer_view_object_with_image_layer.view_partial_name).to eql 'flms/elements/image_layer'
    end

    it "should return 'text_layer' for a TextLayer" do
      expect(layer_view_object_with_text_layer.view_partial_name).to eql 'flms/elements/text_layer'
    end

    it "should return 'paragraph_layer' for a ParagraphLayer" do
      expect(layer_view_object_with_paragraph_layer.view_partial_name).to eql 'flms/elements/paragraph_layer'
    end

    it "should return 'video_layer' for a VideoLayer" do
      expect(layer_view_object_with_video_layer.view_partial_name).to eql 'flms/elements/video_layer'
    end
  end
  
  describe 'keyframe_data_hash' do
    let(:view_object) { Flms::LayerViewObject.new(create :layer) }
    let(:data) { view_object.keyframe_data_hash(1) }

    it 'anchors to correct target' do
      expect(data['data-anchor-target']).to eql '#pagescroller'
    end

    it 'styles z-index' do
      expect(data[:style]).to match "z-index: 0;"
    end

    it 'generates scroll positions correctly and includes scroll offset' do
      expect(data).to have_key 'data-1'
      expect(data).to have_key 'data-101'
      expect(data).to have_key 'data-201'
      expect(data).to have_key 'data-301'
    end
  end
end
