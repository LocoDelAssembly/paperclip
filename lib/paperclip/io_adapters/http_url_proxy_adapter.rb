module Paperclip
  class HttpUrlProxyAdapter < UriAdapter
    def self.register
      Paperclip.io_adapters.register self do |target|
        String === target && target =~ REGEXP
      end
    end

    REGEXP = /\Ahttps?:\/\//

    def initialize(target, options = {})
      escaped = parser.escape(target)
      super(URI(target == URI::RFC2396_Parser.new.unescape(target) ? escaped : target), options)
    end
  end
end
