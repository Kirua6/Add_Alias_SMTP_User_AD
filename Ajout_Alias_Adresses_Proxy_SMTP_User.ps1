# En admin 
Import-Module ActiveDirectory

# recup email user
function Get-UserEmails {
    param (
        [string]$username
    )
    
    # recup user par SAM
    $user = Get-ADUser -Identity $username -Properties mail, proxyAddresses
    
    # Verif si user trouvé
    if ($user -ne $null) {
        # affichz mail principal
        Write-Host "Adresse e-mail principale: $($user.mail)"
        
        # affichz adresses proxy si exist
        if ($user.proxyAddresses) {
            Write-Host "Adresses e-mail proxy:"
            $user.proxyAddresses | ForEach-Object {
                if ($_ -clike 'smtp:*') {
                    Write-Host $_.Substring(5) 
                }
            }
        } else {
            Write-Host "Aucune adresse e-mail proxy trouvée."
        }
    } else {
        Write-Host "Utilisateur non trouvé."
    }
}

# ajout proxy user
function Add-ProxyAddresses {
    param (
        [string]$username,
        [string[]]$proxyAddresses
    )
    
    try {
        # recup user + proxy actuel
        $user = Get-ADUser -Identity $username -Properties proxyAddresses

        # Ajout new adresses proxy
        foreach ($address in $proxyAddresses) {
            $newAddress = "smtp:" + $address
            Set-ADUser -Identity $username -Add @{proxyAddresses=$newAddress}
        }

        Write-Host "Les adresses proxy ont été ajoutées avec succès."
    } catch {
        Write-Host "Erreur lors de l'ajout des adresses proxy: $_"
    }
}

# ajout user, en general prenom.nom pour le SAM + adresses proxy de l'user
$username = "SAM"
$proxyAddressesToAdd = @("test.test@testgrp.com", "teset.test@testgrp.com") # Juste les emails sans le préfixe smtp:

# Ajout new adresses proxy
Add-ProxyAddresses -username $username -proxyAddresses $proxyAddressesToAdd

# Affichage emails actuels
Get-UserEmails -username $username


