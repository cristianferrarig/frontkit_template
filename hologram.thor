#!/usr/bin/env ruby
require 'pry'

#require 'middleman-core'

# http://textmate.rubyforge.org/thor/Thor/Actions.html#M000061

class Hologram < Thor
  include Thor::Actions
  #include Middleman::Application

  # def self.source_root
  #   File.dirname(__FILE__)
  # end

  desc "update", "Put hologram files in middleman"

  def update
    base_path        = "/Users/cristianferrari/Development/cristian/frontkit/components/"
    source_path      = base_path + "temp/"
    destination_path = base_path + "docs/"
    # binding.pry
    Dir.glob(source_path + "*.html").sort.each do |f|
      filename = File.basename(f, File.extname(f))
      File.rename(f, destination_path + filename + File.extname(f) + ".erb")
    end

    remove_file source_path
    #Dir.delete(source_path)
  end

  # TODO: esto no sirve
  desc "init", "Go to components dir and run middleman"

  def init
    puts run('cd components/ && bundle exec middleman server')
  end

end
