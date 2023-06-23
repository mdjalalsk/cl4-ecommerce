<?= $this->extend('showsection/homepage') ?>
<?= $this->section('showcat') ?>
<h1>Sub-Category</h1>
<hr>
<div class="subcat">
    <?php foreach ($subcats as $row) : ?>
        <a href="<?= base_url('showsubcat/' . $row['id']) ?>">
            <ul>
                <li><?= $row['name'] ?></li>
            </ul>
        </a>
    <?php endforeach; ?>
</div>
<hr>
<div class=" container">
    <h3>All Products from category</h3>
    <div class="row g-4">
            <?php foreach ($products as $row) : ?>
                <div class="col-md-4">
               
         <!-- cart items  -->
                       <div class="single-card">
                       <a href="<?= base_url('singleproduct/' . $row['id']) ?>">   
                                <div class="single-card-image">
                                <img src="<?= base_url('productimg/' . $row['image_name']) ?>" class="card-img-top p-2" alt="...">
                                </div>
                                <div class="single-card-content">
                                    <h3><?= $row['name'] ?></h3>
                                    <del>Price :<?= $row['price'] ?></del>
                                    <p>Discount Priec : <?= $row['price2'] ?></p>
                                    <button >Add to Cart</button>
                                    <!-- class="btn btn-outline-primary" -->
                                </div>
                                </a>
         <!-- cart items  -->

                </div>

                </div>
            <?php endforeach; ?>
        
    </div>
</div>


<?= $this->endSection('showcat') ?>