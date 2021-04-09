<?php


class OfferModel {

	public function create($properties) {
		return 'Created record with properties ' . json_encode($properties);
	}

	public function find_all() {
		$num_args = func_num_args();

		if ($num_args > 0) {
			$data = func_get_arg(0);
			return 'Returned all records with query parameters ' . json_encode($data);
		}

		return 'Returned ll records';
	}

	public function find_one($id) {
		return "Returned record with id $id";
	}

	public function update($id, $data) {
		return "Updated record #$id with data " . json_encode($data);
	}

	public function delete($id) {
		return "Deleted record #$id";
	}
}