( function () {

  var reds = {};

  var $require = function ( key ) {

    if ( reds.hasOwnProperty( key ) ) return reds[ key ];

    console.error( '$require "' + key + '" failed', reds );

  }

  var $define = function ( key, val ) {

    if ( reds.hasOwnProperty( key ) ) console.error( 'module with key "' + key + '" already exists', reds );

    if ( typeof val == 'function' ) val = val();

    reds[ key ] = val;

  }

  window.$require = $require;
  window.$requires = $require;
  window.$define = $define;
  window.$defines = $define;

} )()
