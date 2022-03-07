{{.head}}

package server

import (
	{{if .notStream}}"context"{{end}}
    {{if .check}}"google.golang.org/grpc/health/grpc_health_v1"{{end}}
	{{.imports}}
)

type {{.server}}Server struct {
	svcCtx *svc.ServiceContext
}

func New{{.server}}Server(svcCtx *svc.ServiceContext) *{{.server}}Server {
	return &{{.server}}Server{
		svcCtx: svcCtx,
	}
}

{{if .check}}
func (s *TxPayServer) Check(ctx context.Context, req *grpc_health_v1.HealthCheckRequest) (*grpc_health_v1.HealthCheckResponse, error) {
	return &grpc_health_v1.HealthCheckResponse{
		Status: grpc_health_v1.HealthCheckResponse_SERVING,
	}, nil
}

func (s *TxPayServer) Watch(req *grpc_health_v1.HealthCheckRequest, w grpc_health_v1.Health_WatchServer) error {
	return nil
}
{{end}}

{{.funcs}}
