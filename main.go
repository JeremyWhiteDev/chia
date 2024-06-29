package main

import (
	"html/template"
	"net/http"
)

func helloWorld(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/html")
	data := "Hello World"
	tmpl := template.Must(template.ParseFiles("templates/index.html", "templates/card.html"))
	
	tmpl.Execute(w, data)
}

func main() {
	mux := http.NewServeMux()

	mux.HandleFunc("/{$}", helloWorld)

	if err := http.ListenAndServe(":8080", mux); err != nil {
		panic(err)
	}
}