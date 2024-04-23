<?php
    require_once('conexao.php');
    Class pessoa extends conexao{
		private $nome; 
		private $fone;
		private $email;
		protected $tabela = 'pessoas';

		//construtor
		public function __construct(){
			parent::__construct();	
		}

		//getter e setter
		public function getAvatar(){
			return $this->avatar;
		}
	
		public function setAvatar($avatar){
			$this->avatar = $avatar;
		}
	
		public function getNome(){
			return $this->nome;
		}
	
		public function setNome($nome){
			$this->nome = $nome;
		}
	
		public function getFone(){
			return $this->fone;
		}
	
		public function setFone($fone){
			$this->fone = $fone;
		}
	
		public function getEmail(){
			return $this->email;
		}
	
		public function setEmail($email){
			$this->email = $email;
		} 

        //metodos

        //consulta no banco
        public function consulta(){
            $sql = "SELECT * FROM $this->tabela";
            $result = $this->conn->query($sql);
            
            if($result == true){
                return $result;
            }else{
                die("Falha na consulta!");
            }
            $this->conn->close();
        }

		//metodo pesquisa ID
		public function consultaID($id){
			$sql = "SELECT avatar,nome,fone,email FROM $this->tabela
			WHERE id = ?";
			$stmt = $this->conn->prepare($sql);
			$stmt->bind_param('i',$id);
			$stmt->execute();
			if($stmt == true){
				$stmt->store_result();
				$stmt->bind_result($avatar,$nome,$fone,$email);
				$stmt->fetch();
				
				$this->setAvatar($avatar);
				$this->setNome($nome);
				$this->setFone($fone);
				$this->setEmail($email);
			}else{
				die("Falha na consulta!");
			}
			$stmt->close();
			$this->conn->close();	
		}


        //cadastrar no banco
        public function cadastra($nome,$fone,$email){
			$sql = "INSERT INTO $this->tabela(nome,fone,email) VALUES(?,?,?)";
			$stmt = $this->conn->prepare($sql);
			$stmt->bind_param('sss',$nome,$fone,$email);
			$stmt->execute();
			
			if($stmt == true){
				header('Location: ../view/agenda.php?cadastro=ok');
			}else{
				die("Falha no cadastro!");
			}
			$stmt->close();
			$this->conn->close();
		}

        //alterar
		public function editar($avatar, $nome,$fone,$email,$id){
			$sql = "UPDATE $this->tabela SET avatar= ?, nome = ?,fone = ?,email = ?
			WHERE id = ?";
			$stmt = $this->conn->prepare($sql);
			$stmt->bind_param('ssssi',$avatar,$nome,$fone,$email,$id);
			$stmt->execute();
			
			if($stmt == true){
				header('Location: ../view/agenda.php?edit=ok');
			}else{
				die("Falha no atualizar!");
			}
			$stmt->close();
			$this->conn->close();	
		}



        //excluir
		public function apagar($id){
			$sql = "DELETE FROM $this->tabela
			WHERE id = ?";
			$stmt = $this->conn->prepare($sql);
			$stmt->bind_param('i',$id);
			$stmt->execute();
			
			if($stmt == true){
				header('Location: ../view/agenda.php?delete=ok');
			}else{
				die("Falha ao excluir!");
			}
			$stmt->close();
			$this->conn->close();
		}
        

    }

?>