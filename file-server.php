<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta name="viewport" content="width=device-width">
    <meta charset="UTF-8">
    <title>Central de Logs de Backup</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/style-fileserver.css">
  </head>
  <body>
    <header class="titulo">
        <h1>informações de logs do files-server</h1>
	<h2>HOSTNAME: <?php echo gethostname();?> -  IP: <?php echo $_SERVER['SERVER_ADDR'];?></h2>
	<h3><?php echo $DateAndTime = date('d-m-Y h:i: a', time());?></h3>
    </header>
      <section>
        <ul class="resultado">
          <li class="resultado__conteudo"> 
          <?php $arquivos = scandir('/var/www/html/backup_logs/');
           foreach ($arquivos as $key => $arquivo_nome) 
           { if($arquivo_nome != '.' && $arquivo_nome != '..'){ echo "<a href='./backup_logs/".$arquivo_nome."'  target='_blank' class='resultado__conteudo--item'> " . $arquivo_nome  . " </a><br>\n";}}?>
          </li>
  	</section>
    <ul class="voltar">
        <li>
          <h2><a href="home.php"></h2>
          <img width="120px" height="100px" src="/img/voltar.png">
        </li>
</ul>
    <footer>
  <p class="copyright">&copy; Copyright Projeto Empresa Livre - 2022 </p>
    </footer>
     </body>
</html>
