//= require redjs-rails
//= require assert
//= require ./required

assert( $requires( 'requires/required' ), undefined );
assert_error( function () { $requires( 'requires/not_required' ) } );
