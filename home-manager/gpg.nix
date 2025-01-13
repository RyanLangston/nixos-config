{ ... }:
{
  programs.gpg.publicKeys = [
    {
      source = ./yubikey_pub.key;
      trust = 5;
    }
  ];
}
