require 'fileutils'

def check_for_file(m3u_name,path,opath)
  m3us = IO.readlines(m3u_name)
  m3us.each do |m3u|
    m3u = m3u.chomp # remove carriage return for file manip
    unless File.exist? m3u or m3u['#']
      puts m3u
      Dir.glob(path+'**/'+m3u).each do |found|
         puts "found file on FIRELITE #{found}"
         FileUtils.cp(found,opath + m3u)
      #      Process.exit
      end
    end
  end
end

path = '/media/FIRELITE_/music/'
opath = '/home/messel/Desktop/music/'

if (ARGV.size > 0)
  check_for_file ARGV[0].to_s, path, opath
else
  Dir.glob('*.m3u').each do |m3u_name|
    check_for_file m3u_name, path, opath
  end
end


