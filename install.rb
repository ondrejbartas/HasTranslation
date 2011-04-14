# Install hook code here
puts "Copying files..."
dir = "config/initializers"
["has_translation.rb"].each do |yml_file|
	dest_file = File.join(RAILS_ROOT, dir, yml_file)
	src_file = File.join(File.dirname(__FILE__) , 'lib', dir, yml_file)
	FileUtils.cp_r(src_file, dest_file)
	puts "#{src_file} -> #{dest_file}"
end
dir = "stylesheets"
["has_translation.css"].each do |file|
	dest_file = File.join(RAILS_ROOT, 'public', dir, file)
	src_file = File.join(File.dirname(__FILE__) , dir, file)
	FileUtils.cp_r(src_file, dest_file)
	puts "#{src_file} -> #{dest_file}"
end
puts "Files copied"

puts "Please change config file: "+File.join(RAILS_ROOT, dir, "has_translation.yml")
