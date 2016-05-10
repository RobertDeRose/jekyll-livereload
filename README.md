# Jekyll::Livereload

[![Gem Version](https://badge.fury.io/rb/jekyll-livereload.svg)](https://badge.fury.io/rb/jekyll-livereload)

Adds Livereloading support to Jekyll

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
file. If you always what to use Livereload, and why wouldn't you, you can add it to 
your config like so:

```yaml
# Server Config optiosn
livereload: true    # You no longer need to include --livereload
reload_port: 5678    # If you don't want to use the default port
```

## Caveats

This plugin is dependent on the way Jekyll loads plugins.
Jekyll will load anything in the `Gemfile` plugin group immediately after it
includes `jekyll` and `mercenary`, both of which need to be modified before
Jekyll initializes it's command line options.

If you attempt to use this plugin by installing it in the `_plugin` directory
or by adding it to your `_config.yml` file, it will not work.

This plugin will break if Jekyll upstream every changes the placement of the call
`Jekyll::PluginManager.require_from_bundler` in it's `binary` command `jekyll` to
be after the initialization it's command line options.

This is the reason this plugin only works if you include it in the `Gemfile`

## Thanks

A big thanks to [Alex Wood](https://github.com/awood)! This plugin was
inspired by his [Hawkins](https://github.com/awood/hawkins) plugin for Jekyll.
The reason I made this plugin was because his method did not work with the
Github-Pages Gem version of Jekyll, which still uses version 3.0.5.
His websocket server was used with very little modification and credit given.

Also thanks to the [Livereload Team](https://github.com/livereload), a copy of
their awesome opensource livereload.js is included with this plugin.
