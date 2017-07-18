require 'json'
require_relative 'configuration'

# Register Hooks, if livereload is enabled
module Jekyll
  module Livereload
    module Build
      include Livereload::Configuration

      def process(opts)
        opts = load_config_options(opts)
        if opts['livereload'] and opts['serving']

          Jekyll::Hooks.register(:site, :post_render) do |site|
            regenerator = Jekyll::Regenerator.new(site)
            Livereload.pages = site.pages.select do |p|
              regenerator.regenerate?(p)
            end
          end

          Jekyll::Hooks.register([:pages, :documents], :post_render) do |doc|
            # Insert the reload_script before </head> and attempt to indent correctly
            doc.output.sub!(%r{(\s*)(?=</head>)},   "\n\\1  #{reload_script(opts)}\\1")
          end

          Jekyll::Hooks.register :site, :post_write do
            Livereload.reactor.reload() unless Livereload.reactor.nil?
          end
        end

        super opts
      end

      private
      def reload_script(opts)
        protocol = opts[:secure] ? "https" : "http"
        "<script src=\"#{protocol}://#{opts['host']}:#{opts['reload_port']}/livereload.js\"></script>"
      end

    end
  end
end
