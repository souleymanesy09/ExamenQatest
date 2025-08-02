*** Settings ***
Library    Collections
Library    OperatingSystem
Library    ../libraries/MongoDBLibrary.py    WITH NAME    MongoDB
Variables    ../pageobject/variables.py

*** Keywords ***
# Keywords communs
Initialiser Connexion
    MongoDB.Connect To MongoDB    ${MONGODB_URI}    ${DB_NAME}

Nettoyer Connexion
    MongoDB.Disconnect From MongoDB

Convertir En Dictionnaire
    [Arguments]    ${data}
    ${is_dict}    Run Keyword And Return Status    Evaluate    isinstance($data, dict)    $data
    Return From Keyword If    ${is_dict}    ${data}
    ${dict}    Evaluate    eval(r'''${data}''')
    [Return]    ${dict}

# Products Keywords
Creer Produit Et Logger
    [Arguments]    ${donnees}
    ${donnees_dict}    Convertir En Dictionnaire    ${donnees}
    ${id_produit}    MongoDB.Create Product    ${donnees_dict}
    Should Not Be Equal    ${id_produit}    ${None}
    ${produit}    MongoDB.Get Product    ${id_produit}
    Log To Console    \n=== AJOUT REUSSI ===\n${produit}\n==========
    [Return]    ${id_produit}

Recuperer Produit Et Logger
    [Arguments]    ${product_id}
    ${produit}    MongoDB.Get Product    ${product_id}
    Should Not Be Equal    ${produit}    ${None}    msg=Produit non trouvé avec l'ID: ${product_id}
    Log To Console    \n=== PRODUIT TROUVE ===\n${produit}\n==========
    [Return]    ${produit}

Modifier Produit Et Logger
    [Arguments]    ${product_id}    ${nouvelles_donnees}
    ${nouvelles_donnees_dict}    Convertir En Dictionnaire    ${nouvelles_donnees}
    ${result}    MongoDB.Update Product    ${product_id}    ${nouvelles_donnees_dict}
    Should Be True    ${result} == 1    msg=Échec de la modification
    ${produit}    MongoDB.Get Product    ${product_id}
    Log To Console    \n=== MODIFICATION REUSSIE ===\nNouvelles valeurs: ${nouvelles_donnees_dict}\nRésultat: ${produit}\n==========
    [Return]    ${result}

Supprimer Produit Et Logger
    [Arguments]    ${product_id}
    ${produit}    MongoDB.Get Product    ${product_id}
    ${result}    MongoDB.Delete Product    ${product_id}
    Should Be True    ${result} == 1    msg=Échec de la suppression
    Log To Console    \n=== SUPPRESSION ===\nProduit supprimé: ${produit}\nRésultat: ${result} document(s) supprimé(s)\n==========
    [Return]    ${result}

# Users Keywords
Creer User Et Logger
    [Arguments]    ${donnees}
    ${donnees_dict}    Convertir En Dictionnaire    ${donnees}
    ${id_user}    MongoDB.Create User    ${donnees_dict}
    Should Not Be Equal    ${id_user}    ${None}
    ${user}    MongoDB.Get User    ${id_user}
    Log To Console    \n=== USER AJOUTÉ ===\n${user}\n==========
    [Return]    ${id_user}

Recuperer User Et Logger
    [Arguments]    ${user_id}
    ${user}    MongoDB.Get User    ${user_id}
    Should Not Be Equal    ${user}    ${None}    msg=User non trouvé avec l'ID: ${user_id}
    Log To Console    \n=== USER TROUVÉ ===\n${user}\n==========
    [Return]    ${user}

Modifier User Et Logger
    [Arguments]    ${user_id}    ${nouvelles_donnees}
    ${nouvelles_donnees_dict}    Convertir En Dictionnaire    ${nouvelles_donnees}
    ${result}    MongoDB.Update User    ${user_id}    ${nouvelles_donnees_dict}
    Should Be True    ${result} == 1    msg=Échec de la modification
    ${user}    MongoDB.Get User    ${user_id}
    Log To Console    \n=== MODIFICATION REUSSIE ===\nNouvelles valeurs: ${nouvelles_donnees_dict}\nRésultat: ${user}\n==========
    [Return]    ${result}

