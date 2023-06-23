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
    <div class="row">
            <?php foreach ($products as $row) : ?>
                <div class="col-md-4">
                <div class="card m-2 p-2">
                    <img src="<?= base_url('productimg/' . $row['image_name']) ?>" class="card-img-top p-2" alt="...">
                    <div class="card-body">
                        <h6 class="card-title"><?= $row['name'] ?></h6>
                    </div>
                    <div>
                        <p>Price :<?= $row['price'] ?></p>
                        <button class="btn btn-primary">Buy Now</button>
                    </div>
                    </a>
                </div>
                </div>
            <?php endforeach; ?>
        
    </div>
</div>


<?= $this->endSection('showcat') ?>