<?php

class data_pembeli extends CI_Controller
{
	public function index()
	{
		$data['pembeli'] = $this->model_pembeli->tampil_data()->result();
		$this->load->view('templates/admin_header');
		$this->load->view('templates/admin_sidebar');
		$this->load->view('admin/data_pembeli', $data);
		$this->load->view('templates/admin_footer');
	}
}
