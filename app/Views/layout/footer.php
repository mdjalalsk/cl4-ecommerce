<div class="container">
<div class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col">
                        <h4>company</h4>
                        <ul>
                            <li><a href="">about us</a></li>
                            <li><a href="">our services</a></li>
                            <li><a href="">privacy policy</a></li>
                            <li><a href="">affiliate program</a></li>                           
                        </ul>
                    </div>
                     <div class="footer-col">
                        <h4>get help</h4>
                        <ul>
                            <li><a href=""> FAQ</a></li>
                            <li><a href=""> shipping</a></li>
                            <li><a href=""> returns</a></li>
                            <li><a href="">order status</a></li>
                            <li><a href="">payment option</a></li>
                        </ul>
                    </div>
                     <div class="footer-col">
                        <h4>online shop</h4>
                        <ul>
                            <li><a href="">watch</a></li>
                            <li><a href="">bag</a></li>
                            <li><a href="">shoes</a></li>
                            <li><a href="">dress</a></li>
                        </ul>
                    </div>
                     <div class="footer-col">
                        <h4>follow us</h4>
                        <div class="social-links">
                            <a href=""><i class="fab fa-facebook-f"></i></a>
                            <a href=""><i class="fab fa-twitter"></i></a>
                            <a href=""><i class="fab fa-instagram"></i></a>
                            <a href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                    </div>
                </div>
            </div>
        </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> 
        <script src="<?=base_url()?>/assets/js/cart.js"></script>
      
       <script>
           
     $(document).ready(function () {
    const cart = new Cart();
    $("#bcart").html(cart.totalItems());
    $(".addCartBtn").click(function(){
        $t = $(this);
       let id = $t.data("id");
       let price = $t.data("price");
       let price2 = $t.data("price2");
       let name = $t.parent().parent().find('.pname').html();
       let img = $t.parent().parent().parent().find('.card-img-top').attr('src');
       cart.addItem({ name: name, price: price,discount: price2, id:id, image:img  });
       $("#bcart").html(cart.totalItems());
 console.log(cart.totalItems());
alert("Product "+ name + " has been added to cart");
    });
});
        </script>
</body>
</html>