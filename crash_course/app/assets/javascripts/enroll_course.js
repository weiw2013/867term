$('document').ready(function(){
  add_enrollment();
});

function add_enrollment(){	
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
