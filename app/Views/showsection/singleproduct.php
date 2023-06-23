<?= $this->extend('layout/frontend'); ?>

<?= $this->section('user-content'); ?>
<div class="container">

        <div class="row">
            <div class="d-flex">
                <?php foreach ($data as $row) : ?>
                    <div class="card col-3 m-2 p-2">

                        <img src="<?= base_url('productimg/' . $row['imagename']) ?>" class="card-img-top p-2" alt="...">
                        <div class="card-body">
                            <h6 class="card-title"><?= $row['name'] ?></h6>
                        </div>
                        <div>
                            <p>Price :<?= $row['price'] ?></p>
                            <button class="btn btn-primary">Buy Now</button>
                        </div>
                        </a>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>

  
</div>



<?= $this->endSection(); ?>