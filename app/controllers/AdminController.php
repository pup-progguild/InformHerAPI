<?php
/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 2/21/14
 * Time: 4:16 AM
 */

class AdminController extends BaseController {
	public function promote(User $user) {
		$roles = Input::all();

		foreach($roles as $role) {
			$role_a = DB::table('roles')->where('name', '=', $role)->first();

			if(!(DB::table('assigned_roles')->where('user_id', '=', $user->id)->where('role_id', '=', $role_a->id)->exists())) {
				$user->roles()->attach($role_a->id);
			}
		}

		return Response::json([
			'status'        =>  'USER_PROMOTE_SUCCESSFUL',
		    'description'   =>  implode(' , ', $roles) . ' role[s] added to ' . $user->username
		]);
	}

	public function demote(User $user) {
		$roles = Input::all();

		foreach ($roles as $role) {
			$role_a = DB::table('roles')->where('name', '=', $role)->first();

			if(DB::table('assigned_roles')->where('user_id', '=', $user->id)->where('role_id', '=', $role_a->id)->exists()) {
				$user->roles()->detach($role_a->id);
			}
		}

		return Response::json([
			'status'      => 'USER_DEMOTE_SUCCESSFUL',
			'description' => implode(' , ', $roles) . ' role[s] removed from ' . $user->username
		]);
	}

	public function delete_user(User $user) {   // TODO: Hardness level of User Deletion over 9000
		Like::where('user_id', '=', $user->id)->delete();
		Comment::where('user_id', '=', $user->id)->delete();
		Post::where('user_id', '=', $user->id)->delete();

		AssignedRole::where('user_id', '=', $user->id)->delete();

		if($user->delete()) {
			return Response::json([
				'status'    =>  'USER_DELETE_SUCCESSFUL'
			], 200);
		}

		return Response::json([
			'status' => 'USER_DELETE_FAILED'
		], 200);
	}

	public function show_unapproved() {
		$posts = new Post;

		$post = $posts->not_shown()->paginate(10);

		if ($post->count() != 0) {
			return Response::json([
				'status' => 'POST_SHOW_UNAPPROVED_SUCCESSFUL',
				'posts'  => $post
			], 200);
		}

		return Response::json([
			'status'      => 'POST_SHOW_UNAPPROVED_FAILED',
			'description' => 'Returned empty result'
		], 404);
	}

	public function show_post(Post $post) {
		$property = Property::where('properties_id', '=', $post->id)->where('properties_type', '=', 'post')->first();

		if($property->is_shown === 0) {
			$property->is_shown    = 1;
			$property->last_modified_by = Confide::user()->username;

			$post->properties()->save($property);

			if ($post->save()) {
				return Response::json([
					'status' => 'POST_APPROVAL_FOR_STREAM_SUCCESSFUL',
				    'description'   => 'Post approved by ' . $property->last_modified_by
				], 200);
			}
		} else {
			return Response::json([
				'status' => 'POST_APPROVAL_FOR_STREAM_FAILED',
			    'description' => 'Post already approved by ' . $property->last_modified_by
			], 200);
		}

		return Response::json([
			'status' => 'POST_APPROVAL_FOR_STREAM_FAILED',
		    'description' => 'Details of error unknown'
		], 200);
	}

	public function hide(Post $post) {
		$property = Property::where('properties_id', '=', $post->id)->where('properties_type', '=', 'post')->first();

		if($property->is_shown === 1) {
			$property->is_shown    = 0;
			$property->last_modified_by = Confide::user()->username;

			$post->properties()->save($property);

			if ($post->save()) {
				return Response::json([
					'status' => 'POST_HIDING_FOR_STREAM_SUCCESSFUL',
					'description'   => 'Post hidden by ' . $property->last_modified_by
				], 200);
			}
		} else {
			return Response::json([
				'status' => 'POST_HIDING_FOR_STREAM_FAILED',
				'description' => 'Post already hidden by ' . $property->last_modified_by
			], 200);
		}

		return Response::json([
			'status' => 'POST_HIDDEN_FOR_STREAM_FAILED',
			'description' => 'Details of error unknown'
		], 200);
	}

	public function show_Shoutout() {
		$post = new Post;

		$post = $post->shoutout()->paginate(10);

		if ($post->count() != 0) {
			return Response::json([
				'status' => 'POST_SHOW_SUCCESSFUL',
				'posts'  => $post->toArray()
			], 200);
		}

		return Response::json([
			'status'      => 'POST_SHOW_FAILED',
			'description' => 'Returned empty result'
		], 404);
	}
}
