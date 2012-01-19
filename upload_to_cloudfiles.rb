require 'rubygems'
require 'cloudfiles'

# Log into the Cloud Files system
cf = CloudFiles::Connection.new(:username => "", :api_key => "")

# Access a specific container
container = cf.container('')


path = "/"
files = ["file1.flv", "file2flv"]


# Upload files
files.each_with_index do |f, i| 

  puts "Uploading " + f + " (" + i.to_s + "/" + files.length.to_s + ")"

  object = container.create_object((f), false)
  object.write File.open( path + f )
end

