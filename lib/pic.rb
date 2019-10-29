require 'open-uri'
def downLoadJpg(fileName, uri)
  data = open(uri, 'User-Agent' => 'ruby'){|f| f.read}
  file = File.new fileName, 'w+'
  file.binmode
  file << data
  file.flush
  file.close
end
