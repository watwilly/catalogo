<?php

namespace App\Http\Controllers\Auth;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use Voyager;
use File;
use Hash;
use Mail;
use \App\User as user;
use \App\Mail\AccountValidate as accountvalidate;
use Illuminate\Support\Facades\Validator;
use \App\Models\Payments as paid;

class UserController extends Controller
{
    public function dashboard()
    {
    	return view('dashboard.index');
    }
    public function compras(Request $request)
    {   
        $user = Auth::user();
        $payments = $user->comprador_paymentId()->select("id","external_reference","status","monto","created_at", "pasarela");
        //->leftjoin('payments_details as pd', "payments.id","=","pd.payment_id")
      /*  if ($pub=$request->publicacion) {
            $payments->where("pc.producto_name", "LIKE","%".$pub."%");
        }*/

        if ($request->desde && $request->hasta) {
            $desde = $request->desde;
            $hasta = $request->hasta;
            $payments->whereBetween("created_at",[$desde,$hasta]);
        }

        if ($orden=$request->orden) {
            $payments->orderBy("created_at",$orden);
        }else{
            $payments->orderBy("created_at","DESC");
        }

        $url = url()->full();
        $query = $payments->paginate(15)->setPath($url);
   

        return view('auth.user.compras', compact("query"));
    }

    public function detail(Request $request)
    {
       $user = Auth::user();
       $payment = $user->comprador_paymentId()->where("id",$request->payment_id)->first();
       if(is_null($payment)) {
            return redirect()->back()->with(["status"=>"danger","msg"=>"El pago que quieres ver no esta disponible"]);
       }

       $items = $payment->comprasId()->select("producto_name","precio","cantidad","images")->get();


       return view("auth.user.user-compra", compact("payment","items"));
    }
 
   
 
    public function index()
    {

        if (Auth::check()) {
            $usuario = Auth::user();

            return view('auth.user.cuenta')
            ->with('provincias', $this->get_all_provincias())
            ->with('user', $usuario);

        }else{
            return redirect('/');
        }
    }


    public function edit(Request $request)
    {


        $user = Auth::user();
        
        if ($request->newPassword) {
            $user->password = Hash::make($request->newPassword);
        }

        if ($email = $request->email) {
            Validator::make($request->input(), [
                'email' => ['unique:users'],
            ])->validate();
            $user->email = $email;
        }
        if ($name = $request->name) {
            $user->name = $name;
        }
        if ($apellido = $request->apellido) {
            $user->apellido = $apellido;
        }
        if ($telefono = $request->telefono) {
            $user->telefono = $telefono;
        }
        if ($direccion = $request->direccion) {
            $user->direccion = $direccion;
        }
   
        $user->save();

        return redirect()->back()->with(['status'=>'success', 'msg'=>'Su cuenta ha sido modificada']);

    }

    public function validate_account(Request $request)
    {
        $user = user::where('email', $request->email)->whereNull('active')->first();

        if (is_null($user)) {
            return redirect('/validate/false');
        }

        $user->active = 1;
        $user->save();

        return redirect('/validate/true');
    }

    public function validateAccount(Request $request)
    {
        return view('user.validate')->with('status',$request->status);
    }

    public function emailvalidate()
    {
       $user = Auth::user();
       if ($user->active==0) {
        $data=[
            "email"=>$user->email,
            "name"=>$user->name,
            "apellido"=>$user->apellido,
            "_token"=>"RE-VALIDATE"
        ];
        Mail::to("$user->email")
            ->send(new accountvalidate($data));
        return response()->json(["status"=>"info","msg"=>"Se ha enviado un email a su correo para validar su cuenta"]);
       }

       return response()->json(["status"=>"success","msg"=>"El usuario ya esta validado"]);
    }

    public function first()
    {
        $user = Auth::user();

        return view('shared.first')
        ->with('user',$user);
    }
}
