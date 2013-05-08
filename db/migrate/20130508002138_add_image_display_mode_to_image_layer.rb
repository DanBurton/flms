class AddImageDisplayModeToImageLayer < ActiveRecord::Migration
  def change
    add_column :flms_layers, :image_display_mode, :string, default: 'Contain'
  end
end
