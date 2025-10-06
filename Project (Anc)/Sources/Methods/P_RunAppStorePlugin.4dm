//%attributes = {}

//  // ----------------------------------------------------
//  // Nom utilisateur (OS) : Seb
//  // Date et heure : 22/02/11, 17:31:48
//  // ----------------------------------------------------
//  // Méthode : P_RunAppStorePlugin
//  // Description
//  // 
//  //
//  // Paramètres
//  // ----------------------------------------------------
//TRACE
//C_TEXTE($cheminplugin)
//C_TEXTE($md5plugin)
//C_ENTIER LONG($resfork)
//  //ALERTE("test presence du plugin")
//$cheminplugin:=Fichier application+<>Separateur+"Contents"+<>Separateur+"Plugins"+<>Separateur+"App Store Tools.bundle"+<>Separateur+"Contents"+<>Separateur+"MacOS"+<>Separateur+"App Store Tools"
//  //ALERTE("chemin plugin : "+$cheminplugin)
//Si (Tester chemin acces($cheminplugin)=Est un document)
//  //C_BLOB($blobplugin)
//  //FIXER TAILLE BLOB($blobplugin;0)
//  //DOCUMENT VERS BLOB($cheminplugin;$blobplugin)
//  //$md5plugin:=MD5 ($blobplugin;Crypto BASE64)


//$resfork:=0
//$erreur:=_o_AP Get file MD5 digest ($cheminplugin;$md5plugin;$resfork)

//  //ALERTE("le plugin doit avoir le md5 suivant : 5iX6iIe/8RvxI2GEEdkvXQ==")
//  //ALERTE("md5 du plugin : "+$md5plugin)
//Si ($md5plugin="e625fa8887bff11bf123618411d92f5d")
//  //Si ($md5plugin="5iX6iIe/8RvxI2GEEdkvXQ==")
//  //ALERTE("plugin valide")
//Sinon 
//ALERTE("plugin invalide")
//QUITTER 4D
//Fin de si 
//Sinon 
//ALERTE("plugin absent")
//QUITTER 4D
//Fin de si 


//  //ALERTE("test du receipt")
//C_TEXTE($B_identifer;$B_version;$R_identifier;$R_version;$R_hash;$R_opaque;$GUID;$computed_hash)
//C_BOOLÉEN(receiptisgood)
//receiptisgood:=Faux
//Si (Faux)
//EXIT 173 
//Fin de si 



//$B_identifer:=BUNDLE Get identifer 
//  //ALERTE("id logiciel : "+$B_identifer)
//  //$B_identifer:="com.kletel.vinsurvin"
//$B_version:=BUNDLE Get version 
//  //ALERTE("version logiciel : "+$B_version)
//  //$B_version:=<>version_application
//<>Serialisation:="Enregistré"

//$R_identifier:=RECEIPT Get identifier 
//  //ALERTE("receipt identifier:"+$R_identifier)
//$R_version:=RECEIPT Get version 
//  //ALERTE("receipt version:"+$R_version)
//$R_hash:=RECEIPT Get hash 
//  //ALERTE("receipt hash:"+$R_hash)
//$R_opaque:=RECEIPT Get opaque 
//  //ALERTE("receipt opaque:"+$R_opaque)

//  //ALERTE("version logiciel : "+$B_version)
//  //ALERTE("version receipt : "+$R_version)
//  //ALERTE("id logiciel : "+$B_identifer)
//  //ALERTE("id receipt : "+$R_identifier)

//Si ($B_version=$R_version)  //version is OK...
//Si ($B_identifer=$R_identifier)  //ID is OK...

//$GUID:=GUID Get identifier   //This is the computer's unique number.
//  //ALERTE("guid"+$GUID)
//$computed_hash:=GUID Compute hash ($GUID;$R_opaque;$R_identifier)
//  //ALERTE("computed hash"+$computed_hash)
//  //ALERTE("receipt hash"+$R_hash)
//Si ($computed_hash=$R_hash)
//  //The receipt is valid. tout est ok on peut lancer l'appli
//  //ALERTE("receipt valide")
//receiptisgood:=Vrai
//Fin de si 

//Fin de si 
//Fin de si 

//Si (receiptisgood=Faux)
//QUITTER 4D
//Fin de si 