$('document').ready(function(){
  show_teach_dialog();
});

function show_teach_dialog(){
	$(".close pull-left").click(function(){
		alert("delete clicked");
		//$('#teachModalBody').append("<p>Do you really want to delete"+$("#delete_teaching").attr('data-course-title')+"?</p>");
		$("#teachModal").modal('toggle');
	});
}