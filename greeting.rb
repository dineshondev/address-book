def greeting
  greet = ARGV.shift
  space = " "
  ARGV.each do |arg|
    puts greet + space + "#{arg}"
  end
end

greeting