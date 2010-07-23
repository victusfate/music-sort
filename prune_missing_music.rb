require 'fileutils'
def check_for_file(m3u_name,opath)
  prune = false
  m3us = IO.readlines(m3u_name)
  m3us.each do |m3u|
    m3u = m3u.chomp # remove carriage return for file manip
    unless File.exist? m3u or m3u['#']
      prune = true
      break
    end
  end
  if prune
    puts "Pruning from #{m3u_name}"
    FileUtils.mv(m3u_name,opath+"back_"+File.basename(m3u_name))
    out_m3u = File.new(opath+File.basename(m3u_name),'w+')
    prevline = ''
    m3us.each do |m3u_line|
      m3u = m3u_line.chomp # remove carriage return for file manip
      if m3u['#']
        prevline = m3u + "\n"
        next
      end
      if File.exist? m3u
#        puts prevline unless prevline.length == 0
#        puts m3u_line
        out_m3u << prevline unless prevline.length == 0
        out_m3u << m3u_line
        prevline = ''
      end

    end
    out_m3u.close
  end
end

opath = '/home/messel/Desktop/music/'

if (ARGV.size > 0)
  check_for_file ARGV[0].to_s, opath
else
  Dir.glob('*.m3u').each do |m3u_name|
    check_for_file m3u_name, opath
  end
end


