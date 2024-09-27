{ config , ... }:

{
  services.k3s = {
    enable = false;
    role = if config.networking.hostName == "nixos-blackark" then "server" else "agent";
    token = if config.networking.hostName != "nixos-blackark" then "8817a6b8677d84ce1760c0ebacdbcbd8" else "";
    serverAddr = if config.networking.hostName != "nixos-blackark" then "https://192.168.70.65:6443" else "";
  };
}
