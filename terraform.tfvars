resource_group_name = "mate-azure-task-12"
location            = "uksouth"
ssh_key_public      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNIy5u9C9+oTCDpSF/z+mqBMjVL5VB6DC/j+zATQR/9XiFnxLCHIOxE/mTmNtfW3LGkGI9mzeRRVPqHTvWo8MlSppKOD3Qli/Ha/NdDfjZUkeym/p+H/8wdMYDIlwDPk5qX8hnE2eH2vMm+OPFnk2oJ0ZyTVr9eDn+aVd4QGESkrq2gqSmH7u1Yil9GW1HgGuPA2RJuy3/DFOXxFuoEMWIxpDluh4k161eIdI9VKUOAAP5MBU2iraG3XhdNFXCt7li5IS1mjxl3q2Kd4Iy0RB32LAljcuGd5LherGroY0+wk1USmNFwY3nDj4pm8csH45phs62ta7iUs8uN40OmHy1pFMpbDxDQPH8BhPm4llJTF3mvD7ZNOB4a0Q9yh3JKYsulghgTl+VId+aYHn5VLM3wWYW2JDztQLVg1p9e59UwqDwU6IVDgCnLLYdEO4Q0wOAPuin08pdKMaigNG1YcWkIP4r+r0MKnLKU5EbkehNRS9k8wJQsGhMbpoaE0y+RAM548ht/jp+JkX1x+EG6j3GuzfgHktziSOXcPpRWI7rxliZexYYkHuQ8LRk21qTQou6lxCwocxgJruBjTKu/QF+DCEosqAsu+jUi6dB64u7aZROMzs0iokUq9BUS1HT+ShZAyQY4KtIOS88IZ0/zeHCIx1W+cP0qaOTJNkYjmfIyQ== vladyslav.gusakovskiy@MacBook-Pro-Vladislav.local"

random_num              = 10
public_ip_name          = "linuxboxpip"
net_security_group_name = "defaultnsg"
vnet_name               = "vnet"
vnet_address_pref       = ["10.0.0.0/16"]
subnet_name             = "default"
address_prefix          = ["10.0.0.0/24"]
dns_label               = "matetask"

vm_name           = "matebox"
vm_extension_name = "mate_vm_extension"
vm_size           = "Standard_B1s"

storage_acc_name  = "matestorageacc"
storage_cont_name = "matestoragecont"