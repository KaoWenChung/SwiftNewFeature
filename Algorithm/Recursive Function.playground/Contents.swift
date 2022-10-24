/*
 Recursive function is useful for that kind of question we need to dive into multiple layers of problem without knowing how many layers there are
 
 Title: Filesystem Traversal
 Printing all the subdirectory names. However, you don’t want the script to only handle the immediate subdirectories
 you want it to act on all the subdirectories within the subdirectories of the directory and all of their subdirectories,
 and so on.
*/
struct Folder {
    var name: String = ""
    var directories: [Folder] = []
}

func findDirectories(directory: String, folder: Folder) {
    folder.directories.forEach { file in
        let log = directory + "/" + file.name
        print(log)
        if file.directories.isEmpty { return }
        findDirectories(directory: log, folder: file)
    }
}

let dir1 = Folder(name: "root", directories: [
    Folder(name: "Daniel", directories: [Folder(name: "Pics", directories: [
        Folder(name: "Fun", directories: [Folder(name: "Basketball", directories: []),
                                          Folder(name: "Swimming", directories: [])]),
        Folder(name: "Work", directories: []),
        Folder(name: "Family", directories: [])
    ])]),
    Folder(name: "Ben", directories: [Folder(name: "Work", directories: [
        Folder(name: "App", directories: []),
        Folder(name: "Web", directories: [])
    ])]),
    Folder(name: "Hanz", directories: [Folder(name: "Work", directories: [
        Folder(name: "App", directories: []),
        Folder(name: "Web", directories: [])
    ])])
])

findDirectories(directory: dir1.name, folder: dir1)
