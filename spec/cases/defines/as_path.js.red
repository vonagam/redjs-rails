$defines( 'defines/as_path', 'yep' );

assert_error( function () { $define( 'nope' ); } );
