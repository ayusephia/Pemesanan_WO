<?php

class Kategori extends CI_Controller
{
	public function internasional()
	{
		$data['internasional'] = $this->model_kategori->internasional()->result();
		$this->load->view('templates/user_header');
		$this->load->view('templates/user_sidebar');
		$this->load->view('kategori/internasional', $data);
		$this->load->view('templates/user_footer');
	}
	public function nasional()
	{
		$data['nasional'] = $this->model_kategori->nasional()->result();
		$this->load->view('templates/user_header');
		$this->load->view('templates/user_sidebar');
		$this->load->view('kategori/nasional', $data);
		$this->load->view('templates/user_footer');
	}
	public function aneka()
	{
		$data['aneka'] = $this->model_kategori->aneka()->result();
		$this->load->view('templates/user_header');
		$this->load->view('templates/user_sidebar');
		$this->load->view('kategori/aneka', $data);
		$this->load->view('templates/user_footer');
	}
	public function rumah()
	{
		$data['rumah'] = $this->model_kategori->rumah()->result();
		$this->load->view('templates/user_header');
		$this->load->view('templates/user_sidebar');
		$this->load->view('kategori/rumah', $data);
		$this->load->view('templates/user_footer');
	}
}
