function dircount(dir) {
    return dir.split("\\").length - 1;
}

function find_version_file() {
    var fso = new ActiveXObject("Scripting.FileSystemObject");
    var start = ".";
    var cd = fso.GetAbsolutePathName(".");
    print(cd);
    var count = dircount(cd);
    for (var i=0; i<count; i++){
        if (fso.FileExists(cd + "\\.ruby-version")){
            return cd + "\\.ruby-version";
        } 
        cd = cd + "\\..";
    }
    return false;
}

//Version File
print(find_version_file());

