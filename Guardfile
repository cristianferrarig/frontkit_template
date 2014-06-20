# A sample Guardfile
# More info at https://github.com/guard/guard#readme
require 'guard'
require 'guard/guard'
require 'guard/watcher'
require 'guard/plugin'

module ::Guard

  class Hologram < ::Guard::Plugin
    def start
      run_all if options[:all_on_start]
    end
    def run_all
      run_on_additions(Watcher.match_files(self, Dir.glob('{,**/}*{,.*}').uniq))
    end
    def run_on_additions(res)
      puts res if res
    end
  end

  class Dsl
    # Easy method to display a notification
    def n(msg, title='', image=nil)
      Notifier.notify(msg, :title => title, :image => image)
    end
  end

end

guard 'hologram' do
  watch(%r{^components/app/assets/.+\.*}) { `bundle exec hologram hologram.yml` }
  watch(%r{^components/temp/.+\.*})       { `bundle exec thor hologram:update`  }
end
