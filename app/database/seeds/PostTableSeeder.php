<?php

    /**
     * Created by PhpStorm.
     * User: REDFOX Wizpad
     * Date: 1/24/14
     * Time: 1:42 AM
     */
    class PostTableSeeder extends Seeder {
        public function run() {

            Post::create(array(
                'type'    => 'ask',
                'title'   => 'Is it normal for women to submit to men? #ask',
                'content' => 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',
                'user_id' => '1',
            ));

            Post::create(array(
                'type'    => 'ask',
                'title'   => 'Is it alright to ask a question here? #ask',
                'content' => 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',
                'user_id' => '2',
            ));

            Post::create(array(
                'type'    => 'ask',
                'title'   => 'I am a Doctor. Ask me anything #ask',
                'content' => 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',
                'user_id' => '1',
            ));

            Post::create(array(
                'type'    => 'ask',
                'title'   => 'I am a Teacher. Ask me anything #ask',
                'content' => 'To make your document look professionally produced, Word provides header, footer, cover page, and text box designs that complement each other. For example, you can add a matching cover page, header, and sidebar.',
                'user_id' => '2',
            ));
        }
    }