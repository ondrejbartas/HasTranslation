class TranslationGenerator < Rails::Generators::NamedBase
  desc "run this generator to add translations for your Class"
  attr_accessor :translations, :migration_name

  def initialize(args, options = {})
    super
    @class_name, @translations = args[0], args[1..-1]
  end

  def manifest
    file_name = generate_file_name
    @migration_name = file_name.camelize
    record do |m|
      m.migration_template "has_translation_migration.rb.erb",
                           File.join('db', 'migrate'),
                           :migration_file_name => file_name
    end
  end

  private

  def generate_file_name
    names = translations.map{|a| a.underscore }
    names = names[0..-2] + ["and", names[-1]] if names.length > 1
    "add_translation_#{names.join("_")}_to_#{@class_name.underscore}"
  end

end
