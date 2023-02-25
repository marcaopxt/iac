# Create a kind cluster of the name "test-cluster" with default kubernetes
# version specified in kind
# ref: https://github.com/kubernetes-sigs/kind/blob/master/pkg/apis/config/defaults/image.go#L21
provider "kind" {}

resource "kind_cluster" "default" {
    name           = "local-kind"
    wait_for_ready = true

  kind_config {
      kind        = "Cluster"
      api_version = "kind.x-k8s.io/v1alpha4"

      node {
          role = "control-plane"

          kubeadm_config_patches = [
              "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
          ]

          extra_port_mappings {
              container_port = 80
              host_port      = 8000
          }
          extra_port_mappings {
              container_port = 443
              host_port      = 8443
          }
      }

      node {
          role = "worker"
      }
  }
}