<x-app-layout>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
        <link rel="stylesheet" href="{{asset('styles/style.css')}}">
    </head>
    <body>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mt-5">
                            <a href="{{route('create')}}">
                                <button class="border-2 rounded p-1">Create a Lead</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mt-3">
                        @if (session()->get('message'))
                            <p x-data="{show:true}" x-init="setTimeout(() => show = false, 3000)" x-show="show" class="text-success">{{session()->get('message')}}</p>
                        @endif
                    </div>
                </div>
            </div>
        </section>
        <section class="mt-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mx-auto">
                        <div class="mb-4">
                            <form action="{{route('home')}}" method="get" accept-charset="UTF-8" role="search">
                                <div class="d-flex">
                                    <input class="form-control me-1" type="search" placeholder="search..." name="search" value="{{request('search')}}"/>
                                    <input class="form-control flex-1" value="Search" type="submit" />
                                </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        @if(count($leads) > 0)
                        <table class="w-100">
                            <thead>
                                <tr>
                                    <th>S.no</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Category</th>
                                    <th>Remarks</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($leads as $lead)
                                <tr>
                                    <td>{{$leads->firstItem()+$loop->index}}</td>
                                    <td>{{$lead->name}}</td>
                                    <td>{{$lead->email}}</td>
                                    <td>{{$lead->phone}}</td>
                                    <td>{{$lead->category}}</td>
                                    <td>{{$lead->remarks}}</td>
                                    <td>
                                        <a href="{{route('status', $lead->id)}}">
                                            <button class="bg-primary text-white py-1 px-2 me-1 rounded {{$lead->status == "active" ? 'bg-success' : 'bg-secondary'}}">
                                                {{$lead->status}}
                                            </button>
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <a href="{{route('edit', $lead->id)}}">
                                            <button class="bg-primary text-white py-1 px-3 me-1 rounded"><i class="fa-regular fa-pen-to-square"></i></button>
                                        </a>
                                        <a href="{{route('delete', $lead->id)}}" onclick="return confirm('Are you sure to delete it ?')">
                                            <button class="bg-danger text-white py-1 px-3 rounded"><i class="fa-solid fa-trash"></i></button>
                                        </a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                        @else
                        <h6 class="text-danger text-center">No records found....</h6>
                        @endif
                        <div class="mt-3 mb-3">
                            {!! $leads->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    </html>
</x-app-layout>
