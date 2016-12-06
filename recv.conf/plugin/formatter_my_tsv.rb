# myplugin/formatter_tsv.rb
require 'fluent/formatter'
module Fluent
  module TextFormatter
    class TSVFormatter < Formatter
      Plugin.register_formatter('my_tsv', self)

      include Configurable
      include HandleTagAndTimeMixin

      def configure(conf = {})
        super
      end

      def format(tag, time, record)
        #p record
        #p record.values
        ":-) #{tag}\t#{time}\t#{record.values.join("\t")}\n"
      end
    end
  end
end
