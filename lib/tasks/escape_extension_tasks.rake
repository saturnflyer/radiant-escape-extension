namespace :radiant do
  namespace :extensions do
    namespace :escape do
      
      desc "Runs the migration of the Escape extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          EscapeExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          EscapeExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Escape to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from EscapeExtension"
        Dir[EscapeExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(EscapeExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
