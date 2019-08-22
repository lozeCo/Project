<?php

namespace App\Http\Resources;

use App\Models\Project;
use League\Fractal;

class ProjectTransformer extends Fractal\TransformerAbstract
{
    public function transform(Project $project)
    {
        return [
            'id' => (int) $project->id,
            'key' => $project->key,
            'name' => $project->name,
            'objective' => $project->objective,
            'progress' => (int)$project->progress,
            'links' => [
                [
                    'rel' => 'self',
                    'uri' => '/project/'.$project->id,
                ]
            ],
        ];
    }
}