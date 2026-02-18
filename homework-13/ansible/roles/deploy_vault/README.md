#  sudo kubectl exec -n vault vault-0 -- vault operator init -key-shares=1 -key-threshold=1
#  sudo kubectl exec -n vault vault-0 -- vault operator unseal k62+bQxp8WtPZe1jLuE0GcvMli/PdukE5Ckmla7QF7A=
#  sudo kubectl exec -ti -n vault vault-1 -- vault operator raft join http://vault-0.vault-internal:8200
#  sudo kubectl exec -n vault vault-1 -- vault operator unseal k62+bQxp8WtPZe1jLuE0GcvMli/PdukE5Ckmla7QF7A=
#  sudo kubectl exec -ti -n vault vault-2 -- vault operator raft join http://vault-0.vault-internal:8200
#  sudo kubectl exec -n vault vault-2 -- vault operator unseal k62+bQxp8WtPZe1jLuE0GcvMli/PdukE5Ckmla7QF7A=
#  sudo kubectl exec -ti -n vault vault-0 -- vault login
#  sudo kubectl exec -ti -n vault vault-0 -- vault operator raft list-peers


#  Unseal Key 1: k62+bQxp8WtPZe1jLuE0GcvMli/PdukE5Ckmla7QF7A=
#  Initial Root Token: hvs.bamJ8arDYNIUJ0EU8GVVLblQ