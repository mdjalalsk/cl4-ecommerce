<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;
use CodeIgniter\Database\RawSql;

class OrderItems extends Migration
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
            'order_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
                'constraint'     => 11,
            ],
            'product_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
                'constraint'     => 11,
            ],
            'quantity' => [
                'type'           => 'INT',
                'unsigned'       => true,
                'constraint'     => 5,
            ],
            'price' => [
                'type'       => 'float',
                'constraint' => '10,2',
            ],            
            'created_at' => [
                'type'    => 'TIMESTAMP',
                'default' => new RawSql('CURRENT_TIMESTAMP'),
            ]]);

            $this->forge->addKey('id', true);
        $this->forge->addForeignKey('order_id', 'orders', 'id'); 
        $this->forge->addForeignKey('product_id', 'products', 'id'); 
        $this->forge->createTable('order_items');
    }

    public function down()
    {
        $this->forge->dropTable('order_items');
    }
}
