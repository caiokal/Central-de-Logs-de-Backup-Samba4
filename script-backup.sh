#!/bin/bash
############################################
######        BACKUP AUTOMATIZADO     ######
############################################

#Dica Apagar Arquivo controle
#00 08 * * 5 root cd /home && rm -rf controle.txt

# Dica de como agendar no cron para backup as 22:00
# 00 22 * * * root /script-backup.sh

# DEFININDO VARIAVEIS
INCREMENTAL=/home/controle.txt

#PASTAS QUE DEVEM SER FEITO BACKUP
ORIGEM="/XX/XX/"

# Destino de backups (Uma Hd Externo)
DESTINO="/XX/"

#DIA DA SEMANA DE 0 A 7, ONDE 0 E 7 SÃO DOMINGO, 1 SEGUNDA, ETC.

DIA=`date +%w`

# Caminho dos logs e nome por data
LOG="/var/www/html/backup_logs/`date +%d-%m-%y | tr / -`.log"

# Logs de leitura iniciais
echo "" >> $LOG
echo "" >> $LOG
echo "############################################" >> $LOG
echo "###        BACKUP AUTOMATIZADO           ###" >> $LOG
echo "###    							  	   ###" >> $LOG
echo "###     							   	   ###" >> $LOG
echo "###      INCREMENTAL DIARIAMENTE         ###" >> $LOG
echo "###       FULL 1X POR SEMANA             ###" >> $LOG
echo "############################################" >> $LOG
echo "" >> $LOG
echo Iniciando script................[OK] >> $LOG
echo Limpando logs antigos ..........[OK] >> $LOG
echo Tamanho Backup..................[OK] >> $LOG 
echo Notificação E-mail..............[Upgrade v2] >>$LOG
echo "DATA E HORA INICIAL:" >>$LOG 
date >>$LOG

# Procura e remove logs com mais de 10 dia echo "" >> $LOGs
find /var/www/html/backup_logs -type f -mtime +10 -exec rm -rf {} \;

# Define o /devls da HD Externo
DEVICE=/dev/xx

# Desmonta e monta a HD Externo
umount -l $DEVICE

# Verifica se HD esta montada ou nao
if mount  $DEVICE $DESTINO
then
	   {
		       # Se estiver montado, inicia a sincronia de ORIGEM 1
                         echo "" >> $LOG
                            echo "HD EXTERNO OK: Iniciando a sincronia de discos..." >> $LOG
                               echo "" >> $LOG
							   
# Procura e remove Backup com mais de 5 dia echo "" >> $LOG

find  /mnt/B* -type f -mtime +5 -exec rm -rf {} \;
							   completo()
							{
								echo 5 >/home/dia.txt
								rm -rf $INCREMENTAL
								
								  mv $DESTINO/Backupfull.tar $DESTINO/Backupfull.tar.old
								  tar -cf $DESTINO/Backupfull.tar  -g $INCREMENTAL $ORIGEM
								  }
								  incremental()
							   	  {
								  tar -cf $DESTINO/Backup.inc$DIA.tar -g $INCREMENTAL $ORIGEM
								  }

									if [ $DIA == 5 ];then
									completo
										else
										incremental

										fi
                                  
                                        echo "BACKUP REALIZADO COM SUCESSO!" >> $LOG
                                           }
                                   else
                                             {
                                                     echo "" >> $LOG
                                                     echo "ERRO AO MONTAR HD EXTERNO: BACKUP CANCELADO!" >> $LOG
                                                       }
                                               fi

											
												
											   #Listando comandos
											   echo "INFORMAÇÕES GERAIS BACKUPS DISPONIVEIS..." >> $LOG
											   ls -lah /BACKUP_GERAL/*  >> $LOG

											   echo "" >> $LOG
											   
											   #Listando comandos
											   echo "INFORMAÇÕES HD EXTERNO" >> $LOG
											   df -h |grep $DEVICE >> $LOG
                                               echo "" >>$LOG
											   
											   echo "DATA E HORA FINAL:" >>$LOG
											   date >>$LOG

                                              # Desmonta a HD ao finalizar
                                               echo "Fim do Relatorio." >> $LOG
                                               umount -l $DEVICE
                                                                   
