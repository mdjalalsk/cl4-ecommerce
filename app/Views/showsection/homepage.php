<?= $this->extend('layout/frontend'); ?>

<?= $this->section('user-content'); ?>
<div class="container">
  <div class="row">
    <div class="col-2 ">
    <h1>Category</h1>
      <?php foreach ($category as $row) : ?>
        <div class="card  my-1" style="height: 170px;">
          <a href="<?= base_url('subcategory/' . $row['id']) ?>">
            <img src="<?= $row['image'] ?>" class="card-img-top" alt="..." style="height: 100px;">
            <div class="card-body">
              <h6 class="card-title"><?= $row['name'] ?></h6>

              <!-- <a href="#" class="btn btn-primary">Go somewhere</a> -->
            </div>
          </a>
        </div>
      <?php endforeach; ?>

    </div>

    <div class="col-9">
     
      <?= $this->renderSection('showcat') ?>

    </div>

  </div>
</div>



<?= $this->endSection(); ?>