# stacks_flows.rb
require 'green_shoes'

Shoes.app do

  stack do
    para "stack item 1", width: 100
    button "stack item 2" 
  end

  flow do
    para "flow item 1", width: 100
    button "flow item 2"
  end
end
