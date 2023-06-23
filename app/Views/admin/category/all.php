<?= $this->extend('layout/default') ?>

<?= $this->section('content') ?>
<h1 class="mt-4">Category Management</h1>

<hr>
<div class="d-flex justify-content-end">
    <span>
        <i class="bi bi-plus-square" id="showFormBtn"></i>
    </span>
</div>
 <?= form_open_multipart('category/new', ['class' => "form", "id" => "categoryForm","method" => "post" ])   ?>
    <div class="form-container">
        <?= csrf_field() ?>
        <input type="hidden" id="id" value="">
        <div class="form-group">
            <label class="form-label">Name</label>
            <input class="form-control" type="text" name="name" id="name">
        </div>
        <div class="form-group">
            <label class="form-label">Image</label>
            <input class="form-control" type="file" name="image" id="image">
        </div>

        <div class="form-group my-2">
            <input type="submit" class="btn btn-outline-primary" value="ADD" id="addBtn">
            <input type="button" class="btn btn-outline-danger" value="Clear" id="clearBtn">
        </div>
    </div>
</form>
<br>


<table class="table table-striped table-hover table-sm">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th class="d-none">Image</th>
            <th>Image</th>
            <th>Create Time</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody id="maindata">

    </tbody>

</table>
<img src="" height="200px" alt="">
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
            $("#name").val("");
            $("#image").val("");
            $("#id").val("");
            $("#addBtn").val('Add');
            $(".form-container").hide(1500);
        }
        //clearform end
        //clearBtn
        $("#clearBtn").click(function() {
            clearform();
        })
        //clearBtn end


        // add Categories
        $("#categoryForm").submit(function(e){
            e.preventDefault();
            let formdata = new FormData(this);

            $.ajax({
                url: "category/new",
                type: "POST",
                data: formdata,
                processData: false, 
                contentType: false,
                success: function(data){
                    if(data.status){
                        Swal.fire(
                        'Good job!',
                        data.message,
                        'success'
                    ).then(() => {
                        loaddata();
                    })
                    }
                }
            })
        })

        // addBtn end
        function showdata(d) {
            // console.log(d);
            $html = ``;
            $.each(d, function(index, row) {
                // console.log(row);
                $html += `<tr class='singlerow'>`;
                $html += `<td >${row.id}</td>`;
                $html += `<td class='name'>${row.name}</td>`;
                $html += `<td class='image d-none'>${row.image}</td>`;
                $html += `<td class=''><img width="50px" src="${row.image}" alt="${row.image}"></td>`;
                $html += `<td>${row.created_at}</td>`;

                $html += `<td><a href='javascript:void(0)' class='editBtn' data-id='${row.id}'><i class="bi bi-pencil-square"></i></a><a href='javascript:void(0)' class='deleteBtn' data-id='${row.id}'><i class="bi bi-trash-fill"></i></a></td>`;
                $html += `</tr>`;
            });
            $("#maindata").html($html);


        }

        function loaddata() {
            $.getJSON("<?= base_url(); ?>category/all", function(data) {
                showdata(data);
            });
            clearform()
        }
        loaddata();


        //editBtn
        $("#maindata").on("click", ".editBtn", function() {
            $t = $(this);
            $id = $t.data("id");
            let name = $t.parent().parent().find('.name').html();
            let image = $t.parent().parent().find('.image').html();
            $("#name").val(name);
            $("#image").val(image);
            $("#id").val($id);
            $("#addBtn").val('Update');
            $(".form-container").show(400);
        })
        // });
        //editBtn end



        //deleteBtn start
        $("#maindata").on("click", ".deleteBtn", function() {
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
                    $.post("<?= site_url("category/delete") ?>", {
                        'id': $id,
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