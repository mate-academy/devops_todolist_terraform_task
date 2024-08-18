# **Azure Network Module**
## **Prerequisities**
* RESOURCE GROUP
## **Configurable resources**
### 1) **Virtual Network**
* **CONFIGURABLE SETTINGS**
  * NAME
  * ADDRESS SPACE
### 2) **Subnet**
* **CONFIGURABLE SETTINGS**
  * NAME
  * ADRESS PREFIXES
### 3) **Network Security Group**
* **CONFIGURABLE SETTINGS**
  * NAME
  * SECURITY RULES
### 4) **Public IP**
* **CONFIGURABLE SETTINGS**
  * NAME
  * ALLOCATION SETTINGS
    #### 1) Basic Dynamic
    * **Availability**: No SLA, lower reliability.
    * **Assignment**: Dynamic only; IP may change on resource restart.
    * **Traffic**: Inbound traffic allowed by default.
    * **Resilience**: Not zone-resilient.
    * **Price**: Cheaper. *(*FREE for AZURE learning subscription)*
    #### 2) Standard Dynamic
    * **Availability**: 99.99% SLA, higher reliability.
    * **Assignment**: Dynamic; IP may change on restart.
    * **Traffic**: Inbound traffic blocked by default; NSG needed.
    * **Resilience**: Zone-resilient.
    * **Price**: More expensive.
    #### 3) Standard Static
    * **Availability**: 99.99% SLA, higher reliability.
    * **Assignment**: Static; IP remains the same even after a restart.
    * **Traffic**: Inbound traffic blocked by default; NSG needed.
    * **Resilience**: Zone-resilient.
    * **Price**: More expensive.
  * DNS LABEL
    * will be constructed using your chosen prefix and 5 digit random number
## **Important module features**
* EACH VARIABLE INPUT IS ERROR PROOF
* EACH VARIABLE & OUTPUT HAS `net_` PREFIX