# margins.rb
require 'green_shoes'

Shoes.app do

  caption "No margin set:"

  stack do
    para "stack item 1", width: 100
    button "stack item 2" 
  end

  flow do
    para "flow item 1", width: 100
    button "flow item 2"
  end

  caption "Margin: 10"

  stack(margin: 10) do
    para "stack item 1", width: 100
    button "stack item 2" 
  end

  flow(margin: 10) do
    para "flow item 1", width: 100
    button "flow item 2"
  end
end
