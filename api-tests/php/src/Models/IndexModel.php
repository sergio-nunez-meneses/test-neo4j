<?php

namespace App\Models;

class IndexModel extends MainModel
{

    public function create($label, $query_parameters, $parameters)
    {
        $cypher = "CREATE (n:$label $query_parameters) RETURN n";

        return $this->run_query($cypher, $parameters);

        // return 'Created record with properties '.json_encode($properties);
    }

    public function find_all()
    {
        $num_args = func_num_args();
        $args = func_get_args();
        $label = $args[0];

        if ($num_args > 1) {
            $query_parameters = $args[1];
            $parameters = $args[2];
            $cypher = "MATCH (n:$label $query_parameters) RETURN n";

            return $this->run_query($cypher, $parameters);

            // return "Returned all $label records with query parameters ".json_encode($data);
        }

        $cypher = "MATCH (n:$label) RETURN n";

        return $this->run_query($cypher);

        // return 'Returned all records';
    }

    public function find_one($label, $id)
    {
        $cypher = "MATCH (n:$label {id: $id}) RETURN n";

        return $this->run_query($cypher);

        // return "Returned record with id $id";
    }

    public function update($label, $id, $parameters)
    {
        $cypher = "MATCH (n:$label {id: $id}) SET $parameters RETURN n";

        return $this->run_query($cypher);

        // return "Updated record #$id with data ".$data;
    }

    public function delete($id)
    {
        return "Deleted record #$id";
    }
}