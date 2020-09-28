
array_of_hash = [
  { 'id': 1, 'title': 'Heading1', 'heading_level': 0 },
  { 'id': 2, 'title': 'Heading2', 'heading_level': 2 },
  { 'id': 3, 'title': 'Heading3', 'heading_level': 2 },
  { 'id': 5, 'title': 'Heading4', 'heading_level': 1 },
  { 'id': 6, 'title': 'Heading5', 'heading_level': 1 },
  { 'id': 7, 'title': 'Heading6', 'heading_level': 2 },
  { 'id': 8, 'title': 'Heading7', 'heading_level': 2 },
  { 'id': 9, 'title': 'Heading8', 'heading_level': 0 },
  { 'id': 10, 'title': 'Heading9', 'heading_level': 2 },
  { 'id': 11, 'title': 'Heading10', 'heading_level': 1 },
  { 'id': 12, 'title': 'Heading11', 'heading_level': 0 }
]

last_level = 0
last_value = '1'

array_of_hash.each_with_index do |hash, index|
  if index == 0
    last_value = '1'
  else
    if hash[:heading_level] == 0
      last_value = "#{last_value[0].to_i+1}"
    else
      if hash[:heading_level] == last_level
        last_value = "#{last_value.to_i+1}"
      elsif hash[:heading_level] < last_level
        last_value = "#{last_value[0..hash[:heading_level]].to_i + 1 }"
      else
        (hash[:heading_level]+1 - last_value.size).times do
          last_value += '1'
        end
      end
    end
  end

  last_level = hash[:heading_level]
  space = "";
  hash[:heading_level].times do
    space += "  ";
  end
  puts "#{space} #{last_value.scan(/.{0,1}/).join(".")} #{hash[:title]}"
end
