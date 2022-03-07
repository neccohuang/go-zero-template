Name: {{.serviceName}}.rpc
ListenOn: 127.0.0.1:8080
{{if .consul}}
Consul:
  Host: 127.0.0.1:8500
  Key: txpay.rpc
  Check: grpc
  Meta:
    Protocol: grpc
  Tag:
    -
{{else}}
Etcd:
  Hosts:
  - 127.0.0.1:2379
  Key: {{.serviceName}}.rpc
{{end}}
