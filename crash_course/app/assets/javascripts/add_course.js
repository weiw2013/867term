$('document').ready(function(){
  init_event();
  update_day();
  submit_course();
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
	$("#month").click(function(){
		update_day_select();
	});
	$("#year").click(function(){
		update_day_select();
	});
}

function update_day_select(){
	var selected_month= $('#month :selected').text();
		var selected_year= $('#year :selected').text();
		var lastDay = (new Date(selected_year, selected_month, 0)).getUTCDate();
	
		$("#day").children().remove();
		for(var i = 1; i <= lastDay; i++){
			$("#day").append("<option>"+i+"</option>");
		}

}

function submit_course(){
	$('#submit').click(function(){
		var topic  = $("#topic :selected").text();
		var title = $("#title").val();		
		var length = $("#hour :selected").text()+' hr '+ $("#minute :selected").text() + ' min';
		var seats = $("#seats").val();
		var price = $("#price").val();
		var date_time = $('#day :selected').text()+'/'+$('#month :selected').text()+'/'+$('#year :selected').text()+ ' '+$('#time-hr :selected').text()+':'+$('#time-min :selected').text();
		var description = $('#description').val().replace(/\n/g, '<br />');
		var path="/image";
		post_course(topic, title, date_time,length,seats,description,price,path);
	});
}
function post_course(topic, title, date_time,length,seats,description,price,path){	
	 alert(topic+','+ title+','+ date_time+','+length+','+seats+','+description+','+price+','+path);
	 $.ajax({
        type: 'POST',
        beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        url: '/submit_course',
        data: {'title': title ,'description':description,'start_time':date_time,'length':length,'price':price,'attachment_path':path, 'topic':topic,'seats':seats},
        fail: function(){
            alert('failed');
        },
        complete:function(){
        	//$("#last").empty();
        	//get_appointments();
        	//alert('success');
        },
        
    });
}
