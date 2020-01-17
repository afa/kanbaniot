/*
 * = require jquery
 * = require_self
*/

$(document).ready(function() {
  EASY.schedule.require(function(data) {  
    var template = $('#fields_template').html();
    $.each (data, function (issue) {
      var html = Mustache.to_html(template, data[issue]);
      $(".item_" + data[issue].id + " .issue").append(html);
    });
  }, 
  function() {
    var kanbans = window.easyModel.kanbans;
    if(kanbans && kanbans["#kanban-placeholder"]) {
      var data = kanbans["#kanban-placeholder"].kanbanRoot.issues.map;
      var flg = false;
      $.each (data, function (issue) {
        if ($(".item_" + data[issue].id).size() > 0) {
          flg = true;
        };
      });
      if (flg) {
        return data;
      };
    };
    return;
  });
});
