module Jekyll
  module Livereload
    module Configuration
      private
      def load_config_options(opts)
        opts = configuration_from_options(opts)
        opts['host'] = 'localhost' unless opts.key?('host')
        opts['reload_port'] = Livereload::LIVERELOAD_PORT unless opts.key?('reload_port')
        return opts
      end
    end
  end
end
