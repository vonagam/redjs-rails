//= require redjs-rails
//= require assert

assert( $require( 'require/defined' ), 34 );
assert( $require( 'require/undefined' ), undefined );
assert_error( function () { $require( 'require/not_red' ) } );
