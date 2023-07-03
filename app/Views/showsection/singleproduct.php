<?= $this->extend('layout/frontend'); ?>

<?= $this->section('user-content'); ?>

<!-- design from lipi apu  -->
<div class="container">
    <div class="row m-5">

        <div class="col-md-6">
            <?php foreach ($data as $row) : ?>
                <div class="single-pro-img">
                    <img src="<?= base_url('productimg/' . $row['imagename']) ?>" class="card-img-top p-2" alt="...">

                    <div class="single-small-img">
                        <img src="<?= base_url('productimg/' . $row['imagename']) ?>" class="card-img-top p-2" alt="...">
                        <img src="<?= base_url('productimg/' . $row['imagename']) ?>" class="card-img-top p-2" alt="...">
                        <img src="<?= base_url('productimg/' . $row['imagename']) ?>" class="card-img-top p-2" alt="...">
                        <img src="<?= base_url('productimg/' . $row['imagename']) ?>" class="card-img-top p-2" alt="...">

                    </div>
                </div>
        </div>

        <div class="col-md-6">
            <div class="sigle-card-details">
                <h2 class="pname"><?= $row['name'] ?></h2>
                <del>Price :<?= $row['price'] ?></del>
                <h5>Discount Price : <?= $row['price2'] ?></h5>
                <h3>Details</h3>
                <p><?= $row['description'] ?></p>
                <ol>
                    <li>color</li>
                    <li>available in stock</li>
                    <li>category : electronic</li>
                    <li>shopin area</li>
                </ol>
                <a data-id="<?= $row['id'] ?>" data-price="<?= $row['price'] ?>" type="button" class="addCartBtn btn btn-primary shop-button" href="javascript:void(0)">
                    Add to Cart &nbsp; <i class="fa-solid fa-cart-shopping"></i>
                </a>
                <div>
                    <h5>follow us</h5>
                    <div class="single-social-links">
                        <a href=""><i class="fab fa-facebook-f"></i></a>
                        <a href=""><i class="fab fa-twitter"></i></a>
                        <a href=""><i class="fab fa-instagram"></i></a>
                        <a href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>

            </div>
        </div>
    <?php endforeach; ?>
    </div>
        
</div>

<!-- design from lipi apu  -->





<?= $this->endSection(); ?>