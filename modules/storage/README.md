# **Azure Compute Module**
## **Prerequisities**
* RESOURCE GROUP
## **Configurable resources**
### 1) **Storage Account**
* **CONFIGURABLE SETTINGS**
  * NAME
  * TIER
  * ACCESS TIER
    * will not be used with "Storage" account kind
  * KIND
    * BlockBlobStorage & FileStorage do not support "Premium" Account tier
  * REPLICATION TYPE
### 2) **Storage Container**
* **CONFIGURABLE SETTINGS**
  * NAME
  * ACCESS TYPE
## **Important module features**
* EACH VARIABLE INPUT IS ERROR PROOF
* EACH VARIABLE & OUTPUT HAS `strg_` PREFIX