#!/bin/sh

# Helper script untuk posting pake octopress, karena ga hafal klo harus
# jalanin manual :'( plus males klo harus nulis satu2 ~_~'

judul=""
file=""

new_post() {
    echo -n "Judul postingan: "
    read judul

    echo -n "Masukkan kategori: "
    read kategori

    tmp=`rake new_post["$judul"]`

    # ambil direktori source/post + trim string-nya :)
    # klo di java mah sama kek split(":")[1].trim()
    file=`echo $tmp | cut -d ':' -f 2 | tr -d ' '`

    echo "Berhasil membuat $file"

    # Tambah opsi sharing true
    sharingline='sharing: true'
    commentline='comments: true'
    sed -i "s|$commentline|$commentline\n$sharingline|" $file

    categories='categories:'
    kategori="- $kategori"
    sed -i "s|$categories|$categories\n$kategori|" $file

    tags_label="tags:"

    # insert tags
    sed -i "s|$kategori|$kategori\n$tags_label|" $file
    echo -n "Masukkan nama tag (ex: tag1 tag2 tag3 tag4): "
    read jwb
    for tag in $jwb ; do
        tag="- $tag"
        sed -i "s|$tags_label|$tags_label\n$tag|" $file
    done

    keywords=`echo $jwb | tr ' ' ', '`
    keyword_line='keywords: "'$keywords'"'
    sed -i "s|$sharingline|$sharingline\n$keyword_line|" $file

    echo "File $file berhasil di edit, dengan hasil :"
    cat $file
}

publish() {
    git add .
    git commit -m "Tambah postingan $judul"
    git commit && push origin source
    rake generate && rake deploy

    # ping search engine
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