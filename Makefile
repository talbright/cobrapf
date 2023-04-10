.PHONY:
gen-echo-service:
	protoc -I . --grpc-gateway_out ./gen/go \
		--grpc-gateway_opt logtostderr=true \
		--grpc-gateway_opt paths=source_relative \
		proto/echo_service.proto
	protoc -I . \
		--go_out ./gen/go/ --go_opt paths=source_relative \
		--go-grpc_out ./gen/go/ --go-grpc_opt paths=source_relative \
		proto/echo_service.proto

.PHONY:
gen-echo-cmd:
	protoc -I . \
		--go_out ./cmd/echo --go_opt paths=source_relative \
		proto/echo_cmd.proto

.PHONY:
install-tools:
	go install \
		github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway \
		github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2 \
		google.golang.org/protobuf/cmd/protoc-gen-go \
		google.golang.org/grpc/cmd/protoc-gen-go-grpc