# event_handling.rb
# Interactive Shoes elements take an event handler as a block 
require 'green_shoes'

Shoes.app do
  stack(margin: 10) do
    @edit_box = edit_box do |e|
      @copy_box.text = @edit_box.text
    end  

    @copy_box = para "what you type in the edit box goes here"

    @button = button("obfuscate") do
      ob_bytes = @copy_box.text.each_byte.map { |b| b+1 }
      @copy_box.text = ob_bytes.map { |b| b.chr}.join
    end
  end
end
