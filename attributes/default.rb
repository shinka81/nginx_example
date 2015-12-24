# List uri, nginx path, and file name(s). Hash is looped over to land down 1 or more pages.
default['nginx_example']['remote_files']['www']['example']['uri'] = 'https://raw.githubusercontent.com/puppetlabs/exercise-webpage/master/index.html'
default['nginx_example']['remote_files']['www']['example']['path'] = '/'
default['nginx_example']['remote_files']['www']['example']['name'] = 'example.html'
# Port nginx will listen on.
default['nginx_example']['nginx']['port'] = 8000
