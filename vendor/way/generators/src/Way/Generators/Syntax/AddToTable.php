<?php namespace Way\Generators\Syntax;

class AddToTable extends Table {

    /**
     * Add syntax for table addition
     *
     * @param $migrationData
     * @param array $fields
     * @return mixed
     */
    public function add($migrationData, array $fields)
    {
        if ( ! isset($migrationData['method']))
        {
            $migrationData['method'] = 'table';
        }

        $compiled = $this->compiler->compile($this->getTemplate(), $migrationData);

        return $this->replaceFieldsWith($this->addColumns($fields), $compiled);
    }

    /**
     * Return string for adding all columns
     *
     * @param $fields
     * @return array
     */
    protected function addColumns($fields)
    {
        $schema = [];

        foreach($fields as $property => $details)
        {
            $schema[] = $this->addColumn($property, $details);
        }

        return $schema;
    }

    /**
     * Return string for adding a column
     *
     * @param $property
     * @param $details
     * @return string
     */
    private function addColumn($property, $details)
    {
        $type = $details['type'];

        $output = sprintf(
            "\$table->%s(%s)",
            $type,
            $property ? "'$property'" : null
        );

        // If we have args, then it needs
        // to be formatted a bit differently
        if (isset($details['args']))
        {
            $output = sprintf(
                "\$table->%s('%s', %s)",
                $type,
                $property,
                $details['args']
            );
        }

        if (isset($details['decorators']))
        {
            $output .= $this->addDecorators($details['decorators']);
        }

        return $output . ';';
    }

    /**
     * @param $decorators
     * @return string
     */
    protected function addDecorators($decorators)
    {
        $output = '';

        foreach ($decorators as $decorator) {
            $output .= sprintf("->%s", $decorator);

            // Do we need to tack on the parens?
            if (strpos($decorator, '(') === false) {
                $output .= '()';
            }
        }

        return $output;
    }

} 