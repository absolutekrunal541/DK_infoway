<?php

namespace App\Http\Controllers;

use App\Models\Store;
use App\Models\Stocks;
use Illuminate\Http\Request;
use App\Http\Requests\SaveStocks;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use App\Repositories\Interface\StockInterface;

class StockController extends Controller
{
    protected $stockRepository;
    function __construct(
        StockInterface $stockRepository
    ) {
        $this->stockRepository = $stockRepository;
    }
    public function index(Request $request)
    {
        if ($request->ajax()) {
            try {
                $result = $this->stockRepository->getAllList($request);
                return response()->json($result);
            } catch (\Exception $e) {
                Log::error("StockController.php at index", ["Exception" => $e->getMessage(), "\n TraceAsString" => $e->getTraceAsString()]);
                return response()->json([
                    "draw" => 0,
                    "recordsTotal" => 0,
                    "recordsFiltered" => 0,
                    "data" => []
                ]);
            }
        }
    }
    public function add(Request $request)
    {
        $store = Store::pluck('name')->toArray();
        return view('stock.add', compact('store'));
    }
    public function store(Request $request)
    {
        //save customer data
        $saveData = $this->stockRepository->store($request);
        if ($saveData) {
            return response()->json(['message' => "Stock created successfully"], 200);
        } else {
            return response()->json(['message' => "Failed to create stock record!"], 203);
        }
    }
    public function destroy($id)
    {   //destroy customer data
        $deleteData = $this->stockRepository->destroy($id);
        if ($deleteData) {
            return response()->json(['message' => "Stock deleted successfully"], 200);
        } else {
            return response()->json(['message' => "Failed to delete stock"], 203);
        }
    }
}
