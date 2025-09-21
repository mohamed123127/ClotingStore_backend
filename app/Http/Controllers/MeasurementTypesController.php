<?php

namespace App\Http\Controllers;

use App\Models\MeasurementTypes;
use App\Models\ProductMeasurement;
use Illuminate\Http\Request;

class MeasurementTypesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($sizeId)
    {
        $measurements = ProductMeasurement::where('size_id',$sizeId);
        return response()->json([
            "message" => "Mesurement retrived succseffuly",
            "mesurements" => $measurements
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */

}
