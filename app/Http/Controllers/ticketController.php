<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use \Carbon\Carbon;

class ticketController extends Controller
{
    public function index (Request $request,$fecha)
    {
        $res = $this->getSitsByDate($fecha);
        return response(json_encode($res), 200)->header('Access-Control-Allow-Origin', "*");
    }
    private function getSitsByDate($fecha)
    {
        $sql =
        'SELECT
            crr_id,rta_nombre,rta_origen,rta_destino,rta_horaSalida,rta_precio,
            vhc_nombre,vhc_placas,vhc_descripcion,
            ecr_nombre,blt_number,blt_id,ebl_id,ebl_nombre,blt_cliente
        FROM Corrida C
        INNER JOIN Boletos USING ( crr_id)
        INNER JOIN cat_EstadoBoleto USING (ebl_id)
        INNER JOIN cat_EstadoCorrida USING( ecr_id)
        INNER JOIN cat_Ruta USING ( rta_id )
        INNER JOIN Vehiculos USING (vhc_id)
        WHERE C.crr_fecha =DATE("'.$fecha.'")
        ';
        $t = DB::select($sql);

        $res = new \stdClass();

        $res->asientos = [];
        foreach ($t as $r) {
            if (!isset($res->idcorrida)) {
                $res->idcorrida = $r->crr_id;
                $res->rutaNombre= $r->rta_nombre;
                $res->origen    = $r->rta_origen;
                $res->destino   = $r->rta_destino;
                $res->vehiculo  = $r->vhc_descripcion;
                $res->estado    = $r->ecr_nombre;
                $res->placas    = $r->vhc_placas;
                $res->economico = $r->vhc_nombre;
                $res->salida    = $r->rta_horaSalida;
            }
            $res->asientos[$r->blt_number]= new \stdClass();
            $res->asientos[$r->blt_number]->blt_id  = $r->blt_id;
            $res->asientos[$r->blt_number]->status  = $r->ebl_nombre;
            $res->asientos[$r->blt_number]->number  = $r->blt_number;
            $res->asientos[$r->blt_number]->idBoleto= $r->blt_id;
            $res->asientos[$r->blt_number]->cliente = $r->blt_cliente;
            $res->asientos[$r->blt_number]->precio  = $r->rta_precio;
        }
        return $res;
    }
    public function nuevaCorrida(Request $re,Carbon $fecha,$rta,$vhc)
    {
        

        $values  = array("rta_id"=>$rta,"ecr_id"=>"1","vhc_id"=>$vhc,"crr_fecha"=>$fecha);
        $ins = DB::table("Corrida")->insertGetId($values,"crr_id");
        
        $res = $this->getSitsByDate($fecha);
        $res->status = "ok";
        $res->idcorrida = $ins;

        return response(json_encode($res), 200)->header('Access-Control-Allow-Origin', "*");
    }
    public function getVehiculos()
    {
        $sql =
        'SELECT * FROM Vehiculos ';
        $t = DB::select($sql);

        $res = new \stdClass();
        $res->autos = [];
        foreach ($t as $r) {
            $v = new \stdClass();
            $v->id = $r->vhc_id;
            $v->nombre = $r->vhc_marca ." ".$r->vhc_nombre . " ".$r->vhc_descripcion;
            array_push($res->autos,$v);
        }
        return response(json_encode($res), 200)->header('Access-Control-Allow-Origin', '*');
    }
    public function getRutas()
    {
        $sql =
        'SELECT * FROM cat_Ruta ';
        $t = DB::select($sql);

        $res = new \stdClass();
        $res->rutas = [];
        foreach ($t as $r) {
            $v = new \stdClass();
            $v->id = $r->rta_id;
            $v->nombre = $r->rta_origen ." - ".$r->rta_destino."[ ".$r->rta_horaSalida."]";
            array_push($res->rutas,$v);
        }
        return response(json_encode($res), 200)->header('Access-Control-Allow-Origin', '*');

    }
    public function getRutasCheckIn($fecha)
    {
        $sql =
        'SELECT * FROM Corrida
        INNER JOIN Vehiculos USING (vhc_id)
        INNER JOIN cat_Ruta USING (rta_id)
        INNER JOIN cat_EstadoCorrida USING ( ecr_id )
        WHERE crr_fecha = "'.$fecha.'"';

        $t = DB::select($sql);

        $res = new \stdClass();
        $res->rutas = [];
        foreach ($t as $r) {
            $v = new \stdClass();
            $v->crr_id = $r->crr_id;
            $v->horaSalida = $r->rta_horaSalida;
            $v->origen = $r->rta_origen;
            $v->destino = $r->rta_destino;
            $v->estado = $r->ecr_nombre;
            $v->placas = $r->vhc_placas;
            $v->descripcion = $r->vhc_descripcion;
            

            array_push($res->rutas, $v);
        }
        return response(json_encode($res), 200)->header('Access-Control-Allow-Origin', '*');
    }
    public function storeSit(Request $re,$icr)
    {
        $datos = $re->all();
        $where = [];
        $update = [];
        foreach ($datos as $value) {
            $res = explode("||",$value);
            DB::table("Boletos")->where('blt_id',$res[0])->update(['blt_cliente'=>$res[1],"ebl_id"=>3]);
        }
        $fecha = $this->getDateByTrip($icr);
        $res = $this->getSitsByDate($fecha);
        $res->status = "ok";
        $res->fecha  = $fecha;
        return response(json_encode($res), 200)->header('Access-Control-Allow-Origin', "*");
    }
    private function getDateByTrip($icr)
    {
        $sql = "SELECT crr_fecha FROM Corrida WHERE crr_id = ".$icr;
        $t = DB::select($sql);
        return $t[0]->crr_fecha;
    }
    public function cancelSit(Request $re, $icr)
    {
        $datos = $re->all();
        foreach ($datos as $value) {
            DB::table("Boletos")->where('blt_id',$value)->update(['blt_cliente'=>"","ebl_id"=>1]);
        }
        $fecha = $this->getDateByTrip($icr);
        $res = $this->getSitsByDate($fecha);
        $res->status = "ok";
        $res->fecha  = $fecha;
        return response(json_encode($res), 200)->header('Access-Control-Allow-Origin', "*");
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
