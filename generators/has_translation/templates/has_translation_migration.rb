class <%= migration_name %> < ActiveRecord::Migration
  def self.up
<% translations.each do |translation| -%>
    add_column :<%= class_name.underscore.camelize.tableize %>, :<%= translation %>_translation, :text
<% end -%>
  end

  def self.down
<% translations.each do |translation| -%>
    remove_column :<%= class_name.underscore.camelize.tableize %>, :<%= translation %>_translation
<% end -%>
  end
end
