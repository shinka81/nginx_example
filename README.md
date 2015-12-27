## nginx_example
[![Build Status](https://travis-ci.org/shinka81/nginx_example.svg?branch=master)](https://travis-ci.org/shinka81/nginx_example)

## Description
A simple Chef cookbook to deploy an example web page using nginx. Nginx will be listening on port 8000 by default.

## Cookbook attributes
|Key|Type|Description|Default|
|---|----|-----------|-------|
| default['nginx_example']['nginx']['port'] | Integer | What port nginx will listen on. | 8000 |
| default['nginx_example']['remote_files']['www'] | Hash | Contains 1 or more hashes of remote web pages that will be downloaded and loaded with nginx. A valid hash must contain the following keys: 'uri', 'path', and 'file_name'.| 'example' (see below) |

Example hash structure:
```
default['nginx_example']['remote_files']['www']['example']['uri'] = 'https://raw.githubusercontent.com/puppetlabs/exercise-webpage/master/index.html'
default['nginx_example']['remote_files']['www']['example']['path'] = '/'
default['nginx_example']['remote_files']['www']['example']['file_name'] = 'example.html'
```

## Cookbook Dependencies

* [yum]

## Requirements

* Chef 12+

### Platform(s)

* Tested on Centos 6.5 . Should also work on RHEL or Fedora with similar versions.

## Usage

Apply the default recipe to the run list.

## Testing

This cookbook uses [berkshelf], [test-kitchen], and [vagrant] to perform integration test.
This cookbook also uses [chefspec] to perform unit tests. [rubocop] and [foodcritic] are used to perform linting tests.

To perform integration tests, install testing dependencies and run the automated tests. Execute:

```
bundle install
berks install
kitchen test
```

To perform unit tests, install testing dependencies and run the automated tests. Execute:
```
bundle install --without kitchen
bundle exec rake
```
Information on the latest build can also be found by clicking the [travis-ci] badge near the top of this README.

[berkshelf]: http://berkshelf.com/
[test-kitchen]: http://kitchen.ci/
[vagrant]: https://www.vagrantup.com/
[yum]: https://github.com/chef-cookbooks/yum
[rubocop]: http://batsov.com/rubocop/
[foodcritic]: http://www.foodcritic.io/
[chefspec]: https://github.com/sethvargo/chefspec
[travis-ci]: https://travis-ci.org/
