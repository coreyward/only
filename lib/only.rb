module Only
  class << self
    def constraints
      @constraints ||= {}
    end
    
    def define(name, collection = nil, &block)
      constraints[name] = Class.new
      constraints[name].define_singleton_method :matches?, block
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
