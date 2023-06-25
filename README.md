go run main.go -server.http-listen-port=5000

GOARCH=arm64 go build -o app main.go
docker buildx build --platform linux/arm64 -t lucenabruno/demo-app:latest --push .

GOARCH=arm64 go build -o db main.go
docker buildx build --platform linux/arm64 -t lucenabruno/demo-db:latest --push .

GOARCH=arm64 go build -o loadgen main.go
docker buildx build --platform linux/arm64 -t lucenabruno/demo-loadgen:latest --push .
