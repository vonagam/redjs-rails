//= require redjs-sprockets
//= require assert

assert( $require( 'defines/as_path' ), 'yep' );
assert( $require( 'defines/custom' ), 15 );
assert( $requires( 'one' ), 58 );
