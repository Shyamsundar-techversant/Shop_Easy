$(document).ready(function(){

    if(window.history.replaceState){
		window.history.replaceState(null,null,window.location.href);
	}
    
    // Error function 

        function addError(error){
            let errorList = $('#addCategError');
            errorList.innerHTML = "" ;
            error.forEach((error) => {
                let li= document.createElement('li');
                li.textContent=error;
                errorList.append(li);               
            });
        }


    // CATEGORY

        $('#categoryButton').on('click',function(){
            $("#categoryAddForm").trigger('reset');
            $('#addCategError').text('');
        })

        // ADD
        $('#categAddBtn').on('click',function(event){
            event.preventDefault();
            let formData = new FormData();
            let categoryName = $('#categName').val();            
            formData.append('categName',categoryName);
            
            $.ajax({
                url : '../../controller/category.cfc?method=validateCategName',
                type : 'POST' ,
                data : formData ,
                processData : false ,
                contentType : false ,
                success : function (response) {
                            console.log(response);
                            let data = JSON.parse(response);
                            if(data === "Success")  {
                                $('#categoryAddModal').modal('hide');
                            }
                            else{
                                console.log(data);
                                addError(data);
                            }                     
                } ,
                error : function () {
                    console.log("Request failed") ;
                }

            })
        });

});