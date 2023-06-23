
      <?=$this->include('layout/header')?>
     
        <div class="container-fluid px-4">
            <!-- dynamic content start -->
            <?= $this->renderSection('user-content') ?>
            <!-- dynamic content end -->
        </div>

  <?=$this->include('layout/footer')?>
      