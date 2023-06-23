<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;
use CodeIgniter\Database\RawSql;

class CustomerAddressTable extends Migration
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
            'address1' => [
                'type'       => 'VARCHAR',
                'constraint' => '128',
            ],
            'address2' => [
                'type'       => 'VARCHAR',
                'constraint' => '128',
            ],
            'city' => [
                'type'       => 'VARCHAR',
                'constraint' => '60',
            ],
            'state' => [
                'type'       => 'VARCHAR',
                'constraint' => '60',
            ],
            'postcode' => [
                'type'       => 'VARCHAR',
                'constraint' => '60',
            ],
            'country' => [
                'type'       => 'VARCHAR',
                'constraint' => '60',
            ],
            'created_at' => [
                'type'    => 'TIMESTAMP',
                'default' => new RawSql('CURRENT_TIMESTAMP'),
            ]]);

            $this->forge->addKey('id', true);
        $this->forge->addForeignKey('user_id', 'users', 'id'); 
        $this->forge->createTable('addresses');
    }

    public function down()
    {
        $this->forge->dropTable('addresses');
    }
}
