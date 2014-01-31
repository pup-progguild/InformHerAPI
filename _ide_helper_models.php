<?php
/**
 * An helper file for your Eloquent Models
 * Copy the phpDocs from this file to the correct Model,
 * And remove them from this file, to prevent double declarations.
 *
 * @author Barry vd. Heuvel <barryvdh@gmail.com>
 */


namespace {
/**
 * Created by PhpStorm.
 * 
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 10:19 AM
 *
 * @property integer $id
 * @property integer $user_id
 * @property integer $role_id
 */
	class AssignedRole {}
}

namespace {
/**
 * Created by PhpStorm.
 * 
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 10:57 AM
 *
 * @property integer $id
 * @property string $name
 * @property string $description
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 */
	class Category {}
}

namespace {
/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/13/14
 * Time: 12:37 AM
 *
 * @property integer $id
 * @property string $message
 * @property integer $user_id
 * @property integer $post_id
 * @property integer $comment_id
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property \Carbon\Carbon $deleted_at
 * @property-read \User $author
 * @property-read \Post $post
 */
	class Comment {}
}

namespace {
/**
 * Created by PhpStorm.
 * 
 * User: REDFOX Wizpad
 * Date: 1/31/14
 * Time: 2:48 PM
 *
 * @property integer $id
 * @property integer $comment_id
 * @property integer $user_id
 */
	class CommentLike {}
}

namespace {
/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/2/14
 * Time: 1:41 AM
 *
 * @property integer $id
 * @property string $title
 * @property string $content
 * @property integer $user_id
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property \Carbon\Carbon $deleted_at
 * @property string $geolocation
 * @property string $srclink
 * @property-read \User $author
 * @property-read \Illuminate\Database\Eloquent\Collection|\Comment[] $comments
 * @property-read \Illuminate\Database\Eloquent\Collection|\Tag[] $tags
 */
	class Post {}
}

namespace {
/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/13/14
 * Time: 12:39 AM
 *
 * @property integer $id
 * @property integer $post_id
 * @property integer $comment_id
 * @property integer $user_id
 */
	class PostLike {}
}

namespace {
/**
 * An Eloquent Model: 'PostTags'
 *
 * @property integer $id
 * @property integer $post_id
 * @property integer $tag_id
 * @property-read \Post $tags
 */
	class PostTags {}
}

namespace {
/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/13/14
 * Time: 12:37 AM
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $role
 * @property string $name
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 */
	class Role {}
}

namespace {
/**
 * Created by PhpStorm.
 * 
 * User: hoshi~
 * Date: 1/13/14
 * Time: 12:38 AM
 *
 * @property integer $id
 * @property string $tagname
 */
	class Tag {}
}

namespace {
/**
 * An Eloquent Model: 'User'
 *
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property string $email
 * @property string $twt_handle
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 */
	class User {}
}

