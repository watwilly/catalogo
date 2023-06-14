<?php

namespace Illuminate\Foundation\Auth;

use Illuminate\Auth\Events\Registered;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use \App\Mail\AccountValidate as accountvalidate;
use Mail;

trait RegistersUsers
{
    use RedirectsUsers;

    /**
     * Show the application registration form.
     *
     * @return \Illuminate\View\View
     */
    public function showRegistrationForm()
    {   
        return view('auth.register')->with('provincias', $this->get_all_provincias());
    }

    /**
     * Handle a registration request for the application.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\JsonResponse
     */
    public function register(Request $request)
    {
        #Verify google recaptcha
        $url = "https://www.google.com/recaptcha/api/siteverify";
        $data = [
            "secret"=>setting('site.ccdg'),
            "response"=>$_POST["g-recaptcha-response"]
        ];
        $recaptcha = json_decode(Self::CallAPI("POST",$url, null, $data));
        if($recaptcha->success == false){
            return redirect()->back()->with(["status"=>"danger", "msg"=>"El captcha es obligatorio"]);
        }
        #end recaptcha

        $this->validator($request->all())->validate();

        event(new Registered($user = $this->create($request->all())));

        $this->guard()->login($user);

        if ($response = $this->registered($request, $user)) {
            return $response;
        }

        return $request->wantsJson()
                    ? new JsonResponse([], 201)
                    : redirect($this->redirectPath());
    }

    /**
     * Get the guard to be used during registration.
     *
     * @return \Illuminate\Contracts\Auth\StatefulGuard
     */
    protected function guard()
    {
        return Auth::guard();
    }

    /**
     * The user has been registered.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  mixed  $user
     * @return mixed
     */
    protected function registered(Request $request, $user)
    {
        Mail::to($user->email)
            ->send(new accountvalidate($request->all()));
    }
}
