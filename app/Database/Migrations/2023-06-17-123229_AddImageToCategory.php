<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddImageToCategory extends Migration
{
    public function up()
    {
        $fields = array(
            'image' => array(
                'type' => 'varchar', 
                'constraint' => 256,
                'after' => 'name')
    );
    $this->forge->addColumn('categories', $fields);
    }

    public function down()
    {
        $this->forge->dropColumn('categories', 'image');
    }
}
