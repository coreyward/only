require 'only/base_constraint'
require 'only/rails/routing.rb'

module Only
  class << self
    def constraints
      @constraints ||= {}
    end
    
    # Options:
    #   :prefix
    #   :suffix
    def allow(options = {})
      prefix = options.delete :prefix
      suffix = options.delete :suffix
      
      # Extract the param attribute name and collection to match against
      attribute_name, collection = options.first
      
      # This is the name used for the DSL
      name = attribute_name.to_s.pluralize
      name = :"#{prefix}_#{name}" if prefix
      name = :"#{name}_#{suffix}" if suffix
          
      define(name) { collection.include? params[attribute_name] }
    end
    
    def define(name, &match_proc)
      constraints[name] = Class.new(BaseConstraint)
      constraints[name].define_singleton_method :condition_matches?, match_proc
    end
  end
end
