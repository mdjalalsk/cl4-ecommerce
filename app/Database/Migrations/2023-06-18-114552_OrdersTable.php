<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;
use CodeIgniter\Database\RawSql;

class OrdersTable extends Migration
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
            'user_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
                'constraint'     => 5,
            ],
            'address_id' => [
                'type'           => 'INT',
                'unsigned'       => true,
                'constraint'     => 5,
            ],
            'total' => [
                'type'       => 'float',
                'constraint' => '10,2',
            ],
            'discount' => [
                'type'       => 'float',
                'constraint' => '10,2',
            ],
            'comment' => [
                'type'       => 'VARCHAR',
                'constraint' => '128',
            ],
            'status' => [
                'type'       => 'VARCHAR',
                'constraint' => '60',
            ],
            
            'created_at' => [
                'type'    => 'TIMESTAMP',
                'default' => new RawSql('CURRENT_TIMESTAMP'),
            ]]);

            $this->forge->addKey('id', true);
        $this->forge->addForeignKey('user_id', 'users', 'id'); 
        $this->forge->addForeignKey('address_id', 'addresses', 'id'); 
        $this->forge->createTable('orders');
    }

    public function down()
    {
        $this->forge->dropTable('orders');
    }
}
