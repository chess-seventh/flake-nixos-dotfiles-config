{
inputs,
lib,
pkgs,
config,
...
}: {

  home.packages = with pkgs; [
    argo-rollouts
    awscli2
    aws-sam-cli
    helmfile
    k3sup
    k9s
    opentofu
    pulumi
    pulumictl
    pulumi-esc
    pulumiPackages.pulumi-language-python
    python312Packages.pulumi
    terraform
    terragrunt
    unstable.kubectl

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
