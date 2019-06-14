<?php defined('BASEPATH') OR exit('No direct script access allowed');
	function get_name_where_id($id){
		$ci = get_instance();
		$ci->db->where('id',$id);
		$get=$ci->db->get('users')->result();
		foreach ($get as $key) {
			return $key->first_name;
		}
	}