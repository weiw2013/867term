$('document').ready(function(){
  init_event();
  update_day();
});

function init_event() {
	for(var i = 0; i < 24; i++){
		$("#time-hr").append("<option>"+i+"</option>");
	}

	for(var i = 0; i < 6; i++){
		$("#time-min").append("<option>"+i+"0</option>");
		$("#minute").append("<option>"+i+"0</option>");
	}
	for(var i = 1; i <= 12; i++){
		$("#month").append("<option>"+i+"</option>");
	}
	var year = new Date().getFullYear();
	for(var i = 0; i < 3; i++){
		$("#year").append("<option>"+year+"</option>");
		year++;
	}
	
}
function update_day(){
	$("#day").click(function(){
		var selected_month= $('#month :selected').text();
		var selected_year= $('#year :selected').text();
		var lastDay = (new Date(selected_year, selected_month, 0)).getUTCDate();
	
		$("#day").children().remove();
		for(var i = 1; i <= lastDay; i++){
			$("#day").append("<option>"+i+"</option>");
		}
	});
}


