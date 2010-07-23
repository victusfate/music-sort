

def check_for_file(m3u_name)
  m3us = IO.readlines(m3u_name)
  m3us.each do |m3u|
    m3u = m3u.chomp # remove carriage return for file manip
    puts "List #{m3u_name} missing #{m3u}" unless File.exist? m3u or m3u['#']
  end
end

if (ARGV.size > 0)
  check_for_file ARGV[0].to_s
else
  Dir.glob('*.m3u').each do |m3u_name|
    check_for_file m3u_name
  end
end


