# image_converter.rb
# Basic image converter using ImageMagick
require 'green_shoes'
require 'gtk2'

Shoes.app do
  title "--Image Converter--"

  caption "Image Path:"
  @path_line = edit_line

  button("select image") do
    dialog = Gtk::FileChooserDialog.new(
             "Select Image",
             nil,
             Gtk::FileChooser::ACTION_OPEN,
             nil,
             [Gtk::Stock::CANCEL, Gtk::Dialog::RESPONSE_CANCEL],
             [Gtk::Stock::OPEN, Gtk::Dialog::RESPONSE_ACCEPT])

    if dialog.run == Gtk::Dialog::RESPONSE_ACCEPT
      @path_line.text = dialog.filename
    end
    dialog.destroy
  end

  caption "Choose a new image format:"
  list_box items: ["jpg", "png", "gif"] do |list|
    @conversion_type = list.text
  end

  button("convert") do
    @file_path = @path_line.text
    @filename = File.basename(@file_path, '.*')
    @conversion_path = "#{File.dirname(@file_path)}/#{@filename}.#{@conversion_type}"
    if @file_path != @conversion_path
      Thread.new do
        @status.text = "converting..."
        system("convert #{@file_path} #{@conversion_path}")
        @status.text = ""
      end
    else
      alert("The image is already in that format")
    end
  end
  @status = para ""
end
