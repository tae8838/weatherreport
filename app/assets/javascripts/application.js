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

var weather_stations = new Vue({
  el: '#weather_stations',
  data: {
    weather_stations: [{"name":"Melbourne (Olympic Park)",
                        "reading":
                          {"rainfall_amount":"6.0",
                           "temperature":"21.3",
                           "dew_point":"21.3",
                           "wind_speed":"9.0",
                           "wind_direction":"S",
                           "created_at":"2018-01-29 09:10:47",
                           "updated_at":"2018-01-29 09:10:47"}}]
  },
  mounted: function() {
    var that;
    that = this;
    $.ajax({
      type: "GET",
      url: '/weather_stations/test/VIC',
      success: function(res) {
        that.weather_stations = res;
      }
    });
  }
});


var url = new Vue({
  el: '#url',
  methods: {
    changeData: function (event) {
      spinner.loading = 'loading';
      $.ajax({
        type: "GET",
        url: "/weather_stations/test/" + event.srcElement.selectedOptions[0].text,
        success: function(res) {
          weather_stations.weather_stations = res;
          link.link = event.srcElement.value;
          spinner.loading = 'loaded';
        }
      });
    }
  }
})

var link = new Vue({
  el: '#link',
  data: {
    link: "http://www.bom.gov.au/vic/observations/melbourne.shtml"
  }
})

var spinner = new Vue({
  el: '#spinner',
  data: {
    loading: 'loaded'
  }
})
