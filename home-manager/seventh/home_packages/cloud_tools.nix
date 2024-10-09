{
inputs,
lib,
pkgs,
config,
...
}: {

  home.packages = with pkgs; [
    awscli2
    aws-sam-cli
    helmfile
    k9s
    unstable.kubectl
    opentofu
    pulumi
    pulumictl
    pulumi-esc
    pulumiPackages.pulumi-language-python
    python312Packages.pulumi
    terraform
    terragrunt
    # k3s
    k3sup

    # kubectl plugins
    krew 

    kubernetes-helm
    (wrapHelm kubernetes-helm {
        plugins = with pkgs.kubernetes-helmPlugins; [
          helm-secrets
          helm-diff
          helm-s3
          helm-git
        ];
      })
    ];

}
