<?php

class Auth extends CI_Controller
{
    public function login()
    {
        $this->form_validation->set_rules('username', 'username', 'required', ['required' => 'Username wajib di isi!']);
        $this->form_validation->set_rules('password', 'password', 'required', ['required' => 'Password wajib di isi!']);
        if ($this->form_validation->run() == FALSE) {
            $data['title'] = 'Login';
            $this->load->view('templates/auth_header', $data);
            $this->load->view('auth/login');
            $this->load->view('templates/auth_footer');
        } else {
            $auth = $this->model_auth->cek_login();

            if ($auth == FALSE) {
                $this->session->set_flashdata('pesan', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                      Username atau Password Anda Salah!
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>');
                redirect('auth/login');
            } else {
                $this->session->set_userdata('username', $auth->username);
                $this->session->set_userdata('role_id', $auth->role_id);
                switch ($auth->role_id) {
                    case 1:
                        redirect('admin/dashboard_admin');
                        break;
                    case 2:
                        redirect('homepage');
                        break;
                    default:
                        break;
                }
            }
        }
    }
    public function logout()
    {
        $this->session->sess_destroy();
        redirect('auth/login');
    }


    public function registration()
    {
        $this->form_validation->set_rules('nama', 'Nama', 'required', ['required' => 'Nama Wajib di Isi']);
        $this->form_validation->set_rules('username', 'Username', 'required', ['required' => 'Username Wajib di Isi']);
        $this->form_validation->set_rules('password_1', 'Password', 'required|matches[password_2]', [
            'required' => 'Password Wajib di Isi!',
            'matches' => 'Password tidak cocok!'
        ]);
        $this->form_validation->set_rules('password_2', 'Password', 'required|matches[password_1]');

        if ($this->form_validation->run() == FALSE) {
            $data1['title'] = 'Registration';
            $this->load->view('templates/auth_header', $data1);
            $this->load->view('auth/registration');
            $this->load->view('templates/auth_footer');
        } else {
            $data = array(
                'id'        => '',
                'nama'      => $this->input->post('nama'),
                'username'  => $this->input->post('username'),
                'password'  => $this->input->post('password_1'),
                'role_id'   => 2,
            );
            $this->db->insert('tb_user', $data);
            redirect('auth/login');
        }
    }
}
