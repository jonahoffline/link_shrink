module LinkShrink
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # Provides utility methods
  module Util
    module_function

    # Returns list of Url Shrinkers
    # @return [Array<String>] Url shrinker classes
    def available_shrinkers
      LinkShrink::Shrinkers.constants - [:Base]
    end
  end
end
