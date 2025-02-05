<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;

class Admin extends Authenticatable
{
    protected $fillable = [
        'name',
        'email',
        'phone_no',
        'password',
        'profile',
        'login_ip',
        'status'
    ];
}
