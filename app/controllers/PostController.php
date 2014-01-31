<?php

    class PostController extends BaseController {

        protected $post;

        public function __construct(Post $post) {
            $this->post = $post;
        }

        /**
         * Display a listing of the resource.
         *
         * @return Response
         */
        public function index() {
            $post = Post::whereNull('deleted_at')->get();

            return Response::json(array(
                    'status' => 'POSTS_ALL_RETRIEVE_SUCCESSFUL',
                    'posts'  => $post->toArray()
                ), 200
            );
        }

        /**
         * Show the form for creating a new resource.
         *
         * @return Response
         */
        public function create() {

        }

        /**
         * Store a newly created resource in storage.
         *
         * @return Response
         */
        public function storeAsk() {
            $post = $this->post;

            $post->title   = Request::get('title');
            $post->content = Request::get('content');
            $post->type    = Request::get('type');
            $post->user_id = Auth::user()->getAuthIdentifier();

            $post->save();

            return Response::json(array(
                    'status' => 'POST_ADD_SUCCESSFUL',
                    'posts'  => $post->toArray()
                ), 200
            );
        }

        public function storeRelate() {
            $post = $this->post;

            $post->title   = Request::get('title');
            $post->content = Request::get('content');
            $post->type    = Request::get('type');
            $post->user_id = Auth::user()->getAuthIdentifier();

            $post->save();

            return Response::json(array(
                    'status' => 'POST_ADD_SUCCESSFUL',
                    'posts'  => $post->toArray()
                ), 200
            );
        }

        public function storeShoutout() {
            $post = $this->post;

            $post->title   = Request::get('title');
            $post->content = Request::get('content');
            $post->type    = Request::get('type');
            $post->user_id = Auth::user()->getAuthIdentifier();

            $post->save();

            return Response::json(array(
                    'status' => 'POST_ADD_SUCCESSFUL',
                    'posts'  => $post->toArray()
                ), 200
            );
        }

        /**
         * Display the specified resource.  // FIXME empty array returned, but successful query.
         *
         * @param  int $id
         * @return Response
         */
        public function show($id) {
            $post = Post::where('id', $id)->get();


            return Response::json(array(
                    'status' => 'POST_SHOW_SUCCESSFUL',
                    'posts'  => $post->toArray()
                ), 200
            );
            //return var_dump($post);
        }

        /**
         * Show the form for editing the specified resource.
         *
         * @param  int $id
         * @return Response
         */
        public function edit($id) {
            //
        }

        /**
         * Update the specified resource in storage.
         *
         * @param  int $id
         * @return Response
         */
        public function update($id) {
            $post = Post::where('user_id', Auth::user()->getAuthIdentifier())->findOrFail($id);

            $post->title   = Request::get('title');
            $post->content = Request::get('content');
            $post->type    = Request::get('type');

            $post->save();

            return Response::json(array(
                    'status' => 'POST_UPDATE_SUCCESSFUL',
                    'posts'  => $post->toArray()
                ), 200
            );
        }

        /**
         * Remove the specified resource from storage.
         *
         * @param  int $id
         * @return Response
         */
        public function destroy($id) {
            $post = Post::where('user_id', Auth::user()->getAuthIdentifier())->findOrFail($id);
            $post->delete();

            return Response::json(array(
                    'status' => 'POST_DELETE_SUCCESSFUL',
                    'posts'  => $post->toArray()
                ), 200
            );
        }

        public function reply() {

        }

        public function like() {

        }

    }