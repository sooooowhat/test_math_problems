require 'open-uri'
require 'rails'
def downLoadJpg(fileName, url)
  data = open(url, 'User-Agent' => 'ruby'){|f| f.read}
  file = File.new fileName, 'w+'
  file.binmode
  file << data
  file.flush
  file.close
end

arr = ['pic_link'] * n

arr.each do |pic|
  next if pic.blank?
  downLoadJpg(pic.split('/')[-1], pic)
end
