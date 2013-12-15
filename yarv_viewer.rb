# yarv_viewer.rb
# Show YARV instructions for given Ruby code
require 'green_shoes'

Shoes.app(width: 900, height: 550) do
  stack(margin: 10) do
    flow(margin: 10) do
      caption "Ruby Code", width: 400
      caption "YARV Instructions", width: 400
    end
    flow(margin: 10) do
      @code = edit_box(width: 400, height: 400)
      @yarv = edit_box(width: 400, height: 400) 
    end
    flow(margin: 10) do
      @compile_button = button("compile") do
        @yarv.text = RubyVM::InstructionSequence.compile(@code.text).disasm
      end
    end
  end
end
