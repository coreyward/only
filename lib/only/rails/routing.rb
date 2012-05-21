module ActionDispatch::Routing
  class Mapper
    def only(constraint_name, &block)
      constraints Only.constraints[constraint_name], &block
    end
  end
end
