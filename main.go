package main

import (
	"fmt"
	"net/http"
)

func helloWorld(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/plain")
	fmt.Fprint(w, "Hello World") 
}

func main() {
	mux := http.NewServeMux()

	mux.HandleFunc("/", helloWorld)

	if err := http.ListenAndServe(":8080", mux); err != nil {
		panic(err)
	}
}