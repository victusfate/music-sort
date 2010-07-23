require 'fileutils'
orig = '/home/messel/Desktop/music/'
dest = '/home/messel/Desktop/mobilemusic/'
Dir.chdir(orig)
Dir.glob('*.m3u') do |m3u_name|
  m3us = IO.readlines(m3u_name)
  out_m3u = File.new(dest+m3u_name,'w+')
  m3us.each do |m3u|
    m3u.gsub!(/\\/,'/')
    b1 = File.basename(m3u)
    out_m3u << b1 # write new m3u with carriage return
    m3u = m3u.chomp # remove carriage return for file manip
#    puts m3u
    unless m3u['#']
      basename = File.basename(m3u)
      puts "orig #{orig+m3u} dest #{dest+basename}"
      if File.exist? orig+m3u and !File.exist? dest+basename
        FileUtils.cp(orig+m3u,dest+basename)
      end
#      Process.exit
    end
  end
  out_m3u.close
end