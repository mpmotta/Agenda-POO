<?php

$action = $_GET['action'];
require_once('../model/pessoas.php');
$pessoa = new pessoa(); 

switch ($action) {

    case 'login':
        require_once('../model/usuario.php');
        $usuarios = new usuario(); 

        $usuario = $_POST['usuario'];
        $senha = $_POST['senha'];
        $salt = md5($senha);
        $senha = hash('sha256', $salt);

        $login = $usuarios->logar($usuario, $senha);
        break;

    case 'sair':

        session_start();
        session_destroy();
        header('Location: ../view/index.php?user=deslogado');     
        break;


    case 'cadastrar':
        $nome = $_POST['nome'];
        $fone = $_POST['fone'];
        $email = $_POST['email'];
 
        $cadastra = $pessoa->cadastra($nome,$fone,$email);
    

    case 'editar':
        $meuid = $_POST['meuid'];
        $meuavatar = $_POST['meuavatar'];
        $nome = $_POST['nome'];
        $fone = $_POST['fone'];
        $email = $_POST['email'];

        require_once('upload.php');
        if(empty($extensao)){
            $avatar = $meuavatar;
        }
     
        $alterar = $pessoa->editar($avatar,$nome,$fone,$email,$meuid);

    case 'excluir':
        $id = $_GET['id'];
        $excluir = $pessoa->apagar($id);

}

?>