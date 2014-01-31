<?php

    class CommentController extends BaseController {

        protected $comment;

        public function __construct(Comment $comment) {
            $this->comment = $comment;
        }

        /**
         * Display a listing of the resource.
         *
         * @return Response
         */
        public function index() {

        }

        /**
         * Show the form for creating a new resource.
         *
         * @param   id $id
         * @return Response
         */
        public function create($id) {

        }

        /**
         * Store a newly created resource in storage.
         *
         * @return Response
         */
        public function store() {
            //
        }

        /**
         * Display the specified resource.
         *
         * @param  int $id
         * @return Response
         */
        public function show($id) {
            //
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
            //
        }

        /**
         * Remove the specified resource from storage.
         *
         * @param  int $id
         * @return Response
         */
        public function destroy($id) {
            //
        }

    }