<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta name="viewport" content="width=device-width">
    <meta charset="UTF-8">
    <title>Central de Logs de Backup</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/style-home.css"

  </head>
  <body>
    <header class="titulo">
        <h1>Central de Logs de Backup</h1>
	<h2>HOSTNAME: <?php echo gethostname();?> -  IP: <?php echo $_SERVER['SERVER_ADDR'];?></h2>
	<h3><?php echo $DateAndTime = date('d-m-Y h:i: a', time());?></h3>
    </header>
    <main>
      <ul class="serviço">
        <li>
          <h2><a href="file-server.php"></h2>
          <img width="120px" height="100px" src="/img/rotina01.png">
          <p class="serviço-descricao">Backup de Fileserver para disco local</p></a>
          <p class="serviço-status">Status</p>
        </li>
        <li>
        <h2><a href="audit.html"></h2>
          <img width="120px" height="100px" src="/img/rotina02.png">
          <p class="serviço-descricao">Sistema de Auditoria de acessos do Samba4</p></a>
          <p class="serviço-status">Status</p>
        </li>
        <li>
        <h2><a href="arquivo-conf.html"></h2>
          <img width="120px" height="100px" src="/img/rotina03.png">
          <p class="serviço-descricao">Backup de Arquivos de configurações</p></a>
          <p class="serviço-status">Status</p>
        </li>
      </ul>
    </main>
     </body>
     <footer>
      <p class="copyright">&copy; Copyright Projeto Empresa Livre - 2022 </p>
        </footer>
</html>
