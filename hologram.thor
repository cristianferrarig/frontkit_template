require 'digest'
#require 'middleman-core'

# http://textmate.rubyforge.org/thor/Thor/Actions.html#M000061

class Hologram < Thor
  include Thor::Actions
  #include Middleman::Application

  desc "example", "an example task"
  method_option :name, :aliases => "-n", :desc => "Theme name"

  def self.source_root
    File.dirname(__FILE__)
  end

  def builder
    config_file_time = Time.new
    config_file_name = Digest::MD5.new
    config_file_name.update config_file_time.to_s
    config_file_path = "tmp/hologram_config_#{config_file_name}.yml"

    source_assets = "asd"
    docs_folder   = "./docs"
    docs_assets   = "./docs/partials"

    create_file config_file_path do
      "source: #{source_assets}
      \ndestination: #{docs_folder}
      \ndocumentation_assets: #{docs_assets}"
    end

    puts "Hologram initialized :)"

    remove_file config_file_path

  end

end
