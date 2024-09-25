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
    kubectl
    opentofu
    pulumi
    pulumictl
    pulumi-esc
    terraform
    terragrunt

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
