[![InformHer](https://raw.github.com/pup-progguild/InformHerWeb/master/img/informher-banner-with-icon.png)](http://pup-progguild.github.io/InformHerAPI/)
# InformHer API

[![Build Status](https://travis-ci.org/pup-progguild/InformHerAPI.png)](https://travis-ci.org/pup-progguild/InformHerAPI)
[![Scrutinizer Quality Score](https://scrutinizer-ci.com/g/pup-progguild/InformHerAPI/badges/quality-score.png?s=48c6685d02e8f073abb84040aa40ace2761a9275)](https://scrutinizer-ci.com/g/pup-progguild/InformHerAPI/)
[![Code Coverage](https://scrutinizer-ci.com/g/pup-progguild/InformHerAPI/badges/coverage.png?s=4cfeed62b33b895568ae357d9c22899fb3b1f9fc)](https://scrutinizer-ci.com/g/pup-progguild/InformHerAPI/)
[![Dependency Status](https://www.versioneye.com/user/projects/52f081ccec1375c64f000157/badge.png)](https://www.versioneye.com/user/projects/52f081ccec1375c64f000157)

This is the [InformHer API](https://github.com/pup-progguild/InformHerAPI) for the InformHer app for mobile and web.

### Documentation

Base API URL is

* http://informherapi.cloudapp.net/

**NOTE**: You'll be redirected to this page if you access the Base API URL without any appended URIs

### Usage

If in cURL,

```bash
$> curl --include --request GET 'http://informherapi.cloudapp.net/posts/2'
```

Sample JSON response would be,

```json
{
	"status": "POST_SHOW_SUCCESSFUL",
	"posts": {
		"id": "2",
		"title": "Is it alright to ask a question here?",
		"content": "To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.",
		"geolocation": null,
		"srclink": null,
		"created_at": "2014-02-27 07:40:21",
		"updated_at": "2014-02-27 07:40:21",
		"likers": "3",
		"is_featured": false,
		"comments_count": "8",
		"tags": [{
			"id": "5",
			"tagname": "news"
		}],
		"author": {
			"id": "2",
			"username": "ni-kun",
			"email": "ni-kun@informher.com",
			"profile": {
				"avatar_url": "https:\/\/secure.gravatar.com\/avatar\/fabe04b0ebf26d5e9bd05a504778f382?s=80&amp;r=g&amp;d=identicon",
				"badge": "The Second User",
				"twt_handle": "ni-kun",
				"facebook_username": "ni-kun",
				"bio": "This is the second user. Name was taken from the Japanese word for 'two'",
				"hompage_url": "http:\/\/ni-kun.com",
				"user_id": "2",
				"created_at": "2014-02-27 07:40:23",
				"updated_at": "2014-02-27 07:40:23",
				"email_address": "ni-kun@informher.com",
				"assigned_roles": ["User"],
				"username": "ni-kun"
			}
		},
		"category": {
			"name": "ask"
		}
	}
}
```

### Endpoints

We'll be making better docs, but we hope this would suffice in the meantime. Please see our uploaded [Postman Collection](https://www.getpostman.com/collections/8ccf078ae58b3ecdc019) for testing the endpoints.

| URI                                         | Short Description      | Action                                 | POST Params        | Required Roles (Any)				|
|---------------------------------------------|------------------------|----------------------------------------|---------|---------------|
| GET posts                                   | GetAllPosts            | PostController@index                   |         |               |
| GET posts/{id}                              | GetPost                | PostController@show                    |         |               |
| GET posts/{id}/comments/{id?}        		  | GetCommentsFromPost    | PostController@comments                |         |               |
| GET posts/{id}/tags                         | GetAllTagsFromPost     | PostController@tags                    |         |               |
| GET posts/{id}/likes                        | GetAllLikesFromPost    | PostController@likes                   |         |               |
| GET posts/{id}/comments/{id}/likes   	      | GetAllLikesFromComment | PostController@likes                   |         |               |
| POST posts/{post?}                          | CreateEditPost         | PostController@create_edit             | string:['title', 'content', 'geolocation'] , array:['tags']       |               |
| POST posts/{id}/comments/{id?}       		  | CreateUpdateComment    | PostController@create_update_comment   | string:['message']        |               |
| POST posts/{id}/like                        | LikePost               | PostController@like                    |         |               |
| POST posts/{id}/comments/{id}/like   		  | LikePostComment        | PostController@like                    |         |               |
| POST posts/search                           | SearchPosts            | PostController@search                  | params:[title,content,author,tags,all] , string:['query']        |               |
| DELETE posts/{id}/comments/{id?}     		  | DeletePostComment      | PostController@delete_comment          |         |               |
| DELETE posts/{id}                           | DeletePost             | PostController@destroy                 |         |               |
| GET tags                                    | Tags                   | TagController@index                    |         |               |
| GET category                                | Categories             | CategoryController@index               |         |               |
| GET user/confirm/{code}                     | ConfirmUser            | UserController@getConfirm              |         |               |
| GET user/reset/{token}                      | RetrieveResetPassToken | UserController@getReset                |         |               |
| POST user									  | RegisterUser	       | UserController@postIndex               | string:['username', 'password', 'email']        |               |
| POST user/login							  | LoginToInformHer       | UserController@postLogin               | string:['username', 'password']        |               |
| POST user/forgot							  | ProcessForgotPass      | UserController@postForgot              |         |               |
| POST user/reset 							  | ResetPassUsingToken    | UserController@postReset               |         |               |
| GET user/logout							  | LogoutToInformHer      | UserController@getLogout               |         |               |
| GET user                                    | GetLoggedUserProps     | UserController@getIndex                |         |               |
| GET user/posts    						  | GetLoggedUserPosts     | UserController@getPosts                |         |               |
| GET user/comments							  | GetLoggedUserComments  | UserController@getComments             |         |               |
| GET user/profile							  | GetLoggedUserProfile   | UserController@getProfile              |         |               |
| POST user/profile							  | ProcessUserProfile     | UserController@postProfile             |         |               |
| GET admin/users/{id}/delete                 | DeleteUser             | AdminController@delete_user          	|         | Administrator              |
| POST admin/users/{id}/promote               | PromoteUser            | AdminController@promote              	|         | Administrator              |
| POST admin/users/{id}/demote                | DemoteUser             | AdminController@demote                 |         | Administrator              |
| GET admin/posts/unapproved                  | ShowUnapprovedPosts    | AdminController@show_unapproved      	|         | Administrator, Moderator              |
| GET admin/posts/{id}/approve                | ApprovePost            | AdminController@show_post            	|         | Administrator, Moderator              |
| GET admin/posts/{id}/hide                   | HidePost               | AdminController@hide                 	|         | Administrator, Moderator              |
| POST admin/tags/{id?}                       | AddCreateTags          | TagController@create_edit              |         | Administrator, Moderator              |
| DELETE admin/tags/{id}                      | DeleteTag              | TagController@destroy                  |         | Administrator, Moderator               |

### BuiltWith

- [Laravel PHP](https://github.com/laravel/laravel)

### TechStack

- [PHP 5.4+](http://php.net)
- [Nginx](http://nginx.org/)
- [MariaDB 10+](https://mariadb.com/)
- [Memcached](http://memcached.org/)
- [Ubuntu 13.10](http://www.ubuntu.com)
- [Windows Azure](http://www.windowsazure.com)

### License

Copyright 2014 PUP Programming Guild

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

### Devs

- Mark Jayson Fuentes @[awkwardusername](https://github.com/awkwardusername) [lead]
- PUP Programming Guild @[pup-progguild](https://github.com/pup-progguild) [the rest of the team ;)]

About Us
--------

We're the [**PUP Programming Guild**](https://github.com/pup-progguild/), a bunch of students from the [Polytechnic University of the Philippines](http://www.pup.edu.ph) who consumes more time outside school, than inside classes. But really, we take our studies to heart. We deal with *competitions*, *hackathons*, and [*action movies*](http://www.youtube.com/watch?v=Xt_OgYMQFRY).

--------

Like us on [Facebook](https://www.facebook.com/PupProgrammingGuild) or Follow us on [Twitter](https://twitter.com/pup_progguild).