<?php

namespace App\Http\Controllers;

use App\Http\Requests\CustomerRequest;
use App\Models\Customer;
use Illuminate\Http\Request;

class CustomerController extends Controller
{
    public function index(){
        $customers = Customer::all();

        return response()->json([
            "message" => "Customers retrived successfully",
            "data" => $customers
        ],200);
    }
    public function store(CustomerRequest $request){
        $customer = Customer::create($request->validated());

        return response()->json([
            "message" => "Customer added successfully",
            "data" => $customer
        ],200);
    }
}
