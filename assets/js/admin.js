$(document).ready(function(){

    if(window.history.replaceState){
		window.history.replaceState(null,null,window.location.href);
	}
    
    // Error function 

        function addError(error){
            let errorList = $('.error');
            errorList.innerHTML = "" ;
            error.forEach((error) => {
                let li= document.createElement('li');
                li.textContent=error;
                errorList.append(li);               
            });
        }


    // CATEGORY

        // ADD
        $('#categoryButton').on('click',function(){
            $("#categoryAddForm").trigger('reset');
            $('.error').text('');
            $('#categTitle').text('Add Category');
            $('#categAddBtn').show();
            $('#categEditBtn').hide();
        })

        $('#categAddBtn').on('click',function(event){
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
                            let data = JSON.parse(response);
                            if(data === "Success")  {
                                $('#categoryAddModal').modal('hide');
                                location.reload();
                            }
                            else{
                                addError(data);
                            }                     
                } ,
                error : function () {
                    console.log("Request failed") ;
                }

            })
        });

        // EDIT

        let categoryId ; 
        $('.categoryEditBtn').on('click',function(event){   
            event.preventDefault();
            $("#categoryAddForm").trigger('reset');
            $('.error').text('');
            $('#categTitle').text('Edit Category');
            $('#categAddBtn').hide();
            $('#categEditBtn').show();

            categoryId = $(this).data('id');   
            let formData = new FormData();           
            formData.append('categoryId',categoryId);
            $.ajax({
                url : "../../controller/category.cfc?method=getCategory",
                method : 'POST',
                data : formData ,
                processData : false,
                contentType : false ,
                success : function (response) {
                            let data = JSON.parse(response);
                            $('#categName').val(data.fldCategoryName);
                },
                error: function (){
                    console.log("Request failed");
                }       
            })
        })

        $('#categEditBtn').on('click',function(){
            
            let formData = new FormData();
            let categoryName = $('#categName').val();            
            formData.append('categName',categoryName);
            formData.append('categoryId',categoryId) ;
            $.ajax({
                    
                    url : "../../controller/category.cfc?method=validateCategName" ,
                    method : 'POST' ,
                    data : formData,
                    processData : false,
                    contentType : false,
                    success : function(response){
                                let data = JSON.parse(response);
                                if(data === "Success"){
                                    $('#categoryAddModal').modal('hide');
                                    location.reload();                                   
                                }
                                else{
                                    addError(data);
                                }
                    },
                    error : function(){
                        console.log("Request failed");
                    }

            })
             
         })

         //DELETE
         $('.categoryDeleteBtn').on('click',function(){
            categoryId = $(this).data('id');
         })

         $('#categoryDeleteBtn').on('click',function(){
            let formData = new FormData();
            formData.append('categoryId',categoryId);
            $.ajax({
                url : "../../controller/category.cfc?method=categoryDelete",
                method : 'POST',
                data : formData,
                processData : false,
                contentType : false,
                success : function (response){
                            let data = JSON.parse(response);
                            if(data === "Success"){
                                $('#categoryDeleteModal').modal('hide');
                                location.reload();                                
                            }
                },
                error : function (){
                    console.log("Request Failed");
                }



            })
         });

    //SUB CATEGORY

         //ADD
    $('#subCategoryButton').on('click',function(){
        $("#categoryAddForm").trigger('reset');
        $('.error').text('');
        $('#categTitle').text('Add SubCategory');
        $('#subCategAddBtn').show();
        $('#subCategEditBtn').hide();
        categoryId = $(this).data('id');
        console.log(categoryId);
    });

    $('#subCategAddBtn').on('click',function(){
        let formData = new FormData();
        let subCategoryName = $('#categName').val(); 
        formData.append('subCategName',subCategoryName);
        formData.append('categoryId',categoryId)
        $.ajax({
            url : "../../controller/category.cfc?method=validateSubCategoryName",
            method : 'POST' ,
            data : formData ,
            processData : false,
            contentType : false,
            success : function(response){
                    let data = JSON.parse(response);
                    if(data === "Success"){

                    }
                    else{
                        addError(data);
                    }
            }
        })
    })
});