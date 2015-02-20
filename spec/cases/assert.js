( function ( context ) {

  context.assert = function ( got, expected ) {

    if ( got !== expected ) throw new Error( 'assert failed: ' + got + ' !== ' + expected );

  }

  context.assert_error = function ( fun ) {

    var throwed = false;

    try {

      fun();

    } catch ( error ) {

      throwed = true;

    }

    if ( ! throwed ) throw new Error( 'assert error failed' );

  }

} )( this );
