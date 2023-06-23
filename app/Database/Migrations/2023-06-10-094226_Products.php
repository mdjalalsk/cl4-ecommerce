<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;
use CodeIgniter\Database\RawSql;

class Products extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => [
                'type'           => 'INT',
                'constraint'     => 11,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'category_id' => [
                'type'       => 'int',
                'unsigned'       => true,
                'constraint' => 5,
            ],
            'subcategory_id' => [
                'type'       => 'int',
                'unsigned'       => true,
                'constraint' => 5,
            ],
            'name' => [
                'type'       => 'VARCHAR',
                'constraint' => '256',
                'required' => true,
            ],
            'description' => [
                'type'       => 'text',
                'required' => true,
            ],
            'sku' => [
                'type'       => 'VARCHAR',
                'constraint' => '128',
                'required' => true,
                'unique' => true,
            ],
            'price' => [
                'type'       => 'float',
                'constraint' => '10,2',
                'required' => true,                
            ],
            'price' => [
                'type'       => 'float',
                'constraint' => '10,2',
                'required' => true,                
            ],
            'price2' => [
                'type'       => 'float',
                'constraint' => '10,2',
                'required' => true,                
            ],
            'quantity' => [
                'type'       => 'int',
                'constraint' => '5',
                'required' => true,                
            ],
            'discount' => [
                'type'       => 'int',
                'constraint' => '3',
                'required' => true, 
                'default'=>0,               
            ],
            'hot' => [
                'type'       => 'tinyint',
                'constraint' => '1',
                'required' => true, 
                'default'=>0,               
            ],          

            'created_at' => [
                'type'    => 'TIMESTAMP',
                'default' => new RawSql('CURRENT_TIMESTAMP'),
            ],

        ]);
        $this->forge->addKey('id', true);
        $this->forge->addForeignKey('category_id', 'categories', 'id'); 
        $this->forge->addForeignKey('subcategory_id', 'subcategories', 'id'); 
        $this->forge->createTable('products');
    }

    public function down()
    {
        $this->forge->dropTable('products');
    }
}
