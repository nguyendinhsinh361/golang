package sqlc

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)
const (
	dbDriver = "postgres"
	dbSource = "postgresql://root:123456@localhost:5432/shin?sslmode=disable"
)
var testQueries *Queries
var testDB *sql.DB

func TestMain(m *testing.M) {
	var err error
	testDB, err = sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("Cannot connect to db:", err)
	}

	testQueries = New(testDB)
	os.Exit(m.Run())
}