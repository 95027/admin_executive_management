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
        <link rel="stylesheet" href="{{asset('styles/style.css')}}">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-5 mx-auto mt-5 mb-5">
                    <h4 class="mb-4 text-primary">Updating a lead</h4>
                    <form action="{{route('update')}}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label class="form-label" for="">Name of a lead :</label>
                            <input class="form-control" type="hidden" name="id" value="{{$lead->id}}" />
                            <input class="form-control" type="text" name="name" placeholder="Name" value="{{$lead->name}}" />
                            <span class="text-danger pt-2">
                                @error('name')
                                {{$message}}
                                @enderror
                            </span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="">Enter your email id :</label>
                            <input class="form-control" type="email" name="email" placeholder="Email" value="{{$lead->email}}" />
                            <span class="text-danger pt-2">
                                @error('email')
                                {{$message}}
                                @enderror
                            </span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="">Enter your phone number :</label>
                            <input class="form-control" type="number" name="phone" placeholder="Phone number" value="{{$lead->phone}}" />
                            <span class="text-danger pt-2">
                                @error('phone')
                                {{$message}}
                                @enderror
                            </span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="">Categories</label>
                            <select name="category" class="form-select">
                                <option value="">--select your category--</option>
                                <option value="Hot" {{old('category', $lead->category) == "Hot" ? 'selected' : ''}}>Hot</option>
                                <option value="Warm" {{old('category', $lead->category) == "Warm" ? 'selected' : ''}}>Warm</option>
                                <option value="Cold" {{old('category', $lead->category) == "Cold" ? 'selected' : ''}}>Cold</option>
                            </select>
                            <span class="text-danger pt-2">
                                @error('category')
                                {{$message}}
                                @enderror
                            </span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="">Remarks :</label>
                            <textarea class="form-control" type="text" name="remarks" placeholder="Anything to say ?" value="{{old('remarks')}}">{{$lead->remarks}}</textarea>
                            <span class="text-danger pt-2">
                                @error('remarks')
                                {{$message}}
                                @enderror
                            </span>
                        </div>
                        <div class="mb-3 text-right">
                            <input type="submit" value="Update" class="border-2 p-1 bg-primary text-white rounded"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    </html>
</x-app-layout>