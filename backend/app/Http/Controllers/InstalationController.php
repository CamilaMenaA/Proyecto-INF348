<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class InstalationController extends Controller
{
    //

    public function get_all(){

        $instalation = DB::connection('mariadb')->select('SELECT * FROM tblinstalations');

        return $instalation;
    }

    public function get_id($id,$tipo){
        
        $sql = DB::connection('mariadb')
                ->table('tblinstalations')
                ->join($tipo,'tblinstalations.id','=',$tipo.'.id')
                ->where('tblinstalations.id','=',$id)
                ->get();

        return $sql;
    }

    public function delete_id($id){

        $sql = DB::connection('mariadb')
                ->table('tblinstalations')
                ->where('tblinstalations.id','=',$id)
                ->delete();

        return "La instalación con id: " . $id . "ha sido eliminada";
    }

    public function store(Request $request){
        $position = $request->input('position');
        $date = $request->input('date');
        $status = $request->input('status');
        $tecnicoid = $request->input('tecnicoid');
        $clientid = $request->input('clientid');
        $tipo = $request->input('tipo');


        $id = DB::connection('mariadb')
                ->table('tblinstalations')
                ->insertGetId([
                    'position'    => $position,
                    'date'  => $date,
                    'status'   => $status,
                    'tecnicoid' => $tecnicoid,
                    'clientid'    => $clientid,
                    'tipo' => $tipo,
                ]);

        switch($tipo) {
            case "coordinador":
                $tipoPlaca=$request->input('tipoPlaca');
                $firmware=$request->input('firmware');
                $sql = DB::connection('mariadb')
                        ->table('coordinador')
                        ->insert([
                            'id'    => $id,
                            'tipoPlaca' => $tipoPlaca,
                            'firmware' => $firmware,
                        ]);
                break;
                case "meteorologica":
                    $tipoPlaca=$request->input('tipoPlaca');
                    $firmware=$request->input('firmware');
                    $compania3G=$request->input('compania3G');
                    $sql = DB::connection('mariadb')
                            ->table('meteorologica')
                            ->insert([
                                'id'    => $id,
                                'tipoPlaca' => $tipoPlaca,
                                'firmware' => $firmware,
                                'compania3G'=> $compania3G,
                            ]);
                    break;
                    case "sonda":
                        $tipoPlaca=$request->input('tipoPlaca');
                        $largoSonda=$request->input('largoSonda');
                        $companiaComunicacion = $request->input('companiaComunicacion');
                        $sql = DB::connection('mariadb')
                                ->table('sonda')
                                ->insert([
                                    'id'    => $id,
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
                        $sql = DB::connection('mariadb')
                                ->table('canales')
                                ->insert([
                                    'id'    => $id,
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
                        $sql = DB::connection('mariadb')
                                ->table('pozos')
                                ->insert([
                                    'id'    => $id,
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

        return [
            "call" => "Se ha ejecutado la llamada a store", 
            "installid" => $id];
    }

    public function update(Request $request){

        $id = $request->id;
        $position = $request->position;
        $date = $request->date;
        $status = $request->status;
        $tecnicoid = $request->tecnicoid;
        $clientid = $request->clientid;
        $tipo = $request->tipo;

        $sql = DB::connection('mariadb')
                ->table('tblinstalations')
                ->where('tblinstalations.id','=',$id)
                ->update([
                    'position'    => $position,
                    'date'  => $date,
                    'status'   => $status,
                    'tecnicoid' => $tecnicoid,
                    'clientid'    => $clientid,
                    'tipo' => $tipo,     
                ]);

                switch($tipo) {
                    case "coordinador":
                        $tipoPlaca=$request->input('tipoPlaca');
                        $firmware=$request->input('firmware');
                        $sql = DB::connection('mariadb')
                                ->table('coordinador')
                                ->where('coordinador.id','=',$id)
                                ->update([
                                    'tipoPlaca' => $tipoPlaca,
                                    'firmware' => $firmware,
                                ]);
                        break;
                        case "meteorologica":
                            $tipoPlaca=$request->input('tipoPlaca');
                            $firmware=$request->input('firmware');
                            $compania3G=$request->input('compania3G');
                            $sql = DB::connection('mariadb')
                                    ->table('meteorologica')
                                    ->where('meteorologica.id','=',$id)
                                    ->update([
                                        'tipoPlaca' => $tipoPlaca,
                                        'firmware' => $firmware,
                                        'compania3G'=> $compania3G,
                                    ]);
                            break;
                            case "sonda":
                                $tipoPlaca=$request->input('tipoPlaca');
                                $largoSonda=$request->input('largoSonda');
                                $companiaComunicacion = $request->input('companiaComunicacion');
                                $sql = DB::connection('mariadb')
                                        ->table('sonda')
                                        ->where('sonda.id','=',$id)
                                        ->update([
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
                                $sql = DB::connection('mariadb')
                                        ->table('canales')
                                        ->where('canales.id','=',$id)
                                        ->update([
                                            'id'    => $id,
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
                                $sql = DB::connection('mariadb')
                                        ->table('pozos')
                                        ->where('pozos.id','=',$id)
                                        ->update([
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
        
        return "Se ha actualizado la instalacion con id: ".$id.".";
    }
}
