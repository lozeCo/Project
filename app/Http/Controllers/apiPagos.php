<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class apiPagos extends Controller
{
    //
    public function index($user,$password){

        if (\Auth::attempt(['email' => $user, 'password' => $password])) {
            $id = \Auth::user()->id;
            return response($id, 200)->header('Access-Control-Allow-Origin', "*");
        }
        return 0;
    }
    public function uploadFile(Request $request)
    {
        dd($request->file());


        return response($file, 200)->header('Access-Control-Allow-Origin', "*");
    }
    public function uploadfile(Request $request){
        $file = $request->file();
        $path = $file[0]->store('images');
        $user = $request->input('user');

        DB::table('pagos')->insert(['usr_id' => $user, 'imagen' =>$path ] );
        $res = new \stdClass();
        $res->status = "ok";
        return response(json_encode($res), 200)->header('Access-Control-Allow-Origin', "*");
    }
}
