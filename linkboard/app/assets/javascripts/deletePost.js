$(document).ready(function(){
	$("body").on("click", "delete_btn", function(e){
		e.preventDefault();
		var link = $(this);
		$.ajax(link.attr("href"), {
			method: "DELETE"
		}).done(function(data){
			console.log("done");
			console.log(data);
		});
	})
});