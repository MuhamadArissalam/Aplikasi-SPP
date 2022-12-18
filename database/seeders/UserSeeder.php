<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'name' => 'aris',
            'email' => 'marissalam182@gmail.com',
            'password' => Hash::make('aris_nethunter'),
            'level' => '0',
        ]);
        DB::table('users')->insert([
            'name' => 'demo',
            'email' => 'demo@gmail.com',
            'password' => Hash::make('demo'),
            'level' => '3',
        ]);
    }
}
