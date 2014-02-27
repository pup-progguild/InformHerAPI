# InformHer API

[![Build Status](https://travis-ci.org/pup-progguild/InformHerAPI.png)](https://travis-ci.org/pup-progguild/InformHerAPI)
[![Scrutinizer Quality Score](https://scrutinizer-ci.com/g/pup-progguild/InformHerAPI/badges/quality-score.png?s=48c6685d02e8f073abb84040aa40ace2761a9275)](https://scrutinizer-ci.com/g/pup-progguild/InformHerAPI/)
[![Code Coverage](https://scrutinizer-ci.com/g/pup-progguild/InformHerAPI/badges/coverage.png?s=4cfeed62b33b895568ae357d9c22899fb3b1f9fc)](https://scrutinizer-ci.com/g/pup-progguild/InformHerAPI/)
[![Dependency Status](https://www.versioneye.com/user/projects/52f081ccec1375c64f000157/badge.png)](https://www.versioneye.com/user/projects/52f081ccec1375c64f000157)

This is the [InformHer API](https://github.com/pup-progguild/InformHerAPI) for the InformHer app for mobile and web.

### Documentation

Base API URL is

* http://informherapi.cloudapp.net

We'll be making better docs, but we hope this would suffice in the meantime. Please see our uploaded [Postman Collection](https://www.getpostman.com/collections/cc6fb482c594bbb81f07) for using the endpoints with fields.

| Domain | URI                                                      | Short Description      | Action                               | Before Filters                                                         | After Filters |
|--------|----------------------------------------------------------|------------------------|--------------------------------------|------------------------------------------------------------------------|---------------|
|        | GET posts                                                | GetAllPosts            | PostController@index                 |                                                                        |               |
|        | GET posts/{post}                                         | GetPost                | PostController@show                  |                                                                        |               |
|        | GET posts/{post}/comments/{comment?}                     | GetCommentsFromPost    | PostController@comments              |                                                                        |               |
|        | GET posts/{post}/tags                                    | GetAllTagsFromPost     | PostController@tags                  |                                                                        |               |
|        | GET posts/{post}/likes                                   | GetAllLikesFromPost    | PostController@likes                 |                                                                        |               |
|        | GET posts/{post}/comments/{comment}/likes                | GetAllLikesFromComment | PostController@likes                 |                                                                        |               |
|        | POST posts/{post?}                                       | CreateEditPost         | PostController@create_edit           | auth                                                                   |               |
|        | POST posts/{post}/comments/{comment?}                    | CreateUpdateComment    | PostController@create_update_comment | auth                                                                   |               |
|        | POST posts/{post}/like                                   | LikePost               | PostController@like                  | auth                                                                   |               |
|        | POST posts/{post}/comments/{comment}/like                | LikePostComment        | PostController@like                  | auth                                                                   |               |
|        | DELETE posts/{post}/comments/{comment?}                  | DeletePostComment      | PostController@delete_comment        | auth                                                                   |               |
|        | DELETE posts/{post}                                      | DeletePost             | PostController@destroy               | auth                                                                   |               |
|        | GET tags                                                 | Tags                   | TagController@index                  |                                                                        |               |
|        | GET category                                             | Categories             | CategoryController@index             |                                                                        |               |
|        | GET user/confirm/{code}                                  | ConfirmUser            | UserController@getConfirm            |                                                                        |               |
|        | GET user/reset/{token}                                   | RetrieveResetPassToken | UserController@getReset              |                                                                        |               |
|        | POST user											    | RegisterUser	         | UserController@postIndex             |                                                                        |               |
|        | POST user/login									        | LoginToInformHer       | UserController@postLogin             |                                                                        |               |
|        | POST user/forgot										    | ProcessForgotPass      | UserController@postForgot            |                                                                        |               |
|        | POST user/reset 										    | ResetPassUsingToken    | UserController@postReset             |                                                                        |               |
|        | GET user/logout									        | LogoutToInformHer      | UserController@getLogout             |                                                                        |               |
|        | GET user                                                 | GetLoggedUserProps     | UserController@getIndex              |                                                                        |               |
|        | GET user/posts    										| GetLoggedUserPosts     | UserController@getPosts              |                                                                        |               |
|        | GET user/comments										| GetLoggedUserComments  | UserController@getComments           |                                                                        |               |
|        | GET user/profile											| GetLoggedUserProfile   | UserController@getProfile            |                                                                        |               |
|        | POST user/profile										| ProcessUserProfile     | UserController@postProfile           |                                                                        |               |
|        | GET admin/users/{user}/delete                            | DeleteUser             | AdminController@delete_user          | auth, Administrator_Moderator_Response_Expert_923b09                   |               |
|        | POST admin/users/{user}/promote                          | PromoteUser            | AdminController@promote              | auth, Administrator_Moderator_Response_Expert_923b09                   |               |
|        | POST admin/users/{user}/demote                           | PromoteUser            | AdminController@demote               | auth, Administrator_Moderator_Response_Expert_923b09                   |               |
|        | GET admin/posts/unapproved                               | ShowUnapprovedPosts    | AdminController@show_unapproved      | auth, Administrator_Moderator_Response_Expert_923b09, Moderator_c2b025 |               |
|        | GET admin/posts/{post}/approve                           | ApprovePost            | AdminController@show_post            | auth, Administrator_Moderator_Response_Expert_923b09, Moderator_c2b025 |               |
|        | GET admin/posts/{post}/hide                              | HidePost               | AdminController@hide                 | auth, Administrator_Moderator_Response_Expert_923b09, Moderator_c2b025 |               |
|        | POST admin/tags/{tag?}                                   | AddCreateTags          | TagController@create_edit            | auth, Administrator_Moderator_Response_Expert_923b09, Moderator_fc6a28 |               |
|        | DELETE admin/tags/{tag}                                  | DeleteTag              | TagController@destroy                | auth, Administrator_Moderator_Response_Expert_923b09, Moderator_fc6a28 |               |

### BuiltWith

- [Laravel PHP](https://github.com/laravel/laravel)

### TechStack

- PHP 5.4+
- Nginx
- MariaDB 10+

### Installation

```bash
$> curl -s https://getcomposer.org/installer | php
$> php composer.phar install
```

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
