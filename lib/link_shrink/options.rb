module LinkShrink
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # Inherits from Hash to add predicate methods
  class Options < Hash
    def initialize(*args)
      super(*args)
      self.merge!(self.default)
    end

    # Dynamically defines three predicate methods
    # @return [Trueclass] return true or false if no key found
    [:qr_code, :json, :image_size].map do |method|
      define_method "#{method}?" do
        self.fetch(method, false)
      end
    end
  end
end
