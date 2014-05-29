require 'json'
start_slide = IO.readlines('class-ruby.txt')
start_slide.map! {|line| line.chomp }
end_slide = IO.readlines('class-js.txt')
end_slide.map! {|line| line.chomp }
timing = 200

lines = [start_slide.size, end_slide.size].max 
slide_show ={}
slide_index = 0
time_index = 0


slide_lines = Array.new(lines)

# copies the lines to the slides lines
slide_lines.each_with_index do |line, index|
  if index < start_slide.length
    slide_lines[index] = start_slide[index] 

  else
    slide_lines[index] = ""
  end
end

# slide_show[slide_index.to_s] = [slide_lines.join("\n"), time_index.to_s]
# time_index += timing
# slide_index += 1

slide_lines.each_with_index do |line, index|

  slide_show[slide_index.to_s] = [slide_lines.join("\n"), time_index.to_s]
  time_index += timing
  slide_index += 1

  if start_slide[index].nil?
    start_len = 0
  else
    start_len = start_slide[index].length
  end

  if end_slide[index].nil?
    end_len = 0
  else
    end_len = end_slide[index].length
  end

  line_length = ([start_len, end_len].max) +1
  
  for cursor in (0...line_length)
    line_start = ""
    line_end = ""
    
    if end_slide[index].nil?
      line_start = ""
    else
      line_start = end_slide[index][0..cursor]
    end

    if start_slide[index].nil?
      line_end = ""
    else
      if cursor >= line_length
        line_end = ""
      else
        line_end = start_slide[index][cursor..line_length-1]
      end
    end

    slide_lines[index] = ""
    slide_lines[index] += line_start  unless line_start.nil?
    slide_lines[index] += line_end unless line_end.nil?

    slide_show[slide_index.to_s] = [slide_lines.join("\n"), time_index.to_s]
    time_index += timing
    slide_index += 1
  end
end

p slide_show.to_json

def create_slide(lines)
  slide_lines = Array.new(lines)
end




