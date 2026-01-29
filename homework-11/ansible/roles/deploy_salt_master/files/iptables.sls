set_default_policy_input:
  iptables.set_policy:
    - table: filter
    - chain: INPUT
    - policy: DROP
    - save: True
    - comment: "Default input policy- DROP"

allow_lo:
  iptables.append:
    - table: filter
    - chain: INPUT
    - in_interface: lo
    - connstate: NEW
    - jump: ACCEPT
    - save: True
    - comment: "Allow loopback"

allow_established_related:
  iptables.append:
    - table: filter
    - chain: INPUT
    - match: state
    - connstate: ESTABLISHED,RELATED
    - jump: ACCEPT
    - save: True
    - comment: "Allow established, related"

allow_ssh:
  iptables.append:
    - table: filter
    - chain: INPUT
    - protocol: tcp
    - dport: 22
    - connstate: NEW
    - jump: ACCEPT
    - save: True
    - comment: "Allow ssh"

allow_http:
  iptables.append:
    - table: filter
    - chain: INPUT
    - protocol: tcp
    - dport: 80
    - connstate: NEW
    - jump: ACCEPT
    - save: True
    - comment: "Allow http"
