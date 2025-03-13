
{ ... }:
{
  services.syncthing = {
    enable = true;
    user = "ryanl";
    settings = {
    devices = {
      "unraid" = { id = "QILJ4OH-77DNRGK-YLLFBCL-WMBK6EH-RKNNQJM-KUU3LH5-QUKB5LD-2XLNTQ7"; };
      "craptop" = {id = "PPA44TF-PEVQDT4-NLH7TNP-Z6QB4CN-NOSYWVB-L5CAF4V-5TXYBZV-2WTJBAO"; };
    };
    };
  };
}
