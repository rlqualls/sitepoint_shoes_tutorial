# flow_inside_stack.rb
require 'green_shoes'

Shoes.app do

  stack do
    para "stack item 1", width: 100

    flow do
      para "flow item 1", width: 100
      button "flow item 2"
    end

    button "stack item 2" 
  end
end
