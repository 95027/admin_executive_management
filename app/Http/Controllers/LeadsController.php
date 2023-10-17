<?php

namespace App\Http\Controllers;

use App\Models\Lead;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class LeadsController extends Controller
{
    public function create(){
        return view('leads.lead');
    }

    public function store(Request $request){

        $request->validate([
            'name' => 'required',
            'email' => 'required | email',
            'phone' => 'required | numeric',
            'category' => 'required',
            'remarks' => 'required',
        ]);

        $userid = Auth()->user()->id;
        $name = request('name');
        $email = request('email');
        $phone = request('phone');
        $category = request('category'); 
        $remarks = request('remarks');

        // checking for duplicate emails before inserting
        if(Lead::where('email', $email)){
            return Lead::where('email', $email)->get(); 
        }
            Lead::create([
                'name' => $name,
                'email' => $email, 
                'phone' => $phone,
                'category' => $category,
                'remarks' => $remarks,
                'userid' => $userid,
            ]);
        
       return redirect()->route('home')->with('message', 'Your lead added successfully...');
    }

    public function edit($id){
        $lead = Lead::find($id);

        return view('leads.edit', compact('lead'));
    }

    public function update(Request $request){

        $id = request('id');
        $lead = Lead::find($id);

        $request->validate([
            'name' => 'required',
            'email' => 'required | email',
            'phone' => 'required | numeric',
            'category' => 'required',
            'remarks' => 'required',
        ]);

        $userid = Auth()->user()->id;
        $name = request('name');
        $email = request('email');
        $phone = request('phone');
        $category = request('category');
        $remarks = request('remarks');

        $lead -> update([
            'name' => $name,
            'email' => $email, 
            'phone' => $phone,
            'category' => $category,
            'remarks' => $remarks,
            'userid' => $userid,
        ]);

        return redirect()->route('home')->with('message', 'Your lead details updated successfully...');

    }

    public function delete($id){

        $lead = Lead::find($id);
        $lead ->delete();

        return redirect()->route('home')->with('message', 'Your lead details deleted successfully...');
    }

    // for updating the status
    public function status($id){
        $lead = Lead::find($id);
        $currstatus = $lead->status;

        if($currstatus == "active"){
            $lead->update([
                'status' => "not active",
            ]);
        }
        else{
            $lead->update([
                'status' => "active",
            ]);
        }
        return redirect()->route('home')->with('message', 'Your lead status updated successfully...');
    }
}
