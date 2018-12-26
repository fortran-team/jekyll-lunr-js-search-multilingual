require 'rake'
require 'uglifier'
require 'fileutils'
require 'os'

task :default => :build

desc "Ensures all dependent JS libraries are installed and builds the gem."
task :build_gem => :build do
    exec("gem build jekyll-lunr-js-search.gemspec")
end

task :build => [
    :bower_update,
    :create_build_dir,
    :concat_js,
    :minify_js]

task :bower_update do
    dev_null = OS.windows? ? 'NUL' : '/dev/null'
    if system('bower --version > ' + dev_null)
        system('rm -rf bower_components')
        system('bower install')
    else
        abort "Please ensure bower is installed: npm install -g bower"
    end
end

task :create_build_dir do
    Dir.mkdir('build') unless Dir.exists?('build')
end

task :concat_js do
    files = [
        'bower_components/jquery/dist/jquery.js',
        'bower_components/mustache/mustache.js',
        'bower_components/date.format/date.format.js',
        'bower_components/uri.js/src/URI.js',
        'bower_components/lunr.js-multilingual/lunr.min.js',
        'js/jquery.lunr.search.js'
    ]

    File.open('build/search.js', 'w') do |file|
        file.write(files.inject('') {|data, file|
            data << File.read(file)
        })
    end

    # Lunr is stored separately so we can use it for index generation
    FileUtils.cp('bower_components/lunr.js-multilingual/lunr.min.js', 'build/lunr.min.js')
end

task :minify_js do
    minified, map = Uglifier.new.compile(File.read('build/search.js'))
    File.open('build/search.min.js', 'w') do |file|
        file.puts minified
    end
end

task :minify_js_map do
    minified, map = Uglifier.new.compile_with_map(File.read('build/search.js'))
    File.open('build/search.js.map', 'w') {|file| file.write(map)}
    File.open('build/search.min.js', 'w') do |file|
        file.puts minified
        file.write "//# sourceMappingURL=search.js.map"
    end
end