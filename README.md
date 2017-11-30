# Jekyll::Livereload

[![Gem Version](https://badge.fury.io/rb/jekyll-livereload.svg)](https://badge.fury.io/rb/jekyll-livereload)

Adds Livereloading support to Jekyll. For more information, see http://livereload.com/.

## Installation

Add this line to your site's Gemfile in the Jekyll Plugin Group:

```ruby
group :jekyll_plugins do
    gem 'jekyll-livereload'
end
```

And then execute:

```bash
bundle
```

## Usage

This plugin was designed to work with both 3.0.5 and 3.1.3 of Jekyll.

To enable Livereload support you need to add an addition command line switch to the
`jekyll serve` command: `--livereload`.

If you call `jekyll serve --help` for all supported serve options, you will notice
that two new options have been added.

```bash
-L, --livereload   Inject Livereload.js and run a WebSocket Server
-R, --reload_port [PORT]  Port to serve Livereload on
```

These options have been added by this plugin.

## Making Livereload the default

Jekyll::Livereload supports readings configuration values from your local `_config.yml`
file. If you always what to use Livereload, and why wouldn't you, you can add it somewhere
in your config file like so:

```yaml
# Server Config options
livereload: true     # You no longer need to include --livereload
reload_port: 5678    # If you don't want to use the default port
```

## HTTPS Support

Jekyll 3.1+ added support for running the `server` command with HTTPS support.
If you include the command line switches `--ssl-cert` and `--ssl-key` to point to
a PEM based Certificate and Key file, then both Jekyll's WebBrick instance and the
Livereload Websocket instance will be started with HTTPS enabled.

If you use a self-signed certificate, then you will probably have errors unless
you tell your browser to **trust** this certificate for both instances.

You will need to visit both the Jekyll serve address and the Livereload address
in your browser and tell them to allow the connection. This works fine with Chrome.

For Safari you will need to click **Show Certificate** and then click the checkbox
**Always trust "<certificate name>" when connecting to "127.0.0.1"**
Where <certificate name> is what you entered when creating the certificate.

Not tested with other browsers, I assume the process is similar to one of the above.

## Caveats

This plugin is dependent on the way Jekyll loads plugins.
Jekyll will load anything in the `Gemfile` plugin group immediately after it
includes `jekyll` and `mercenary`, both of which need to be modified before
Jekyll initializes it's command line options.

If you attempt to use this plugin by installing it in the `_plugin` directory
or by adding it to your `_config.yml` file, it will not work.

This plugin will break if Jekyll upstream ever changes the placement of the call
`Jekyll::PluginManager.require_from_bundler` in it's `binary` command `jekyll` to
be after the initialization it's command line options.

This is the reason this plugin only works if you include it in the `Gemfile`

## Thanks

A big thanks to [Alex Wood](https://github.com/awood)! This plugin was
inspired by his [Hawkins](https://github.com/awood/hawkins) plugin for Jekyll.
The reason I made this plugin was because his method did not work with the
Github-Pages Gem version of Jekyll, which still used version 3.0.5 at the time
of writing. His websocket server is used with very little modification and
credit is given.

Also thanks to the [Livereload Team](https://github.com/livereload), a copy of
their awesome open source livereload.js is included with this plugin.
