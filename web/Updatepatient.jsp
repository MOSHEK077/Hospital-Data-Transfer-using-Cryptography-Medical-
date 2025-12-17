

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Update Patient Details</title>

  <!-- Bootstrap 4.1.1 CSS (keep a single version) -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />

  <!-- Your custom styles (optional) -->
  <link rel="stylesheet" href="st.css" />

  <!-- jQuery, Popper.js, Bootstrap JS (one copy each, matching Bootstrap 4) -->
  <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</head>
<body>
  <!-- background image & tint - style these in st.css -->
  <img class="bg-img" src="image22.jpg" alt="Background image" />
  <div class="bg-tint"></div>

  <section class="container py-5">
    <h1 class="text-center mb-4">UPDATE PATIENT DETAILS</h1>

    <!-- Summary table (read-only values) -->
    <div class="row justify-content-center mb-4">
      <div class="col-md-8">
        <div class="table-responsive">
          <table class="table table-striped table-bordered">
            <tbody>
              <tr><th scope="row" style="width:40%;">Unique ID</th><td id="data-unique">data1</td></tr>
              <tr><th scope="row">Name</th><td id="data-name">data2</td></tr>
              <tr><th scope="row">Mail ID</th><td id="data-mail">data3</td></tr>
              <tr><th scope="row">Communication Address</th><td id="data-address">data4</td></tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- Form -->
    <!-- Add action and method to connect to your backend (e.g., action="/update" method="post") -->
    <form class="needs-validation" novalidate action="#" method="post" enctype="multipart/form-data">
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="t1">Marital Status</label>
          <input id="t1" name="t1" type="text" class="form-control" required />
          <div class="invalid-feedback">Please enter marital status.</div>
        </div>

        <div class="form-group col-md-6">
          <label for="t2">Communication Address</label>
          <input id="t2" name="t2" type="text" class="form-control" required />
          <div class="invalid-feedback">Please enter communication address.</div>
        </div>

        <div class="form-group col-md-6">
          <label for="t3">Field 1</label>
          <input id="t3" name="t3" type="text" class="form-control" required />
          <div class="invalid-feedback">Required.</div>
        </div>

        <div class="form-group col-md-6">
          <label for="t4">Field 2</label>
          <input id="t4" name="t4" type="text" class="form-control" required />
          <div class="invalid-feedback">Required.</div>
        </div>

        <div class="form-group col-md-6">
          <label for="t5">Field 3</label>
          <input id="t5" name="t5" type="text" class="form-control" required />
          <div class="invalid-feedback">Required.</div>
        </div>

        <div class="form-group col-md-6">
          <label for="t6">State</label>
          <input id="t6" name="t6" type="text" class="form-control" required />
          <div class="invalid-feedback">Please enter state.</div>
        </div>

        <div class="form-group col-md-6">
          <label for="t7">Mail-ID</label>
          <input id="t7" name="t7" type="email" class="form-control" required />
          <div class="invalid-feedback">Please enter a valid email.</div>
        </div>

        <div class="form-group col-md-6">
          <label for="t8">Pincode</label>
          <input id="t8" name="t8" type="text" class="form-control" pattern="\d{4,6}" title="4-6 digits" required />
          <div class="invalid-feedback">Please enter a valid pincode (4–6 digits).</div>
        </div>

        <div class="form-group col-md-6">
          <label for="photo">Upload Photo Copy</label>
          <input id="photo" name="photo" type="file" class="form-control-file" accept="image/*,application/pdf" />
        </div>
      </div>

      <div class="d-flex justify-content-between align-items-center mt-4">
        <div>
          <button type="reset" class="btn btn-secondary">Clear</button>
        </div>
        <div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </div>
    </form>
  </section>

  <!-- small JS to enable bootstrap validation UI -->
  <script>
    (function () {
      'use strict';
      window.addEventListener('load', function () {
        var forms = document.getElementsByClassName('needs-validation');
        Array.prototype.filter.call(forms, function (form) {
          form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
              event.preventDefault();
              event.stopPropagation();
            }
            form.classList.add('was-validated');
          }, false);
        });
      }, false);
    })();
  </script>
</body>
</html>
