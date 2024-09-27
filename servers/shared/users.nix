{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.seventh = {
    isNormalUser = true;
    home = "/home/seventh";
    createHome = true;
    extraGroups = [ "wheel" "networkmanager" "taskd" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbjZexUZyUFNkI6vH1nUlb68+Oqj7qn5R6PYYzmjxvJXIye4foY+BC7uQRqDt30DxdQllNnGcg4cw8mXcGdAhNNjKErdXzZdMtLsIq5Frj6OjeKkGcNYVUFPETwx3UyQrqgQ+VQSrLce72F0R38NMKzLcMsQc1+/Bx0G8VxRjGpSmDys8wSpLU2IQ8IIjpTMQilNKFuvrdhqiX+a5pcukghwvdUg02Ty5sZahLXQ5uAV44T/lylar4qVGvbsowEgTZy4yUY3za47Vv5IwHgXrbUElw52IvgtuIfypxAMMgs6zecoFrxKT1GT1cOm0JgOCZXPKy26vJwdsSuUpGcx0b seventh@skyhigh"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDaF639wHQO8QypBuvDoy7DUgrFdYrhYtXZ4xJJ+GrLThbV+h5HhqLM//vRurFNrLzCux2yF616sm+Y85gaFoKkF0S+RQ8Yvd6/7eTQfiKiqRbYI/hsbSF8hBfrhYtVpia11THxmy8gB7F3xOepK8lLW/ztvwUBJcVldymuN/srU3IDSmSUYqnFBpYQhS6fBVQmN9A2SeUR02zl+UdFvt9y7u5uQ2GYY5o0+mebodnHevVqxWGQqP3TwNYNLww0WaeLu44p2QvrmOygJHhQ2azBWUx4/Krdt3uIFv9HnKz6qPPJ7iehts0BsunJv85+rzNQymWaUL+wnqx+SDq7wpyT seventh@studio1"
    ];
    packages = with pkgs; [
      firefox
      weechat
    ];
  };

  security = {
    sudo = {
      execWheelOnly = true;
      wheelNeedsPassword = false;
    };
  };

}
