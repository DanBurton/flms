module Flms
  class ImageLayerViewObject < Flms::LayerViewObject

    def src
      @layer.image.url
    end

    def attributes(scroll_offset = 0)
      attributes = keyframe_data_hash(scroll_offset)
      attributes[:id] = @layer.name
      attributes[:style] += """
        background-image: url(#{src});
        background-size: #{@layer.image_display_mode};
        background-repeat: no-repeat;
      """
      attributes
    end

  end
end
