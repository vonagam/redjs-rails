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
Add the '.red' extension after '.js' for files that will be using the Redjs dependecy manager.  
In those files four functions will be available.

#### $require( path_to_file )
Return a value associated with the file.  
Will add the specified file to required ones, identical to the sprockets '//= require' directive.  
Path to file can't be a variable, it must be a string.  
Can be relative.

#### $requires( path_to_file )
Return a value associated with the file.  
Without issuing a sprockets directive.  
You must ensure inclusion of required file yourself.  
Path can be varialbe.

#### $define( value )
Assotiate the value with a file.  
If the value is a function, its execution result will be assotiated.

#### $defines( key, value )
Assotiate the value with the key.

### Example

~~~js
// app/assets/javascripts/some/folder/a.js.red

$define( 34 );
~~~

~~~js
// app/assets/javascripts/other/folder/b.js.red

expect( $require( 'some/folder/a' ) ).to.equal( 34 );
~~~

## How It Works

### Preprocessor
It searches for '$require' and '$define' directives.  
For '$require' - add the specified pathname to required assets.  
For '$define' - insert a file pathname as the first argument.  
If there is no '$define' in a file, then it appends '$define({ pathname }, 0)' to the end.

### JS side
Nothing fancy to see there.  
Pretty dumb.  
Because required assets are included first, there is no need for asynchronous loading or fancy things like that.  
If you need them for some reason, you can just write your implementation and replace 'redjs-rails' in your js manifest.
