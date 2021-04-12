<?php


class IndexModel extends MainModel
{

    public function create($properties)
    {
        return 'Created record with properties '.json_encode($properties);
    }

    public function find_all()
    {
        $num_args = func_num_args();
        $args = func_get_args();
        $label = filter_var($args[0], FILTER_SANITIZE_STRING);

        if ($num_args > 1) {
        	  $data = $args[1];

            return "Returned all $label records with query parameters ".json_encode($data);
        }

        $cypher = "MATCH (o:$label) RETURN o";

        return $this->run_query($cypher);

        // return 'Returned all records';
    }

    public function find_one($label, $id)
    {
        $filtered_id = filter_var($id, FILTER_SANITIZE_STRING);
        $filtered_label = filter_var($label, FILTER_SANITIZE_STRING);
        $cypher = "MATCH (o:$filtered_label) WHERE o.id = $filtered_id RETURN o";

        return $this->run_query($cypher);

        // return "Returned record with id $id";
    }

    public function update($id, $data)
    {
        return "Updated record #$id with data ".json_encode($data);
    }

    public function delete($id)
    {
        return "Deleted record #$id";
    }
}