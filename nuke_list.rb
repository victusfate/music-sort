require 'fileutils'
puts ARGV
list = ARGV[0]
m3us = IO.readlines(list)
m3us.each do |m3u|
  puts "nuking #{m3u}"
  FileUtils.rm m3u if File.exist? m3u
end
puts "nuking list #{list}"
FileUtils.rm list if File.exist? list
