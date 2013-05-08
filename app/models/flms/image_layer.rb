module Flms
  class ImageLayer < Layer
    attr_accessible :image, :image_cache, :image_display_mode

    IMAGE_DISPLAY_MODES = %w(contain cover)

    validates_inclusion_of :image_display_mode, in: IMAGE_DISPLAY_MODES

    mount_uploader :image, ImageUploader
    before_save :retain_geometry

    def view_object
      @view_object ||= Flms::ImageLayerViewObject.new(self)
    end

    def uploaded_filename
      File.basename(image.path) if image?
    end

    # Pull geometry information out of uploaded file and store as attributes in
    # model prior to save.  See image_uploader.rb#get_geometry.
    def retain_geometry
      geometry = self.image.normal.geometry
      if geometry
        # Use a reasonable guesstimate for window size to come up with a starting point
        # for % width and height for the image based on it's resolution:
        self.width = 900.0 / geometry[0]
        self.height = 800.0 / geometry[1]
      end
    end
  end
end

