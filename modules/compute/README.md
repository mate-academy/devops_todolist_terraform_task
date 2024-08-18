# **Azure Compute Module**
## **Prerequisities**
* RESOURCE GROUP
* SUBNET
* PUBLIC IP
* BASH SCRIPT HOSTED ON WEB
## **Configurable resources**
### 1) **Network Interface**
* **CONFIGURABLE SETTINGS**
  * NAME
  * IP CONFIGURATION
    * Name
    * Private IP allocation
    * Private IP address (optional)
    * Public IP association
### 2) **Linux Virtual Machine**
* **CONFIGURABLE SETTINGS**
  * NAME
  * SIZE
  * ADMIN USERNAME
  * OS DISK NAME
  * OS DISK SIZE
  * OS DISK STORAGE ACCOUNT TYPE
  * SET LINK FOR BASH SCRIPT DOWNLOAD && RUN
## **Important module features**
* EACH VARIABLE INPUT IS ERROR PROOF
* EACH VARIABLE & OUTPUT HAS `comp_` PREFIX