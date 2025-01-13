<cfif structKeyExists(url,'categId')>
    <cfset variables.getCategoryById = application.cateContObj.getCategory(

                                                                            categoryId = url.categId

                                                                        )

    >
    <cfset variables.getAllSubCategory = application.cateContObj.getSubCategory(
                                                                                    categoryId = url.categId
                                                                            )
    >
    <cfdump var = "#variables.getAllSubCategory#" >
</cfif>

<!DOCTYPE html>
<html lang = "en">
  <head>
    <meta charset = "UTF-8" />
    <meta name = "viewport" content= "width = device-width, initial-scale = 1.0" />
    <title>ShopEasy</title>
    <link rel = "stylesheet" href = "../../assets/css/style.css" />
    <link rel = "stylesheet" href = "../../assets/css/bootstrap.css" />
  </head>
  <body>

    <!-- Header -->
    <section class = "header-section">
      <header class = "header">
        <div class = "container">
          <div class = "header-content">
            <div class = "brand-name">ShopEasy</div>
            <div></div>
          </div>
        </div>
      </header>
    </section>

    <section class = "category-section">
      <div class = "container category-container">
        <div class = "card">
          <div class = "card-head">
            <div class = "cardhead-content">
                <span class = "category-head">
                    <cfoutput>#variables.getAllSubCategory.fldSubCategoryName#</cfoutput>
                </span>
                <span>
                    <button type="button" class="category-btn" data-bs-toggle="modal" 
                              data-bs-target="#subCategoryAddEditModal" id = "subCategoryButton"
                              data-id = "<cfoutput>#url.categId#</cfoutput>"
                    >
                        +  
                    </button>
                </span> 
            </div>
          </div>
          <div class = "card-body">
            <table class="table">
              <tbody>
                <cfif structKeyExists(variables, "getAllSubCategory")>
                  <cfoutput query = "variables.getAllSubCategory">
                    <cfset encryptedId = encrypt(
                                            variables.getAllSubCategory.fldSubCategory_ID,
                                            application.encryptionKey,
                                            "AES",
                                            "Hex"
                                          )
                    >
                    <tr class = "table-danger">
                      <td>#variables.getAllSubCategory.fldSubCategoryName#</td>
                      <td>
                        <button type = "button" 
                                  class = "categ-alt-btn subCategoryEditBtn"
                                  data-bs-toggle = "modal"
                                  data-bs-target = "##subCategoryAddEditModal"
                                  data-id = "#encryptedId#"
                        >
                          EDIT
                        </button>
                      </td>
                      <td>
                        <button type = "button"
                                class = "categ-alt-btn categoryDeleteBtn"
                                data-bs-toggle = "modal"
                                data-bs-target = "##categoryDeleteModal"
                                data-id = "#encryptedId#"
                        >
                          DELETE
                        </button>
                      </td>
                      <td>
                        <button type = "button"
                                class = "categ-subCateg-btn"
                                data-id = "#encryptedId#"
                                onclick = 
                                "window.location.href = 'adminCategory.cfm?categId=#encryptedId#' "
                        >       
                          SUB 
                        </button>             
                      </td>
                    </tr>   
                  </cfoutput>                 

                </cfif>

              </tbody>
            </table>           
          </div>
        </div>
      </div>
    </section>

    <!--Sub Category Add Edit Modal -->
    <div class="modal fade" id="subCategoryAddEditModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header categAddModalHead">
            <h5 class="modal-title" id = "categTitle">Add SubCategory</h5>
          </div>
          <div class="modal-body">
            <form action = "" class = "categAddForm" method = "post" id = "categoryAddForm">
              <div class = "row mb-3">
                <div class = "col">
                  <label for = "categName" class = "form-label">Enter Subcategory Name </label>
                  <input type = "text" class = "form-control" id = "categName" name = "categName"
                    placeholder = "Enter the subcategory name you want to add"
                  >
                </div>
              </div>
              <div class = "row mb-3 ">
                <div class = "col categ-add-btns">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="button" class="btn btn-primary" name = "categSubmit" id = "subCategAddBtn">Add SubCategory</button>
                  <button type="button" class="btn btn-primary" name = "categSubmit" id = "subCategEditBtn">Edit SubCategory</button>
                </div>
              </div>  
              <div class = "row mb-3 ">
                <div class = "error">

                </div>
              </div>  
                      
            </form>
          </div>       
        </div>
      </div>
    </div>
    <!-- Category Add Edit Modal -->
    <div class="modal fade" id="categoryDeleteModal" tabindex="-1" aria-labelledby="categoryDeleteModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header categDeleteModalHead">
            <h5 class="modal-title" id = "categTitle">Delete Category</h5>
          </div>
          <div class="modal-body">
            Do you want to delete this category ?
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" id = "categoryDeleteBtn">Delete Category</button>
          </div>      
        </div>
      </div>
    </div>

    <script src = "../../assets/js/bootstrap.bundle.js"></script>
    <script src = "../../assets/js/jquery-3.7.1.min.js"></script>
    <script src = "../../assets/js/admin.js"></script>
  </body>
</html>