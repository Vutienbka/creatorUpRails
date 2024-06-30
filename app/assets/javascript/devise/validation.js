$(document).ready(function(e){

    $('input[type="button"]').click(function(){
        //Validate when submit
        var email_pattern = /\S+@\S+\.\S+/; 
        var flag = true;
        
        $('input[type="email"]').each(function(){
               let email = $(this).val();
               $('div.email').find("span").remove();
               if (email == ""){
                $('div.email').append('<span class="text-danger" >Email not empty required</span>');
               }else if (!email.match(email_pattern)){   
                $('div.email').append('<span class="text-danger" >Invalid email</span>');
               }
           });
    
           var password;
           var pwslen;
           var password_confirmation;
           var pwscflen;
    
           $('input[name="user[password]"]').each(function(){
            password = $(this).val();
            pwslen = password.length;
    
               $('div.password').find("span").remove();
               if (pwslen < 1){
                $('div.password').append('<span class="text-danger">This field is required</span>');
                flag=false
               }else if (pwslen < 6 && pwslen > 0 ){
                $('div.password').append('<span class="text-danger">6 characters minimum</span>');
                flag=false
               }
            });
            var this_value = $(this).val();
         if(this_value == 'Sign up'){
                
            $('input[name="user[password_confirmation]"]').each(function(){
                password_confirmation = $(this).val();
                pwscflen = password_confirmation.length;
    
                $('div.password_confirmation').find("span").remove();
                if (pwscflen < 1 ){
                    $('div.password_confirmation').append('<span class="text-danger">This field is required</span>');
                    flag=false
                   }
                else if (password !== password_confirmation){
                    $('div.password_confirmation').append('<span class="text-danger">This have to be equal to password</span>');
                    flag=false
                }
             });

             $('#user_signup').validate({
				errorPlacement: function(label, element){
                    element = $('.term_condition');
                    //$('div').find('span').remove();
					label.addClass('arrow');
					label.insertAfter(element);
				},
                wrapper: 'div',
				rules: {
					remember_me: {
						required: true
					}
				},
				messages:{
					remember_me: 'This field must be checked'
				},
			});

                if(flag == true){
                  $('#user_signup').submit();
                }
          }else{
                if(flag == true){
                    $('#user_signin').submit();
                  }
            }    
        });
    
});
