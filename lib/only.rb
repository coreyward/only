module Only
  class BaseConstraint
    class << self
      attr_accessor :request
      
      def matches?(request)
        self.request = request
        condition_matches?
      end
      
      # Get the domain name from the request URL
      def requested_domain
        %r{//([^/]+)}.match(request.url)[1]
      end
      
      def params(attribute = nil)
        attribute ? request.params[attribute] : request.params
      end
    end
  private
    def new; end
  end
  
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

module ActionDispatch::Routing
  class Mapper
    def only(constraint_name, &block)
      constraints Only.constraints[constraint_name], &block
    end
  end
end
