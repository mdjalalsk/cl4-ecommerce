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
<div class="container-ct">
        <div class="header">
            <h1>Products</h1>
        </div>

        <div class="products">
            <div class="product">
                <div class="image">
                    <img src="assets/img/pe.webp" alt="">
                </div>
                <div class="namePrice">
                    <h3>earphone</h3>
                    <span>$15.99</span>
                </div>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla quam voluptas aliquam sapiente dolore
                    a est, maget nihil, cumque atque eaque maxime? Harum tempora cumque
                    in?</p>
                <div class="stars">
                    <li class="fa-solid fa-star"></li>
                    <li class="fa-solid fa-star"></li>
                    <li class="fa-solid fa-star"></li>
                    <li class="fa-solid fa-star"></li>
                    <li class="fa-solid fa-star"></li>
                </div>
                <div class="bay">
                    <button>bay now</button>
                </div>
            </div>
            <div class="product">
                <div class="image">
                    <img src="assets/img/pe.webp" alt="">
                </div>
                <div class="namePrice">
                    <h3>earphone</h3>
                    <span>$15.99</span>
                </div>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla quam voluptas aliquam sapiente dolore
                    a est, maget nihil, cumque atque eaque maxime? Harum tempora cumque
                    in?</p>
                <div class="stars">
                    <li class="fa-solid fa-star"></li>
                    <li class="fa-solid fa-star"></li>
                    <li class="fa-solid fa-star"></li>
                    <li class="fa-solid fa-star"></li>
                    <li class="fa-solid fa-star"></li>
                </div>
                <div class="bay">
                    <button>bay now</button>
                </div>
            </div>
        </div>
        

        
    </div>
    <!--Card end -->
    </div>

<?= $this->endSection(); ?>