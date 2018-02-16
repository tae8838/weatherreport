// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require vue
//= require jquery
//= require jquery_ujs
//= require_tree .

Vue.component('weather_station-row', {
  template: '#weather_station-row',
  props: {
    weather_station: Object
  },
  data: function () {
    return {
      editMode: false,
      errors: {}
    }
  }
})
var weather_stations = new Vue({
  el: '#weather_stations',
  data: {
    weather_stations: [{name: "hi"}]
  },
  mounted: function() {
    var that;
    that = this;
    $.ajax({
      type: "GET",
      url: '/weather_stations/test',
      success: function(res) {
        console.log(res)
        that.weather_stations = res;
      }
    });
  }
});