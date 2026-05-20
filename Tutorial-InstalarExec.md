## INSTALAR PROGRAMAS

////////////////////////////////////////////////////////////////////////////////////////

Usar <winget> em vez de usar a env var \_\_Compat\_layer (), que foi o Diogo Carril que inspirou a procura desta informação. 

Qnd ele disse em chamada que dava pa instalar cenas sem aparecer UAC dimmed.

////////////////////////////////////////////////////////////////////////////////////////



set \_\_COMPAT\_LAYER=RunAsInvoker

\# a partir daqui dá para exec qql instalador .exe



Como funciona E oq é \_\_Compat\_Layer ?



Qnd instalamos qql programa, o instalador desse programa tem 1 manifesto, o manifesto é 1 bloco de código dentro de 1 .exe que diz "preciso de admin" OU "não preciso", mais em específico -> o manifesto diz ao WINDOWS que nível de perms usa "asInvoker" || "requireAdministrator", com essa env var ignoramos o manifesto e corremos com as perms do nosso user. 

Mas neste caso temos acesso restrito, sempre que tentamos instalar algo pede creds numa janela dimmed.



A variável Compat\_layer é 1 env var que força o windows a ignorar esse manifesto, e atribuimos a essa env var "RunAsInvoker" como o nome diz, corremos esse .exe com permissões do user atual que lançou a cmd.







## EXECUTAR SCRIPTS .ps1

\#### No entanto isto NÃO nos permite executar scripts (ps1) -> .exe tem incompatibilidade nem sequer vale a pena tentar

Para executar scripts .ps1 que tbm são bloqueados, EXEMPLO:



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



*PS C:\\Users\\FilipeGomes\\OneDrive - Claranet Portugal\\Desktop> .\\print.ps1*

*.\\print.ps1 : File C:\\Users\\FilipeGomes\\OneDrive - Claranet Portugal\\Desktop\\print.ps1 cannot be loaded because*

*running scripts is disabled on this system. For more information, see about\_Execution\_Policies at*

*https:/go.microsoft.com/fwlink/?LinkID=135170.*

*At line:1 char:1*

*+ .\\print.ps1*

*+ \~\~\~\~\~\~\~\~\~\~\~*

&#x20;   *+ CategoryInfo          : SecurityError: (:) \[], PSSecurityException*

&#x20;   *+ FullyQualifiedErrorId : UnauthorizedAccess*

*PS C:\\Users\\FilipeGomes\\OneDrive - Claranet Portugal\\Desktop>*



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



Podemos dar Bypass temporário para executar scripts .ps1 sem precisar de admin, usando o seguinte comando:

* powershell -ExecutionPolicy Bypass -File <_nome_>.ps1



Isso diz ao Powershell "para este comando, ignora as regras de segurança e corre o script na msm".



Isto apenas funciona pq não tem GPOs aplicadas(seria o mais seguro usar, pela rigidez). Verifica-se com:

* Get-ExecutionPolicy -List



EXEMPLO:



///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



PS C:\\Users\\FilipeGomes\\OneDrive - Claranet Portugal\\Desktop> Get-ExecutionPolicy -List



&#x20;       Scope ExecutionPolicy

&#x20;       ----- ---------------

MachinePolicy       Undefined

&#x20;  UserPolicy       Undefined

&#x20;     Process       Undefined

&#x20; CurrentUser       Undefined

&#x20;LocalMachine       Undefined



Undefined == NÃO HÁ nenhuma política ativa/configurada em nenhum destes scopes.

O sistema aplica o valor default qnd não há nenhum valor definido em ExecutionPolicy -> que é Restricted (impede correr scripts mas mt fácil de dar bypass)

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



