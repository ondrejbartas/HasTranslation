module HasTranslation

  def self.included(base) 
    base.send :extend, ClassMethods 
  end
   
  module ClassMethods
    def has_translation name, options = {}
       include InstanceMethods

       write_inheritable_attribute(:translation_definitions, {}) if translation_definitions.nil?
       
       define_method name do |*args|
         a = translation_for(name)
         (args.length > 0) ? a.to_s(args.first) : a
       end

       define_method "#{name}=" do |text|
         translation_for(name).assign(text)
       end

       define_method "#{name}?" do
         get_existence_of_translation(name)
       end

       define_method "#{name}" do
         get_translation_for(name)
       end

       define_method "#{name}.delete" do
         translation_for(name).delete
       end


     end

      def translation_definitions
         read_inheritable_attribute(:translation_definitions)
      end
   end

   module InstanceMethods #:nodoc:      
     def instance_read(name,attr)
       getter = :"#{name}_#{attr}"
       responds = self.respond_to?(getter)
       cached = self.instance_variable_get("@_#{getter}")
       return cached if cached
       self.send(getter) 
     end

     def get_translation_for name
       "ahoj"+Translation.new(name, self ,self.class.translation_definitions[name]).to_s
     end

     def get_existence_of_translation name
       return !instance_read(name,"translation").nil? && instance_read(name,"translation").length > 0
     end

     def translation_for name
       @_translations ||= {}
       @_translations[name] ||= Translation.new(name, self, self.class.translation_definitions[name])
     end
  end
end

ActiveRecord::Base.send :include, HasTranslation