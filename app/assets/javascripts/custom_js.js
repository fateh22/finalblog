jQuery(document).ready(function(){

	jQuery("#imageUpload").on('change', function () {

        if (typeof (FileReader) != "undefined") {

            var image_holder = jQuery("#image-holder");
            image_holder.empty();

            var reader = new FileReader();
            reader.onload = function (e) {
                jQuery("<img />", {
                    "src": e.target.result,
                    "class": "featuredimage"
                }).appendTo(image_holder);

            }
            image_holder.show();
            reader.readAsDataURL($(this)[0].files[0]);
        } else {
            alert("This browser does not support FileReader.");
        }
    });
//*
});




/*jQuery(document).ready(function(){
  jQuery(document).on ('keypress','[data-behavior~=room_speaker]',function(event){
    if(event.keyCode == 13) {
        alert(jQuery(this).val());
        App.room.speak.target.value;
        event.target.value='';
        event.preventDefault() 
    }
});
});*/