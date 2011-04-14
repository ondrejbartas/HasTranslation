# Uninstall hook code here

puts "Deleting files..."
dir = "config/initializers"
["has_translation.yml"].each do |yml_file|
  src_file = File.join(File.dirname(__FILE__), dir, yml_file)
  FileUtils.rm_r(src_file)
end
puts "Files deleted"

