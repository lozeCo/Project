<?php

namespace App\Http\Controllers\Project;

use App\Http\Controllers\Controller;
use App\Models\Project;
use Illuminate\Http\Request;
use League\Fractal\Manager;
use League\Fractal;
use App\Http\Resources\ProjectTransformer;

class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $fractal = new Manager();
        $project = new Project();

        $data = $request->all();
        $project->fill($data);
        $project->user_id = 1;
        $project->save();

        $resource = new Fractal\Resource\Item($project, new ProjectTransformer);
        echo $fractal->createData($resource)->toJson();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Project $id)
    {   
        $fractal = new Manager();

        if ($id->exists) {
            // return new ProjectResource($id);
            $resource = new Fractal\Resource\Item(Project::find($id->id), new ProjectTransformer);
        } else {
            // return new ProjectCollection(Project::all());
            $resource = new Fractal\Resource\Collection(Project::orderBy('id',"DESC")->get(), new ProjectTransformer);
        }
        
        return response($fractal->createData($resource)->toJson(), 200)->header('Access-Control-Allow-Origin', "*");
        // echo $fractal->createData($resource)->toJson();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function edit(Project $project)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Project $project)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function destroy(Project $project)
    {
        //
    }
}
