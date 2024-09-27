<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HistoryController extends Controller
{
    //

    public function get_all(){

        $instalation = DB::connection('mariadb')->select('SELECT * FROM tblhistory');

        return $instalation;
    }


    public function get_historial($id_historial){
        

        // reemplazar
        $tipo = DB::connection('mariadb')
                ->table('tblhistory')
                ->where('tblhistory.id','=',$id_historial)
                ->select('tipo','id_equipo_asociado')
                ->value('tipo');
        $id_equipo_asociado = DB::connection('mariadb')
                ->table('tblhistory')
                ->where('tblhistory.id','=',$id_historial)
                ->select('tipo','id_equipo_asociado')
                ->value('id_equipo_asociado');

        $sql = $sql = DB::connection('mariadb')
                ->table('tblhistory')
                ->join($tipo.'_hist','tblhistory.id_equipo_asociado','=',$tipo.'_hist.id_hist')
                ->where('tblhistory.id','=',$id_historial)
                ->first();

        return $sql;
    }

    public function get_equipo_asociado($tipo, $id_equipo_asociado){
        
        $sql = DB::connection('mariadb')
                ->table($tipo.'_hist')
                ->where($tipo.'_hist.id_equipo','=',$id_equipo_asociado)
                ->get();
        
        return $sql;
    }




    public function get_historials_by_id($id){
        
        $sql = DB::connection('mariadb')
                ->table('tblhistory')
                ->where('tblhistory.instalationid','=',$id)
                ->orderBy('date_history', 'desc')
                ->get();

        return $sql;
    }

    public function store(Request $request){

        $position = $request->input('position');
        $date = $request->input('date');
        $status = $request->input('status');
        $tecnicoid = $request->input('tecnicoid');
        $clientid = $request->input('clientid');
        $instalationid = $request->input('installid');
        $action = $request->input('action');
        $tipo = $request->input('tipo');
        $id = 0;

        switch($tipo) {
            case "coordinador":
                $tipoPlaca=$request->input('tipoPlaca');
                $firmware=$request->input('firmware');
                $id = DB::connection('mariadb')
                                ->table('coordinador_hist')
                                ->insertGetId([
                                    'id_equipo' => $instalationid,
                                    'tipoPlaca' => $tipoPlaca,
                                    'firmware' => $firmware,
                                ]);
                break;

            case "meteorologica":
                $tipoPlaca=$request->input('tipoPlaca');
                $firmware=$request->input('firmware');
                $compania3G=$request->input('compania3G');
                $id = DB::connection('mariadb')
                        ->table('meteorologica_hist')
                        ->insertGetId([
                            'id_equipo'    => $instalationid,
                            'tipoPlaca' => $tipoPlaca,
                            'firmware' => $firmware,
                            'compania3G'=> $compania3G,
                        ]);
                break;


                
            case "sonda":
                $tipoPlaca=$request->input('tipoPlaca');
                $largoSonda=$request->input('largoSonda');
                $companiaComunicacion = $request->input('companiaComunicacion');
                $id = DB::connection('mariadb')
                        ->table('sonda_hist')
                        ->insertGetId([
                            'id_equipo'    => $instalationid,
                            'tipoPlaca' => $tipoPlaca,
                            'largoSonda' => $largoSonda,
                            'companiaComunicacion' => $companiaComunicacion,
                        ]);
                break;
            case "canales":
                $tipoPlaca=$request->input('tipoPlaca');
                $firmware=$request->input('firmware');
                $companiaComunicacion = $request->input('companiaComunicacion');
                $alturaMaxima = $request->input("alturaMaxima");
                $alturaSensor = $request->input("alturaSensor");
                $alturaAgua = $request ->input("alturaAgua");
                $id = DB::connection('mariadb')
                        ->table('canales_hist')
                        ->insertGetId([
                            'id_equipo'    => $instalationid,
                            'tipoPlaca' => $tipoPlaca,
                            'firmware' => $firmware,
                            'alturaMaxima' => $alturaMaxima,
                            'alturaSensor' => $alturaSensor,
                            'alturaAgua' => $alturaAgua,
                        ]);
                break;
            case "pozos":
                $tipoPlaca=$request->input('tipoPlaca');
                $firmware=$request->input('firmware');
                $companiaComunicacion = $request->input('companiaComunicacion');
                $profundidadPozo = $request->input("profundidadPozo");
                $nivelEstatico = $request->input("nivelEstatico");
                $nivelDinamico = $request ->input("nivelDinamico");
                $distanciaSensor = $request ->input("distanciaSensor");
                $factorPulsos = $request ->input("factorPulsos");
                $tresG = $request ->input("tresG");
                $compania3G = $request ->input("compania3G");
                $tipoEnergia = $request ->input("tipoEnergia");
                $id = DB::connection('mariadb')
                        ->table('pozos_hist')
                        ->insertGetId([
                            'id_equipo'    => $instalationid,
                            'tipoPlaca' => $tipoPlaca,
                            'firmware' => $firmware,
                            'profundidadPozo' => $profundidadPozo,
                            'nivelDinamico' => $nivelDinamico,
                            'nivelEstatico' => $nivelEstatico,
                            'distanciaSensor' => $distanciaSensor,
                            'factorPulsos' => $factorPulsos,
                            '3G' => $tresG,
                            'compania3G' => $compania3G,
                            'tipoEnergia' => $tipoEnergia, 
                        ]);
                break;

            default:
                break;
        }


        $historyid = DB::connection('mariadb')
                ->table('tblhistory')
                ->insertGetId([
                    'action' => $action,
                    'date_history' => date('Y-m-d H:i:s'),
                    'instalationid' => $instalationid,
                    'position'    => $position,
                    'date_instalation'  => $date,
                    'status'   => $status,
                    'tecnicoid' => $tecnicoid,
                    'clientid'    => $clientid,
                    'id_equipo_asociado' => $id,
                    'tipo' => $tipo
                ]);



        return "Se ha ejecutado la llamada a store ";
    }

}
