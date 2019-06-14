<?php //defined('BASEPATH') OR exit('No direct script access allowed');
class Chat extends CI_Controller{

	public function __construct()
	{
		parent::__construct();
		if (!$this->ion_auth->logged_in())
		{
			// redirect them to the login page
			redirect('auth/login', 'refresh');
		}
		
	}

	function index(){
		$this->load->view('chat/template');

	}

	public function get_chat(){
		$chat=$this->input->get('chats');
		$user=$this->ion_auth->user()->row();
		if($chat==NULL || empty($chat) || $chat==''){
			$this->db->where('group_chat','xyxy');
			$this->db->order_by('waktu', 'ASC');
			$get=$this->db->get('chat');
			if($get->num_rows()>0){
				$data1=array();
				$data2=array();
				$data3=array();
				$data4=array();
				$data5=array();
				$no=1;
				foreach ($get->result() as $key) {
					$penentu='';
					if($key->pengirim!==$user->id){
						$penentu='left';
					}else{
						$penentu='right';
					}

					$data1[]=$key->chat;
					$data2[]=$penentu;
					$data3[]=$key->waktu;
					$data4[]=$key->pengirim;
					$data5[]=$key->penerima;
					$no++;
				}
				$data=array(
					'text'        => $data1,
					'position'    => $data2,
					'waktu'       => $data3,
					'id_pengirim' => $data4,
					'id_penerima' => $data5,
					'id_login'    => $user->id,
					'nama'        => $user->first_name
				);
				echo json_encode($data);
			}
		}else{
			date_default_timezone_set('Asia/jakarta');
			$user=$this->ion_auth->user()->row();
			$data=array(
				'waktu' => date('Y-m-d H:m:s'),
				'pengirim'   => $user->first_name=='Abi'? '3':'2',
				'penerima'   => $user->first_name=='Abi'? '2':'3',
				'chat'       => $chat,
				'group_chat' => 'xyxy'
			);
			$this->db->insert('chat', $data);

			$chat=$this->input->get('chats');
			$this->db->where('chat',$chat);
			$get=$this->db->get('chat');
			$dataa=array();
			foreach ($get->result() as $key) {
				$penentu='';
				if($key->pengirim==$user->id){
					$penentu='left';
				}else{
					$penentu='right';
				}
				$dataa['text']=$key->chat;
				$dataa['waktu']=$key->waktu;
				$dataa['position']= $penentu;
			}
			echo json_encode($dataa);
		}
		
	}

	public function get_where(){
		$user=$this->ion_auth->user()->row();
		$chat=$this->input->get('chats');
		$this->db->where('chat',$chat);
		$get=$this->db->get('chat');
		$data=array();
		foreach ($get->result() as $key) {
			$penentu='';
			if($key->pengirim!==$user->id){
				$penentu='left';
			}else{
				$penentu='right';
			}
			$data['text']=$key->chat;
			$data['waktu']=$key->waktu;
			$data['position']= $penentu;
		}
		echo json_encode($data);
	}

	public function get_chat_bootstrap(){
		date_default_timezone_set('Asia/jakarta');
		$get=$this->db->get('chat_bootstrap');
		$text=array();
		$waktu=array();
		$nama_pengirim=array();
		foreach ($get->result() as $key) {
			$text[]          = $key->chat;
			$waktu[]         = $key->waktu;
			$nama_pengirim[] = $key->nama_pengirim;
		}
		$data=array(
			'text'          => $text,
			'waktu'         => $waktu,
			'nama_pengirim' => $nama_pengirim
		);
		echo json_encode($data);
	}

	public function input_chat(){
		$nama_pengirim=$this->input->get('nama_pengirim');
		$text=$this->input->get('text');
		$waktu=$this->input->get('waktu');
		$data=array(
			'chat'          => $text,
			'waktu'         => $waktu,
			'nama_pengirim' => $nama_pengirim
		);
		$this->db->insert('chat_bootstrap',$data);
	}
}