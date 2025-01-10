<cfif structKeyExists(form, "categSubmit")>
  <cfdump var = "#form#">
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
            <div class = "sign-buttons">
              <button class = "reg-btn btn" onclick = "window.location.href = 'log.cfm' ">LogOut</button>
            </div>
          </div>
        </div>
      </header>
    </section>

    <section class = "category-section">
      <div class = "container category-container">
        <div class = "card">
          <div class = "card-head">
            <div class = "cardhead-content">
              <span class = "category-head">Categories</span>
              <span>
                <button type="button" class="category-btn" data-bs-toggle="modal" data-bs-target="#categoryAddModal">
                  +  
                </button>
              </span> 
            </div>
          </div>
          <div class = "card-body">
            <table class="table">
              <tbody>
                <tr>
                  <th scope="row">1</th>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                </tr>
                <tr>
                  <th scope="row">2</th>
                  <td>Jacob</td>
                  <td>Thornton</td>
                  <td>@fat</td>
                </tr>
                <tr>
                  <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                </tr>
              </tbody>
            </table>           
          </div>
        </div>
      </div>
    </section>

    <!-- Category Add Modal -->
    <div class="modal fade" id="categoryAddModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header categAddModalHead">
            <h5 class="modal-title" >Add Category</h5>
          </div>
          <div class="modal-body">
            <form action = "" class = "categAddForm" method = "post">
              <div class = "row mb-3">
                <div class = "col">
                  <label for = "categName" class = "form-label">Enter category Name </label>
                  <input type = "text" class = "form-control" id = "categName" name = "categName"
                    placeholder = "Enter the category name you want to add"
                  >
                </div>
              </div>
              <div class = "row mb-3 ">
                <div class = "col categ-add-btns">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-primary" name = "categSubmit">Add Category</button>
                </div>
              </div>          
            </form>
          </div>       
        </div>
      </div>
    </div>




   <script src = "../../assets/js/bootstrap.bundle.js"></script>
  </body>
</html>