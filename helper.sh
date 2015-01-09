#!/bin/sh

# Helper script untuk posting pake octopress, karena ga hafal klo harus
# jalanin manual :'(

new_post() {
    echo -n "Judul postingan: "
    read judul

    rake new_post["$judul"]
}

publish() {
    git add .
    git commit -m "Tambah postingan"
    git commit && push origin source
    rake generate && rake deploy

    # pinging search engine
    rake notify
}

preview() {
    rake generate && rake preview
}

quit() {
    echo "Exit"
    exit 1
}

main() {
    echo "[ Octopress Helper ] ------------------------------------------------"
    echo "1) New Post"
    echo "2) Preview"
    echo "3) Publish"
    echo -n "[1 - 3]: "
    read pilihan
    case $pilihan in
        1) new_post
           ;;
        2) preview
           ;;
        3) publish
           ;;
        *) quit
           ;;
    esac
}

main