<?= $this->extend('layout/frontend'); ?>

<?= $this->section('user-content'); ?>
<div class="container">
<form action="<?= base_url('/registration') ?>" id="register" method="post">
    <div class="row">
        <div class="col-6">
        <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Name</label>
    <input type="text" name="name" class="form-control" id="name" required>
  </div>

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" required>
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name="password" class="form-control" id="pass" required>
  </div>
  <!-- <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Role</label>
    <input type="text" class="form-control" id="role">
  </div> -->
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
  <button type="reset" class="btn btn-primary">reset</button>
  <p>Already have an account?<?= anchor("login", "Login") ?></p>
</form>
</div>
</div>
</div>

<?= $this->endSection(); ?>