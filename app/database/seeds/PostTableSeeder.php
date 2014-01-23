<?php
/**
 * Created by PhpStorm.
 * User: REDFOX Wizpad
 * Date: 1/24/14
 * Time: 1:42 AM
 */

class PostTableSeeder extends Seeder {
    public function run() {
        DB::table('posts')->delete();

        Post::create(array(
            'type'      =>  'ask',
            'title'     =>  'Is it normal for women to submit to men? #ask',
            'content'   =>  '',
            'user_id'   =>  '1',
        ));

        Post::create(array(
            'type'    => 'ask',
            'title'   => '',
            'content' => '',
            'user_id' => '2',
        ));

        Post::create(array(
            'type'    => 'ask',
            'title'   => '',
            'content' => '',
            'user_id' => '1',
        ));

        Post::create(array(
            'type'    => 'ask',
            'title'   => '',
            'content' => '',
            'user_id' => '2',
        ));
    }
}