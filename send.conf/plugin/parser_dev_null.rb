module Fluent
  class TextParser
    ## Name of parser plugin
    class DevNullParser < Parser
      Plugin.register_parser('dev_null', self)
      def initialize
        super
      end
      def configure(conf={})
        super
        #p conf
      end
      def parse(text)
        yield Engine.now, {a: 1, b:2, c: text}
      end
    end
  end
end
