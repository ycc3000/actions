# kubectl
```
demoname: CI
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: ycc3000/actions/kubectl@master
      name: "Use Kubectl"
      with:
        kubeconfig_base64data: '${{ secrets.KUBECONFIG_BASE64DATA }}'
        args: get nodes --insecure-skip-tls-verify
        #run: |
        #  echo '--------Run after get nodes-------------'
        #  echo 'kubectl config view'
        #  kubectl config view
```