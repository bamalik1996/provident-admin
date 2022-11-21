<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
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
        User::truncate();

        $data = [
            'name'=>'epda',
            'email'=>'admin@digitailor.com',
            'password'=>Hash::make('password'),
            'status'=>'enabled'
        ];

        User::create($data);
    }
}
