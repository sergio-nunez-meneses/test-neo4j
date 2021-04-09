<?php


class OfferModel extends MainModel
{

    public function create($properties)
    {
        return 'Created record with properties '.json_encode($properties);
    }

    public function find_all()
    {
        $num_args = func_num_args();

        if ($num_args > 0) {
            $data = func_get_arg(0);

            return 'Returned all records with query parameters '.json_encode($data);
        }

        $cypher = "MATCH (o:Offer) RETURN o";

        return $this->run_query($cypher);

        // return 'Returned all records';
    }

    public function find_one($id)
    {
        $filtered_id = filter_var($id, FILTER_SANITIZE_STRING);
        $cypher = "MATCH (o:Offer) WHERE o.id = $filtered_id RETURN o";

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