{
  config,
  ...
}: {
  services.avizo = {
    enable = true;
    settings = {
      default = {
        time = 2.0;
        y-offset = 0.5;
        fade-in = 0.1;
        fade-out = 0.2;
        padding = 10;
        };
    };
  };
}
