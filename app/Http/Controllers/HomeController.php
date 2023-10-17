<?php

namespace App\Http\Controllers;

use App\Models\Lead;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function home(Request $request){

        if(Auth::id()){
            $usertype = auth()->user()->usertype;

            if($usertype == "executive"){
                $curruser = Auth()->user()->id;
                $leads = Lead::where('userid', $curruser)->latest()->get();
                return view('dashboard', compact('leads'));
            }
            else if($usertype == "admin"){

                $keyword = $request->get('search');

                if(!empty($keyword)){
                    $leads = Lead::where('name', 'LIKE', "%$keyword%")
                    ->orWhere('email', 'LIKE', "%$keyword%")
                    ->latest()->paginate(5);
                }
                else{
                    $leads = Lead::latest()->paginate(5);
                }

                return view('admin.adminhome', compact('leads'));
            }
            else{
                return redirect()->back();
            }
        }

    }
}
