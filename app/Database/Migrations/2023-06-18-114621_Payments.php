<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;
use CodeIgniter\Database\RawSql;

class Payments extends Migration
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
            'amount' => [
                'type'           => 'float',                
                'constraint'     => '10,2',
            ],
            'pmethod' => [
                'type'       => 'VARCHAR',
                'constraint' => '128',
            ],
            'trxid' => [
                'type'       => 'VARCHAR',
                'constraint' => '128',
            ],
            'created_at' => [
                'type'    => 'TIMESTAMP',
                'default' => new RawSql('CURRENT_TIMESTAMP'),
            ]]);
            $this->forge->addKey('id', true);
            $this->forge->addForeignKey('order_id', 'orders', 'id');   
            $this->forge->createTable('payments');
    }

    public function down()
    {
        $this->forge->dropTable('payments');
    }
}
