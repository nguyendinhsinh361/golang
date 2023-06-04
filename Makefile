postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=123456 -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root shin

dropdb:
	docker exec -it postgres12 dropdb shin

migrateup:
	migrate -path db/migration -database "postgresql://root:123456@localhost:5432/shin?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:123456@localhost:5432/shin?sslmode=disable" -verbose down

sqlc: 
	docker run --name sqlc --rm -v "C:/Users/Sinhthuatthom/Desktop/Golang:/src" -w /src kjconroy/sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test