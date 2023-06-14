require 'open-uri'

def download_pic(filename, url)
  data = open(url, 'User-Agent' => 'ruby') { |f| f.read }
  file = File.new filename, 'w+'
  file.binmode
  file << data
  file.flush
  file.close
end

arr = ['pic_link'] * n

arr.each do |pic|
  next if pic.empty?
  download_pic(pic.split('/')[-1], pic)
end
