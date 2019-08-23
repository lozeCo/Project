<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    //
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'user_id', 'objective', 'key', 'progress',
    ];

    public function owner()
    {
        return $this->hasOne(User::class);
    }
}
