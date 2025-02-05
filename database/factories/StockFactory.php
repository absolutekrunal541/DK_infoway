<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Model>
 */
class StockFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'item_code'   => strtoupper(Str::random(10)),
            'item_name'   => $this->faker->word,
            'quantity'    => $this->faker->numberBetween(1, 100),
            'location'    => $this->faker->city,
            'store_id'    => 1,
            'status'      => $this->faker->randomElement([1, 0]),
            'stock_update_date' => now(),
            'created_at'  => now(),
            'updated_at'  => now(),
        ];
    }
}
