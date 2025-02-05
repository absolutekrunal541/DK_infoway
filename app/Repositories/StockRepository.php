<?php

namespace App\Repositories;

use App\Models\Stock;
use App\Models\Store;
use App\Repositories\Interface\StockInterface;

class StockRepository implements StockInterface
{
    /**
     * Create a new class instance.
     */
    public function __construct()
    {
        //
    }

    //find the customer
    public function find($id)
    {
        return Stock::findorfail($id);
    }

    //find the all customer
    public function findAll()
    {
        return Stock::all();
    }

    //pagination data
    public function getAllList($request)
    {
        $columns = ['id', 'item_code', 'item_name', 'quantity', 'location', 'in_stock', 'store_id', 'status', 'id'];
        $skip    = $request->get('start');
        $take    = $request->get('length');
        $order   = $columns[$request->input('order.0.column')];
        $dir     = $request->input('order.0.dir');

        // Query to get inquiries with associated emails
        $query = Stock::with(['store' => function ($query) {
            $query->select('stores.id', 'stores.name');
        }]);

        // Get the total number of records before applying pagination
        $recordsTotal = $query->count();

        // Apply filtering logic (if needed, e.g., search)
        $searchValue = $request->input('search.value');
        if (!empty($searchValue)) {
            $query->where(function ($q) use ($searchValue) {
                $q->whereHas('store', function ($q2) use ($searchValue) {
                    $q2->where('name', 'LIKE', "%{$searchValue}%");
                })
                    ->orWhere('item_code', 'LIKE', "%{$searchValue}%")
                    ->orWhere('item_name', 'LIKE', "%{$searchValue}%")
                    ->orWhere('quantity', 'LIKE', "%{$searchValue}%")
                    ->orWhere('location', 'LIKE', "%{$searchValue}%")
                    ->orWhere('in_stock', 'LIKE', "%{$searchValue}%")
                    ->orWhere('status', 'LIKE', "%{$searchValue}%")
                    ->orWhere('id', 'LIKE', "%{$searchValue}%");
            });
        }

        // Calculate the number of filtered records
        $recordsFiltered = $query->count();

        // Apply pagination and ordering
        $data = $query->skip($skip)->take($take)->orderBy($order, $dir)->get();

        // Transform the data to include concatenated emails
        $data = $data->map(function ($stock) {
            $stock->store_name = $stock->store->name ?? '';
            return $stock;
        });

        return [
            "draw" => intval(request('draw')),
            "recordsTotal" => intval($recordsTotal),
            "recordsFiltered" => intval($recordsFiltered),
            "data" => $data
        ];
    }

    //save stock data into database
    public function store($data)
    {
        echo "<pre>";
        print_r($data->data);
        echo "</pre>";
        exit;

        if (!empty($data->data)) {
            $stockData = [];

            foreach ($data->data as $value) {

                $stockUpdateDate = !empty($value['InStockDate']) ? date('Y-m-d', strtotime($value['InStockDate'])) : null;

                $stockData[] = [
                    'item_code'     => $value['ItemCode'],
                    'item_name'     => $value['ItemName'],
                    'quantity'      => $value['Quantity'],
                    'location'      => $value['Location'],
                    'store_id'      => Store::where('name', $value['StoreName'])->value('id') ?? 1,
                    'status'        => 1, // defualt 1 for active stock
                    'stock_update_date' => $stockUpdateDate,
                    'created_at'    => now(),
                    'updated_at'    => now()
                ];
            }

            if (!empty($stockData)) {
                Stock::insert($stockData);
                return true;
            }
            return false;
        }
        return false;
    }


    //remove customer from the database
    public function destroy($id)
    {
        $data = $this->find($id);
        if ($data) {
            $data->delete();
            return true;
        }
        return false;
    }
}
