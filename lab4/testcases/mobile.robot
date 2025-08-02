*** Settings ***
Library           AppiumLibrary

Variables         ../po/variables.py
Resource          ../resources/common.robot

Suite Setup       Open Application MyApp


*** Test Cases ***
Complete Product Management Flow
    # Ce test combine la connexion et la gestion du produit en un seul flux
    Enter username
    Enter password
    Log In
    Fill the Form
     Check Product
    