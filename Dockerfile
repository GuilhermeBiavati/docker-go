FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go build codeeducation.go

FROM scratch

COPY --from=builder /app/codeeducation /app/codeeducation

ENTRYPOINT ["/app/codeeducation"]