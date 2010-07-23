require 'fileutils'
def check_for_file(m3u_name,opath)
  prune = false
  m3us = IO.readlines(m3u_name)
  out_m3u = File.new(opath+File.basename(m3u_name),'w+')
  m3us.each do |m3u_line|
    out_m3u << m3u_line.gsub(/\\n/,"\n")
  end
  out_m3u.close
end


opath = '/home/messel/Desktop/music/'

if (ARGV.size > 0)
  check_for_file ARGV[0].to_s, opath
else
  Dir.glob('*.m3u').each do |m3u_name|
    check_for_file m3u_name, opath
  end
end


