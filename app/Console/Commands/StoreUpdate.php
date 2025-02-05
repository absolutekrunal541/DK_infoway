<?php

namespace App\Console\Commands;

use App\Models\Stock;
use Illuminate\Console\Command;

class StoreUpdate extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:store-update';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Everyday stock will be update as a instock';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        Stock::query()->update(['status' => 1]);
    }
}
