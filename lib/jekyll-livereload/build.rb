require 'json'

# Register Hooks, if livereload is enabled
module Jekyll
  module Livereload
    module Build
      def process(opts)
        opts['host'] = 'localhost' unless opts.key?('host')
        opts['reload_port'] = Livereload::LIVERELOAD_PORT unless opts.key?('reload_port')
        if opts['livereload']
          Jekyll::Hooks.register(:site, :post_render) do |site|
            regenerator = Jekyll::Regenerator.new(site)
            Livereload.pages = site.pages.select do |p|
              regenerator.regenerate?(p)
            end
          end
          Jekyll::Hooks.register([:pages, :documents], :post_render) do |doc|
            doc.output.sub!(/<head>(.*)<\/head>/m, "<head>\\1#{reload_script(opts)}</head>")
          end
          Jekyll::Hooks.register :site, :post_write do
            Livereload.reactor.reload() unless Livereload.reactor.nil?
          end
        end

        super opts
      end

      private
      def reload_script(opts)
        "<script src=\"http://#{opts['host']}:#{opts['reload_port']}/livereload.js\"></script>"
      end

    end
  end
end
