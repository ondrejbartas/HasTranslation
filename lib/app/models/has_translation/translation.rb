module HasTranslation
  class Translation  
    
    def self.default_options
      @default_options ||= {        
        :langs=> [:all]
      }
    end
     
    attr_reader :name, :instance
    def initialize(name, instance, options = {}) #from application CLASS
      @instance = instance
      @name = name
      @data = instance_read("translation")
    end  
    
    def to_s
      @data
    end
    
    def instance_write(attr, value)
      setter = :"#{name}_#{attr}="
      responds = @instance.respond_to?(setter)
      self.instance_variable_set("@_#{setter.to_s.chop}", value)
      @instance.send(setter, value)
    end

    # Reads the attachment-specific attribute on the instance. See instance_write
    # for more details.
    def instance_read(attr)
      getter = :"#{name}_#{attr}"
      responds = @instance.respond_to?(getter)
      cached = self.instance_variable_get("@_#{getter}")
      return cached if cached
      @instance.send(getter) 
    end
    
  end  

end
