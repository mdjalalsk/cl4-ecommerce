<?= $this->extend('layout/frontend'); ?>

<?= $this->section('user-content'); ?>

    <form class="container" id="login" action="<?= base_url('/login') ?>" method="post">
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" required>
                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                <p>Don't have an account? <?= anchor("register", "registeration")?></p>
            </div>
        </div>
    </form>

<?= $this->endSection(); ?>
