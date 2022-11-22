
//jquery price range
$(document).ready(function () {
  $("#slider-3").slider({
    range: true,
    min: 0,
    max: 20,
    values: [1, 10],
    slide: function (event, ui) {
      $("#from").val(ui.values[0]);
      $("#to").val(ui.values[1]);
    }
  });
  $("#from").val( $("#slider-3").slider("values", 0));
  $("#to").val( $("#slider-3").slider("values", 1));
  //
  $("input[name=from]").blur(function(){
    $( "#slider-3" ).slider('values',0,$('input[name=from]').val())
  });
  $("input[name=to]").blur(function(){
    $( "#slider-3" ).slider('values',1,$('input[name=to]').val())
  });
});

//Filter
$(document).ready(function(){
  $(".panel-body .form-group select").click(function(){
    var valueSelect = $(this).find("option:selected").text();
      $(this).siblings(".customSelect").text(valueSelect);
  });
});
