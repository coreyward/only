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
end
