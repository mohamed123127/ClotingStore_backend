<?php

namespace App\Http\Controllers;

use App\Models\Agence;
use App\Models\Commune;
use App\Models\Wilaya;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;


class YalidineController extends Controller
{
    public function GetWilayas(){
        $wilayas = Wilaya::all();

        if($wilayas->isEmpty()){
            Log::error("no wilayas found");
            return response()->json([
                'message' => 'no wilayas found'
            ]);
        }
        return response()->json([
                'message' => 'Wilayas retrieved successfully',
                'wilayas' => $wilayas
        ]);
    }

     public function GetCommunes($wilayaId){
        $data = Wilaya::with('communes')->find($wilayaId);

    if (!$data) {
        Log::error("Wilaya not found for id: $wilayaId");
        return response()->json([
            'message' => 'Wilaya not found'
        ], 404);
    }

    if ($data->communes->isEmpty()) {
        Log::error("no communes found for wilaya id: $wilayaId");
        return response()->json([
            'message' => 'no communes found for wilaya id: '.$wilayaId
        ], 404);
    }

        return response()->json([
                'message' => 'communes retrieved successfully',
                'wilaya' => $data->name,
                'communes' => $data->communes
        ]);
    }

    public function GetCommunes_hasAgences($wilayaId){
        try{

        $wilaya = Wilaya::find($wilayaId);

    if (!$wilaya) {
        Log::error("Wilaya not found for id: $wilayaId");
        return response()->json([
            'message' => 'Wilaya not found'
        ], 404);
    }

    $communes = Commune::where([
                ['has_stop_desk', true],
                ['wilaya_id', $wilayaId],
            ])->get();

    if ($communes->isEmpty()) {
        Log::error("no communes have agences found for wilaya id: $wilayaId");
        return response()->json([
            'message' => 'no communes have agences found for wilaya id: '.$wilayaId
        ], 404);
    }

        return response()->json([
                'message' => 'communes have agences retrieved successfully',
                'wilaya' => $wilaya->name,
                'communes' => $communes
        ]);
        }catch(Exception $e){
             return response()->json([
                'message' => 'error in the server',
                'error' => $e->getMessage(),
        ]);
        }
    }

    public function GetAgences($communeId){
        $commune = Commune::find($communeId);

    if (!$commune) {
        Log::error("commune not found for id: $communeId");
        return response()->json([
            'message' => 'commune not found'
        ], 404);
    }

    $agences = Agence::where([
                ['commune_id', $communeId],
            ])->get();

    if ($agences->isEmpty()) {
        Log::error("no communes have agences found for commune id: $communeId");
        return response()->json([
            'message' => 'no communes have agences found for commune id: '.$communeId
        ], 404);
    }

        return response()->json([
                'message' => 'agences have agences retrieved successfully',
                'commune' => $commune->name,
                'agences' => $agences
        ]);
    }
}
