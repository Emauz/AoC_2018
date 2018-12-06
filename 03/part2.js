function readinput(filename) {
    var input = readFile(filename);
    var lines = input.split("\n");
    print(lines[0]);
    var datas = new Array(lines.size);
    for(var i=0;i<lines.length;i++){
        datas[i] = lines[i].split(/[,x: ]/);
    }
    return datas;
}

function array2d(size){
    var array2d = new Array(size);
    for(var i = 0;i<size;i++){
        array2d[i] = new Array(size);
        for(var j=0;j<array2d.length;j++){
            array2d[i][j] = 0;
        }
    }
    return array2d;
}

/**
** ARRAY INDEX LIST:
** 2: x offset
** 3: y offset
** 5: x size
** 6: y size
*/

function main(){
    var totalCount = 0;
    var datas = readinput("input");
    var board = array2d(1000);
    for(var i=0;i<datas.length;i++){ // for each entry
        // for each row
        var xoff = parseInt(datas[i][2]);
        var yoff = parseInt(datas[i][3]);
        for(var j=0;j<datas[i][5]; j++){
            for(var k=0;k<datas[i][6]; k++){
                if(board[j + xoff][k + yoff] == 1){
                    totalCount++;
                }
                board[j + xoff][k + yoff]++;
            }
        }
    }
    for(var i=0;i<datas.length;i++){ // for each entry
        // for each row
        var xoff = parseInt(datas[i][2]);
        var yoff = parseInt(datas[i][3]);
        var totalOverlap = 0;
        for(var j=0;j<datas[i][5]; j++){
            for(var k=0;k<datas[i][6]; k++){
                if(board[j + xoff][k + yoff] == 1){
                    totalCount++;
                } else {
                    totalOverlap++;
                }
            }
        }
        if(totalOverlap == 0){
            print(datas[i][0]);
        }
    }
}

main();
