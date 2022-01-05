<?php


class Model_kategori extends CI_Model
{
	public function aneka()
	{
		return $this->db->get_where("tb_barang", array('kategori' => 'aneka'));
	}
	public function nasional()
	{
		return $this->db->get_where("tb_barang", array('kategori' => 'nasional'));
	}
	public function internasional()
	{
		return $this->db->get_where("tb_barang", array('kategori' => 'internasional'));
	}
	public function rumah()
	{
		return $this->db->get_where("tb_barang", array('kategori' => 'rumah'));
	}
}
