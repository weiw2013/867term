var courses;

$('document').ready(function(){
  get_courses();
});

function render_courses(){	
	var start = "<div class=\"span4\"><ul class=\"thumbnails\"><li class=\"span3\"><a href="
    var mid = " class=\"thumbnail\"><img src=\"#\" alt=\"\" class=\"img-rounded\" ><strong>";
	var end ="</strong></a></li></ul></div>";
	
	if(courses != null){
	   $.each(courses, function (i) {
	   		var one_course = start+"/course/?id="+courses[i].id+mid+courses[i].title+end;
	   		$("#frame").append(one_course);			
		});
	}

}

function get_courses(){
	 $.ajax({
        type: 'GET',
        url: '/get_courses/',
        data: {},
        success: function(data){
           courses = $.parseJSON(data);
        },
        fail: function(){
            alert('failed');
        },
        complete:function(){
        	render_courses();
        },
        dataType: 'text'
    });
}