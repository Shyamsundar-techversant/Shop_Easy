<!DOCTYPE html>
<html lang = "en">
  <head>
    <meta charset = "UTF-8" />
    <meta name = "viewport" content= "width = device-width, initial-scale = 1.0" />
    <title>ShopEasy</title>
    <link rel = "stylesheet" href = "../assets/css/style.css" />
    <link rel = "stylesheet" href = "../assets/css/bootstrap.css" />
  </head>
  <body>
    <!-- Header -->
    <section class = "header-section">
      <header class = "header">
        <div class = "container">
          <div class = "header-content">
            <div class = "brand-name">ShopEasy</div>
            <div class = "sign-buttons">
              <button
                class = "log-btn btn"
                type = "button"
                data-bs-toggle = "modal"
                data-bs-target = "#staticBackdrop"
              >
                LogIn
              </button>
              <button class = "reg-btn btn">SignUp</button>
            </div>
          </div>
        </div>
      </header>
    </section>

    <!--Register Modal -->
    <div
      class = "modal fade"
      id = "staticBackdrop"
      data-bs-backdrop = "static"
      data-bs-keyboard = "false"
      tabindex = "-1"
      aria-labelledby = "staticBackdropLabel"
      aria-hidden = "true"
    >
      <div class = "modal-dialog">
        <div class = "modal-content">
          <div class = "modal-header">
            <h5 class = "modal-title">LogIn</h5>
            <button
              type = "button"
              class = "btn-close"
              data-bs-dismiss = "modal"
              aria-label = "Close"
            ></button>
          </div>
          <div class = "modal-body">
            <form action = "" class = "user-reg-form" method = "">
              <div class = "row mb-3">
                <div class = "col">
                  <label for = "Firstname" class = "form-label">Firstname </label>
                  <input
                    type = "text"
                    class = "form-control"
                    placeholder = "Enter your firstname"
                    name = "firstName"
                    id = "Firstname"
                  />
                </div>
              </div>
              <div class = "row mb-3">
                <div class = "col">
                  <label for = "Lastname" class = "form-label">Lastname </label>
                  <input
                    type = "text"
                    class = "form-control"
                    placeholder = "Enter your lastsname"
                    name = "LastName"
                    id = "Lastname"
                  />
                </div>
              </div>
              <div class = "row mb-3">
                <div class = "col">
                  <label for = "email" class = "form-label">Email </label>
                  <input
                    type = "text"
                    class = "form-control"
                    placeholder = "Enter your eamil"
                    name = "userEmail"
                    id = "email"
                  />
                </div>
              </div>
              <div class = "row mb-3">
                <div class = "col">
                  <label for = "phone" class = "form-label">Phone </label>
                  <input
                    type = "text"
                    class = "form-control"
                    placeholder = "Enter your phone number"
                    name = "userPhoneNumber"
                    id = "phone"
                  />
                </div>
              </div>
              <div class = "row mb-3">
                <div class = "col">
                  <label for = "role" class = "form-label">Role </label>
                  <select name = "userRole" id = "role" class = "form-select">
                    <option value = "">Select</option>
                    <option value = "">Admin</option>
                    <option value = "">User</option>
                  </select>
                </div>
              </div>
              <div class = "row mb-5">
                <div class = "col">
                  <label for = "password" class = "form-label">Password </label>
                  <input
                    type = "password"
                    class = "form-control"
                    placeholder = "Enter your password"
                    name = "userPassword"
                    id = "password"
                  />
                </div>
              </div>
              <div class = "row mb-3">
                <div class = "col submit-log-form">
                  <button
                    class = "btn user-submit"
                    type = "submit"
                    name = "userLogIn"
                  >
                    Submit
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <script src = "../assets/js/bootstrap.bundle.js"></script>
  </body>
</html>
