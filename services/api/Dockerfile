# Build stage
FROM golang:1.23 AS build
WORKDIR /src
COPY go.mod ./
RUN go mod download
COPY services/api ./services/api
RUN CGO_ENABLED=0 go build -o /out/api ./services/api

# Runtime stage: distroless, non-root
FROM gcr.io/distroless/static-debian12:nonroot
COPY --from=build /out/api /api
EXPOSE 8080
ENTRYPOINT ["/api"]
