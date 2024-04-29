# Add_Alias_SMTP_User_AD
Permet d'ajouter des alias de messagerie sur un utilisateur Active Directory

# Active Directory Email Management Script

Ce script PowerShell permet de gérer les adresses e-mail des utilisateurs dans un environnement Active Directory. Il fournit des fonctionnalités pour récupérer les adresses e-mail principales et les adresses proxy, ainsi que pour ajouter de nouvelles adresses proxy à un utilisateur spécifique.

## Prérequis

Avant de commencer à utiliser ce script, assurez-vous que les conditions suivantes sont remplies :

- PowerShell 5.1 ou supérieur est installé.
- Le module ActiveDirectory pour PowerShell est installé. Ce module est généralement disponible sur les machines qui ont accès à un contrôleur de domaine ou qui ont les outils d'administration de serveur distant (RSAT) installés.
- Vous devez avoir des droits administratifs sur votre domaine pour pouvoir modifier les attributs des utilisateurs.

## Installation

1. **Ouvrez PowerShell en tant qu'administrateur** : Cliquez droit sur l'icône de PowerShell et sélectionnez "Exécuter en tant qu'administrateur".
2. **Importez le module ActiveDirectory** (si ce n'est pas déjà fait) :
   ```powershell
   Import-Module ActiveDirectory

Utilisation

Le script contient deux fonctions principales :

    Get-UserEmails: Pour récupérer l'adresse e-mail principale et les adresses proxy d'un utilisateur.
    Add-ProxyAddresses: Pour ajouter des adresses proxy à un utilisateur.

Récupération des Emails d'un Utilisateur

Pour récupérer les emails d'un utilisateur, utilisez la fonction Get-UserEmails avec le nom d'utilisateur spécifié :

powershell

# Remplacez 'nomUtilisateur' par le sAMAccountName de l'utilisateur désiré
Get-UserEmails -username "nomUtilisateur"

Ajout d'Adresses Proxy à un Utilisateur

Pour ajouter des adresses proxy à un utilisateur, utilisez la fonction Add-ProxyAddresses avec le nom d'utilisateur et la liste des nouvelles adresses proxy :

powershell

# Remplacez 'nomUtilisateur' et ajoutez les adresses dans le tableau ci-dessous
$username = "nomUtilisateur"
$proxyAddressesToAdd = @("test.test@sirailgroup.com", "test2.test2@sirailgroup.com")
Add-ProxyAddresses -username $username -proxyAddresses $proxyAddressesToAdd

Contributions

Les contributions à ce script sont les bienvenues. Pour contribuer, veuillez créer une issue ou soumettre une pull request sur GitHub.
Licence

Ce script est distribué sous la licence MIT. Voir le fichier LICENSE pour plus d'informations.

