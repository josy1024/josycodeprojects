

var d = new Date();
// var month = d.getMonth() + 1;
var month = (d.getMonth () < 10 ? '0' + (d.getMonth () + 1) : (d.getMonth () + 1) );

var day = d.getDate();
var year = d.getFullYear();

var h = (d.getHours () < 10 ? '0' + d.getHours () : d.getHours ());
var  m = (d.getMinutes () < 10 ? '0' + d.getMinutes () : d.getMinutes ());
var  s = (d.getSeconds () < 10 ? '0' + d.getSeconds () : d.getSeconds ());

WScript.Echo ( year  + "_" + month + "_" + day  + "_" + h +  "_" +  m + "_" + s );


