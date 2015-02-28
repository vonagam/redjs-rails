( function ( context ) {

  var reds = {};
  
  var $require = function ( key ) {

    if ( reds.hasOwnProperty( key ) ) return reds[ key ];

    throw new Error( '$require "' + key + '" failed' );

  }

  var $define = function ( key, val, force ) {

    if ( reds.hasOwnProperty( key ) && ! force ) throw new Error( 'module with key "' + key + '" already exists' );

    if ( typeof val == 'function' ) val = val();

    reds[ key ] = val;

  }

  context.$require = $require;
  context.$requires = $require;
  context.$define = $define;
  context.$defines = $define;

} )( this );
