# redjs-rails

## Installation

Add 'redjs-rails' to a gemfile
~~~ruby
gem 'redjs-rails'
~~~

Require 'redjs-rails' in a javascript manifest before any .red file
~~~js
//= require redjs-rails
~~~

## Usage
Add the '.red' extension after '.js' for files that will be using ??? Redjs dependecy manager.  
In those files four functions will be available.

#### $require( path_to_file )
Identical to sprockets '//= require' directive, but additionally will return value associated with specified file.  
Path to file can't be a variable, it must be string.  
Can be relative.

#### $define( value )
Assotiate the value with a file.  
If the value is a function, it execution result will be assotiated.

#### $requires( path_to_file )
Get a value associated with a file, without issuing a sprockets directive.  
You must ensure inclusion of required file yourself.  
Path can be varialbe.

#### $defines( key, value )
Assotiate the value with the key.

## How It Work

### Preprocessor
It search for '$require' and '$define' directive.  
For '$require' - add specified pathname to required assets.  
For '$define' - insert a file pathname as first argument.  
If there is no '$define' in file, then append '$define({ pathname }, 0)' to the end.

### JS side
Nothing fancy to see there.  
Pretty dumb.  
Because required assets included first, there is no need for asynchronous loading or fancy things like that.  
If you need them for some reason, you can just write your implementation, without including 'redjs-rails' in your js manifest.
