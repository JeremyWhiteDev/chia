package main

import (
	"html/template"
	"net/http"
)

func helloWorld(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "text/html")
	data := "Hello World"
	tmpl := template.Must(template.ParseFiles("templates/index.html", "templates/sign-in-form.html"))
	
	tmpl.Execute(w, data)
}


func main() {
	mux := http.NewServeMux()

	mux.HandleFunc("/", helloWorld)

	// Serve up static css files
	fs := http.FileServer(http.Dir("./style"))

	// Strip prefix, otherwise it is passed to the fs
	mux.Handle("/style/", http.StripPrefix("/style", fs))

	if err := http.ListenAndServe(":8080", mux); err != nil {
		panic(err)
	}
}