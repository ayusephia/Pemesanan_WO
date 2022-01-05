<?php

class model_pembeli extends CI_Model
{
	public function tampil_data()
	{
		return $this->db->get('tb_user');
	}
}
