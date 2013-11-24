var user_teachings;
var user_learnings
$('document').ready(function(){
  get_teachings();
  //get_learnings();
});

function get_teachings(){
	 $.ajax({
        type: 'GET',
        url: '/teachings/',
        data: {},
        success: function(data){
           user_teachings = $.parseJSON(data);
        },
        fail: function(){
            alert('failed');
        },
        complete:function(){
        	render_user_teachings();
        },
        dataType: 'text'
    });
}

function render_user_teachings(){

    if(user_teachings != null){

       $.each(user_teachings, function (i) {
            var row = "<tr><td><a href=/course/?id="+user_teachings[i].user_id+">"+user_teachings[i].title+"</a></td><td>";
            if(user_teaching[i].start_time){

            }
            else{

            }
            $("#teachings").append(row);
        }
    }
    else{
        $("#teachings").append("<tr><td>none</td></tr>");
    }

}


