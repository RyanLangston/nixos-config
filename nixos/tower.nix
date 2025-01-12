{ ... }:

{
  fileSystems."/mnt/tower" = {
    device = "root@tower.local:/mnt/user";
    fsType = "fuse.sshfs";
    options = [
      "identityFile=/root/.ssh/id_ed25519"
      "idmap=user"
      "x-systemd.automount"
      "allow_other"
      "user"
      "_netdev"
    ];
  };
  boot.supportedFilesystems."fuse.sshfs" = true;
}
