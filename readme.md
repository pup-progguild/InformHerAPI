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
$> curl --include --request GET 'http://informherapi.cloudapp.net/posts/1'
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
    "likers": "2",
    "is_featured": false,
    "tags": [
      {
        "id": "5",
        "tagname": "news"
      }
    ],
    "author": {
      "id": "2",
      "username": "ni-kun",
      "email": "ni-kun@informher.com"
    },
    "category": {
      "name": "ask"
    }
  }
}
```

### Endpoints

We'll be making better docs, but we hope this would suffice in the meantime. Please see our uploaded [Postman Collection](https://www.getpostman.com/collections/cc6fb482c594bbb81f07) for using the endpoints with fields.

| URI                                         | Short Description      | Action                               | Needs Auth?     | Required Roles (Any)				|
|---------------------------------------------|------------------------|--------------------------------------|-----------------|---------------|
| GET posts                                   | GetAllPosts            | PostController@index                 |                 |               |
| GET posts/{post}                            | GetPost                | PostController@show                  |                 |               |
| GET posts/{post}/comments/{comment?}        | GetCommentsFromPost    | PostController@comments              |                 |               |
| GET posts/{post}/tags                       | GetAllTagsFromPost     | PostController@tags                  |                 |               |
| GET posts/{post}/likes                      | GetAllLikesFromPost    | PostController@likes                 |                 |               |
| GET posts/{post}/comments/{comment}/likes   | GetAllLikesFromComment | PostController@likes                 |                 |               |
| POST posts/{post?}                          | CreateEditPost         | PostController@create_edit           | yes            |               |
| POST posts/{post}/comments/{comment?}       | CreateUpdateComment    | PostController@create_update_comment | yes            |               |
| POST posts/{post}/like                      | LikePost               | PostController@like                  | yes            |               |
| POST posts/{post}/comments/{comment}/like   | LikePostComment        | PostController@like                  | yes            |               |
| DELETE posts/{post}/comments/{comment?}     | DeletePostComment      | PostController@delete_comment        | yes            |               |
| DELETE posts/{post}                         | DeletePost             | PostController@destroy               | yes            |               |
| GET tags                                    | Tags                   | TagController@index                  |                 |               |
| GET category                                | Categories             | CategoryController@index             |                 |               |
| GET user/confirm/{code}                     | ConfirmUser            | UserController@getConfirm            |                 |               |
| GET user/reset/{token}                      | RetrieveResetPassToken | UserController@getReset              |                 |               |
| POST user									  | RegisterUser	       | UserController@postIndex             |                 |               |
| POST user/login							  | LoginToInformHer       | UserController@postLogin             |                 |               |
| POST user/forgot							  | ProcessForgotPass      | UserController@postForgot            |                 |               |
| POST user/reset 							  | ResetPassUsingToken    | UserController@postReset             |                 |               |
| GET user/logout							  | LogoutToInformHer      | UserController@getLogout             |                 |               |
| GET user                                    | GetLoggedUserProps     | UserController@getIndex              |                 |               |
| GET user/posts    						  | GetLoggedUserPosts     | UserController@getPosts              |                 |               |
| GET user/comments							  | GetLoggedUserComments  | UserController@getComments           |                 |               |
| GET user/profile							  | GetLoggedUserProfile   | UserController@getProfile            |                 |               |
| POST user/profile							  | ProcessUserProfile     | UserController@postProfile           |     		 |               |
| GET admin/users/{user}/delete               | DeleteUser             | AdminController@delete_user          | yes 		| Administrator              |
| POST admin/users/{user}/promote             | PromoteUser            | AdminController@promote              | yes 		| Administrator              |
| POST admin/users/{user}/demote              | DemoteUser            | AdminController@demote               | yes 		| Administrator              |
| GET admin/posts/unapproved                  | ShowUnapprovedPosts    | AdminController@show_unapproved      | yes 			| Administrator, Moderator              |
| GET admin/posts/{post}/approve              | ApprovePost            | AdminController@show_post            | yes 			| Administrator, Moderator              |
| GET admin/posts/{post}/hide                 | HidePost               | AdminController@hide                 | yes 			| Administrator, Moderator              |
| POST admin/tags/{tag?}                      | AddCreateTags          | TagController@create_edit            | yes 			| Administrator, Moderator              |
| DELETE admin/tags/{tag}                     | DeleteTag              | TagController@destroy                | yes 		| Administrator, Moderator               |

### BuiltWith

- [Laravel PHP](https://github.com/laravel/laravel)

### TechStack

- PHP 5.4+
- Nginx
- MariaDB 10+

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