Supprimer User Et Logger
    [Arguments]    ${user_id}
    ${user}    MongoDB.Get User    ${user_id}
    ${result}    MongoDB.Delete User    ${user_id}
    Should Be True    ${result} == 1    msg=Échec de la suppression
    Log To Console    \n=== SUPPRESSION ===\nUser supprimé: ${user}\nRésultat: ${result} document(s) supprimé(s)\n==========
    [Return]    ${result}

# Carts Keywords (même pattern)
Creer Cart Et Logger
    [Arguments]    ${donnees}
    ${donnees_dict}    Convertir En Dictionnaire    ${donnees}
    ${id_cart}    MongoDB.Create Cart    ${donnees_dict}
    Should Not Be Equal    ${id_cart}    ${None}
    ${cart}    MongoDB.Get Cart    ${id_cart}
    Log To Console    \n=== CART AJOUTÉ ===\n${cart}\n==========
    [Return]    ${id_cart}

Recuperer Cart Et Logger
    [Arguments]    ${cart_id}
    ${cart}    MongoDB.Get Cart    ${cart_id}
    Should Not Be Equal    ${cart}    ${None}    msg=Cart non trouvé avec l'ID: ${cart_id}
    Log To Console    \n=== CART TROUVÉ ===\n${cart}\n==========
    [Return]    ${cart}

Modifier Cart Et Logger
    [Arguments]    ${cart_id}    ${nouvelles_donnees}
    ${nouvelles_donnees_dict}    Convertir En Dictionnaire    ${nouvelles_donnees}
    ${result}    MongoDB.Update Cart    ${cart_id}    ${nouvelles_donnees_dict}
    Should Be True    ${result} == 1    msg=Échec de la modification
    ${cart}    MongoDB.Get Cart    ${cart_id}
    Log To Console    \n=== MODIFICATION REUSSIE ===\nNouvelles valeurs: ${nouvelles_donnees_dict}\nRésultat: ${cart}\n==========
    [Return]    ${result}

Supprimer Cart Et Logger
    [Arguments]    ${cart_id}
    ${cart}    MongoDB.Get Cart    ${cart_id}
    ${result}    MongoDB.Delete Cart    ${cart_id}
    Should Be True    ${result} == 1    msg=Échec de la suppression
    Log To Console    \n=== SUPPRESSION ===\nCart supprimé: ${cart}\nRésultat: ${result} document(s) supprimé(s)\n==========
    [Return]    ${result}

# Categories Keywords
Creer Category Et Logger
    [Arguments]    ${donnees}
    ${donnees_dict}    Convertir En Dictionnaire    ${donnees}
    ${id_category}    MongoDB.Create Category    ${donnees_dict}
    Should Not Be Equal    ${id_category}    ${None}
    ${category}    MongoDB.Get Category    ${id_category}
    Log To Console    \n=== CATEGORY AJOUTÉE ===\n${category}\n==========
    [Return]    ${id_category}

Recuperer Category Et Logger
    [Arguments]    ${category_id}
    ${category}    MongoDB.Get Category    ${category_id}
    Should Not Be Equal    ${category}    ${None}    msg=Category non trouvée avec l'ID: ${category_id}
    Log To Console    \n=== CATEGORY TROUVÉE ===\n${category}\n==========
    [Return]    ${category}

Modifier Category Et Logger
    [Arguments]    ${category_id}    ${nouvelles_donnees}
    ${nouvelles_donnees_dict}    Convertir En Dictionnaire    ${nouvelles_donnees}
    ${result}    MongoDB.Update Category    ${category_id}    ${nouvelles_donnees_dict}
    Should Be True    ${result} == 1    msg=Échec de la modification
    ${category}    MongoDB.Get Category    ${category_id}
    Log To Console    \n=== MODIFICATION REUSSIE ===\nNouvelles valeurs: ${nouvelles_donnees_dict}\nRésultat: ${category}\n==========
    [Return]    ${result}

Supprimer Category Et Logger
    [Arguments]    ${category_id}
    ${category}    MongoDB.Get Category    ${category_id}
    ${result}    MongoDB.Delete Category    ${category_id}
    Should Be True    ${result} == 1    msg=Échec de la suppression
    Log To Console    \n=== SUPPRESSION ===\nCategory supprimée: ${category}\nRésultat: ${result} document(s) supprimé(s)\n==========
    [Return]    ${result}
