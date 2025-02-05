<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    use HasFactory;

    protected $fillable = ['item_code', 'item_name', 'quantity', 'location', 'store_id', 'status', 'stock_update_date'];

    public function store()
    {
        return $this->belongsTo(Store::class, 'store_id');
    }
}
