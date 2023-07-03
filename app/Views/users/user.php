<?= $this->extend('layout/frontend'); ?>

<?= $this->section('user-content'); ?>

<!-- carousel start -->
<div class="container">
    <!-- <h1><marquee behavior="" direction="" class="text-danger bg-info">Update News : ....</marquee></h1> -->
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="1000">
                <img src="assets/img/carousel/1cro.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="1000">
                <img src="assets/img/carousel/2cro.webp" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item" data-bs-interval="1000">
                <img src="assets/img/carousel/3cro.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
    </div>

    <!--carousel end -->

    <!--Card start -->
    <div class="container">
        <h1 class="text-center mt-3">New products</h1>
        <div class="row g-4 mb-5">
            <?php foreach ($data as $row) : ?>
                <div class="col-md-4">
                    <!-- cart items  -->
                    <div class="single-card">
                        <a href="<?= base_url('singleproduct/' . $row['id']) ?>">
                            <div class="single-card-image">
                                <img src="<?= base_url('productimg/' . $row['imagename']) ?>" class="card-img-top p-2" alt="...">
                            </div>
                            <div class="single-card-content">
                                <h3 class="pname"><?= $row['name'] ?></h3>
                                <del>Price :<?= $row['price'] ?></del>
                                <p>Discount Priec : <?= $row['price2'] ?></p>
                                <button>
                                    <a data-id="<?= $row['id'] ?>" data-price="<?= $row['price'] ?>" type="button" class="addCartBtn btn btn-primary shop-button" href="javascript:void(0)">
                                        Add to Cart &nbsp; <i class="fa-solid fa-cart-shopping"></i>
                                    </a>
                                </button>
                                <!-- class="btn btn-outline-primary" -->
                            </div>
                        </a>
                        <!-- cart items  -->

                    </div>

                </div>
            <?php endforeach; ?>

        </div>

    </div>
    <!-- service section start -->
    <section id="services" class="py-5">
  <div class="container">
    <h2 class="text-center mb-5">Our Services</h2>

    <!-- Service cards -->
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
      <!-- Service 1 -->
      <div class="col">
        <div class="card">
          <img src="<?= base_url()?>/assets/service/delivery.png" class="card-img-top" alt="Service 1">
          <div class="card-body">
            <h4 class="card-title">Super Fast and Free Delivery</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
          </div>
        </div>
      </div>

      <!-- Service 2 -->
      <div class="col">
        <div class="card ">
          <img src="<?= base_url()?>/assets/service/payment.jpeg" class="card-img-top" alt="Service 2">
          <div class="card-body">
            <h4 class="card-title">Super Secure Payment System</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
          </div>
        </div>
      </div>

      <!-- Service 3 -->
      <div class="col">
        <div class="card">
          <img src="<?= base_url()?>/assets/service/moneyback.jpeg" class="card-img-top" alt="Service 3">
          <div class="card-body">
            <h4 class="card-title">Money-back Guaranteed</h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
          </div>
        </div>
      </div>

      <!-- Add more service cards here -->
    </div>
  </div>

</section>


    <!-- service section end -->



</div>


<?= $this->endSection(); ?>