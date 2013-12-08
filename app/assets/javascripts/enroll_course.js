$('document').ready(function(){
  
  add_enrollment();
});

function add_enrollment(){
    $("#enroll").click(function(){ 
        var course_id = $("legend").attr('id');
        var start_time = $("#time").attr('data-start');
        var length = $("#time").attr('data-length');
        //alert(course_id + ' '+start_time+ ' '+length);   	
        $.ajax({
            type: 'POST',
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            url: '/enroll_course',
            data: {'course_id': course_id,'start_time':start_time,'length':length},
            fail: function(){
                alert('failed');
            },
            success:function(data){
                document.location.href = '/my_course'; 
                
            },
            dataType: 'text'
        });
    });
}
