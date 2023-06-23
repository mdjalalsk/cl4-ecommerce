<?= $this->extend('layout/default') ?>

<?= $this->section('content') ?>
<h1 class="mt-4">Subcategory Management</h1>

<hr>
<div class="d-flex justify-content-end">
    <span>
        <i class="bi bi-plus-square" id="showFormBtn"></i>
    </span>
</div>
<div class="form-container">
    <?= csrf_field() ?>
    <input type="hidden" id="scid" value="">
    <div class="form-group">
        <label class="form-label">Name</label>
        <input class="form-control" type="text" name="subcatname" id="subcatname">
    </div>
    <div class="form-group">
        <label class="form-label">Category</label>
        <select name="category" id="category" class="form-select">
            <option value="-1">Select</option>
            <?php
            foreach ($cats as $row) {
                echo "<option value='" . $row['id'] . "'>" . $row['name'] . "</option>";
            }
            ?>
        </select>
    </div>
    <div class="form-group my-2">
        <input type="button" class="btn btn-outline-primary" value="ADD" id="addBtn">
        <input type="button" class="btn btn-outline-danger" value="Clear" id="clearBtn">
    </div>

    <br>

</div>
<table class="table table-striped table-hover table-sm">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category </th>
            <th class="d-none">Category id</th>
        
            <th>Create Time</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody id="maindata">

    </tbody>

</table>

<?= $this->endSection() ?>
<?= $this->section('script') ?>
<script>
    $(document).ready(function() {
        $(".form-container").hide();
        $("#showFormBtn").click(function() {
            $(".form-container").toggle(300);
        });

        //clearform
        function clearform() {
            $("#subcatname").val("");
            $("#category").val("-1");            
            $("#scid").val("");
            $("#addBtn").val('Add');
            $(".form-container").hide(5000);
        }
        //clearform end
        //clearBtn
        $("#clearBtn").click(function(){
            clearform();            
        })
        //clearBtn end

        // addBtn

        $("#addBtn").click(function() {
            $.post("<?= site_url("subcategory/new") ?>", {
                id: $("#scid").val(),
                name: $("#subcatname").val(),
                catid: $("#category").val(),
                'action': "insert"
            }, function(d) {
                if (d.success) {
                    Swal.fire(
                        'Good job!',
                        d.message,
                        'success'
                    ).then(() => {                        
                        loaddata();
                    })
                }

            })
        });
        // addBtn end
        function showdata(d) {
            // console.log(d);
            $html = ``;
            $.each(d, function(index, row) {
                // console.log(row);
                $html += `<tr class='singlerow'>`;
                $html += `<td>${row.id}</td>`;
                $html += `<td class='sn'>${row.name}</td>`;
                $html += `<td>${row.catname}</td>`;
                $html += `<td class='d-none sci'>${row.category_id}</td>`;
                $html += `<td>${row.created_at}</td>`;

                $html += `<td><a href='javascript:void(0)' class='editBtn' data-id='${row.id}'><i class="bi bi-pencil-square"></i></a><a href='javascript:void(0)' class='deleteBtn' data-id='${row.id}'><i class="bi bi-trash-fill"></i></a></td>`;
                $html += `</tr>`;
            });
            $("#maindata").html($html);
            

        }

        function loaddata() {
            $.getJSON("<?= base_url(); ?>subcategory/all", function(data) {
                showdata(data);
            });
            clearform()
        }
        loaddata();


        //editBtn
        $("#maindata").on("click",".editBtn",function(){
            $t = $(this);
            $id = $t.data("id");
            let catid = Number($t.parent().parent().find('.sci').html());
            let scname = $t.parent().parent().find('.sn').html();
            $("#subcatname").val(scname);
            $("#category").val(catid);
            $("#scid").val($id);
            $("#addBtn").val('Update');
            $(".form-container").show(400);
        })

        // });
        //editBtn end
        //deleteBtn start
        $("#maindata").on("click",".deleteBtn",function(){
            $t = $(this);
            $id = $t.data("id");
            // swal confirm
            Swal.fire({
  title: 'Do you want to delete the record??',
  showDenyButton: true,
  showCancelButton: false,
  confirmButtonText: 'Delete',
  denyButtonText: `Don't delete`,
}).then((result) => {
    console.log(result);
  /* Read more about isConfirmed, isDenied below */
  if (result.isConfirmed) {
    //           
            // ajax            
            $.post("<?= site_url("subcategory/delete") ?>", {
                'id':$id,
                'action': "delete"
            }, function(d) {
                if (d.success) {
                    Swal.fire(
                        'Good job!',
                        d.message,
                        'success'
                    ).then(() => {                        
                        loaddata();
                    })
                }

            })
            // ajax end
    // 
  } else if (result.isDenied) {
    Swal.fire('Changes are not saved', '', 'info')
  }
})
            // swal end
            
        });
        //deleteBtn end
    });
</script>
<?= $this->endSection() ?>