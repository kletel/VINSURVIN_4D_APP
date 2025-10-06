//%attributes = {}
TRACE:C157
/* Dans Fihcier/Maintenance/(informatin -> Historique), il est possible d'activer 'Logweb.txt" 
qui permet d'avoir une vue sur l'ensemble des requêtes ainsi que leur temps d'éxecution. */
Case of 
	: (True:C214)
		SET DATABASE PARAMETER:C642(Enreg requêtes client:K37:44; 1)
		//FIXER PARAMÈTRE BASE(Enreg requêtes 4D Server; 1) Pour serveur
/** Cette requete : **/
		// - Créer Deux fichiers "4DRequestsLog_1.txt" et "4DRequestsLog_ProcessInfo_1.txt"
		// - Les requêtes http ne sont pas pris en compte non plus dans cette commande.
		
		//- "4DRequestsLog_ProcessInfo.txt" : enregistre des informations sur chaque process créé sur la machine du 4D Server, 
		//ou la machine à distance qui a exécuté la commande (requêtes web exclues).
		
		// --> Le fichier ne prend pas en compte les évènements (cliques) sur les interfaces des formulaires.
		// --> je ne suis pas parvenu à afficher des logs,  après des requêtes sur le web et une analyse IA
		
	: (True:C214)
		SET DATABASE PARAMETER:C642(Enreg événements debogage:K37:34; 2)
		//FIXER PARAMÈTRE BASE(Enreg historique débogage du process courant; 2)
		//FIXER PARAMÈTRE BASE(Enreg diagnostic; 2)
		
		//FIXER PARAMÈTRE BASE(Enreg requêtes client; 2)
		SET DATABASE PARAMETER:C642(Enreg requêtes 4D Server:K37:28; 2)
		
		SET DATABASE PARAMETER:C642(Enreg événements debogage:K37:34; 2+4+8)
		
		//FIXER PARAMÈTRE BASE(Enreg historique débogage du process courant)
		
	: ("Pour les requetes ORDA")
		SET DATABASE PARAMETER:C642(Enreg requêtes client:K37:44; 1)
		ds:C1482.startRequestLog()
		SET DATABASE PARAMETER:C642(Enreg requêtes client:K37:44; 0)
End case 

/* Sur le serveur dans maintenance, le bouton ativer logs, active tous logs de manière détaillé. */