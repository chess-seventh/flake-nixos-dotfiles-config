kb_nodes_ip_ssh() {
        for node in $(kb get nodes -o wide -o json | jq '.items[].status.addresses[0].address' | sed 's/"//g') ; do echo "ssh -i ~/.ssh/bm-aws ec2-user@$node" ; done
}

kblf () {
        kubectl logs -n $1 -f
}

kbdp () {
        kubectl describe -n $1 pod
}

