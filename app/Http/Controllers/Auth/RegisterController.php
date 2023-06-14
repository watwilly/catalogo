<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Models\USer;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{


    use RegistersUsers;


    protected $redirectTo = '/first';

    public function __construct()
    {
        $this->middleware('guest');
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:30'],
            'apellido'=>['required','string','max:50'],
            'email' => ['required', 'string', 'email', 'max:40', 'unique:users'],
            'telefono'=>['required','integer', 'unique:users'],
            'provincia_id'=>['required','integer'],
            'localidad_id'=>['required','integer'],
            'direccion'=>['required','string','max:50'],
            'cpa'=>['required','integer'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    protected function create(array $data)
    {   

        return USer::create([
            'name' => $data['name'],
            'apellido'=>$data['apellido'],
            'email' => $data['email'],
            'telefono' => $data['telefono'],
            'provincia_id' => $data['provincia_id'],
            'localidad_id' => $data['localidad_id'],
            'direccion' => $data['direccion'],
            'cpa' => $data['cpa'],
            'role_id'=>5,
            'password' => Hash::make($data['password']),
        ]);

    }
}
