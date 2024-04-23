<?php
	require_once('conexao.php');
	Class usuario extends conexao{
		private $usuario;
		private $senha;
		private $tabela = 'usuarios';
		
		public function __construct(){
			parent::__construct();
		}

        //metodo de login
        public function logar($usuario, $senha){
			$sql = "SELECT usuario,senha FROM $this->tabela 
			WHERE usuario = ? AND senha = ?";
			$stmt = $this->conn->prepare($sql);
			$stmt->bind_param('ss',$usuario, $senha);
			$stmt->execute();
			$stmt->store_result();
			
			if($stmt->num_rows == 1){
				session_start();
				$_SESSION['logado'] = true;
				header('Location: ../view/agenda.php?logado=true');
			}else{
				header('Location: ../view/index.php?erro=login');
			}
			$stmt->close();
			$this->conn->close();

		}

} //fim da classe usuario