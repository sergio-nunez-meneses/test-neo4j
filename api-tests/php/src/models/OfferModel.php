<?php


class OfferModel {

	public function find_all() {
		$num_args = func_num_args();
		$properties = null;

		if ($num_args > 0) {
			$properties = func_get_arg(0);
			return 'All records with query parameters ' . json_encode($properties);
		}

		return 'All records';
	}

	public function find_one($id) {
		return "Return record with id $id";
	}
}