/*
 * grunt-underscoreTpl-build
 * https://github.com/root/grunt-underscoreTpl-build
 *
 * Copyright (c) 2015 wenxiang.hu
 * Licensed under the MIT license.
 */
'use strict';

module.exports = function(grunt) {

    var fs = require('fs'),
        paths = require('path'),
        utils = require('./lib.js');

    // Please see the Grunt documentation for more information regarding task
    // creation: http://gruntjs.com/creating-tasks

    grunt.registerMultiTask('underscoreTpl_build', 'The best Grunt plugin ever.', function() {
        // Merge task-specific and/or target-specific options with these defaults.
        var options = this.options({
            extname: ['.tpl'],
            folderName: 'tpl',
            destExt: '-tpl.js'
        });
        var reg = new RegExp('([^\/]*)\/'+options.folderName+'(\/([^\/]*))?'),
            fileTree,
            fileMap = {};
        this.files.forEach(function(f){
            f.src.forEach(function(filepath){
                if(!grunt.file.exists(filepath)){
                    grunt.log.warn('Source file "' + filepath + '" not found.');
                    return false;
                }else{
                    fileTree = utils.scanFolder(filepath);
                    var buildMap = build(fileTree),
                        dest = f.dest;
                    for(var item in buildMap){
                        var matchs = item.match(reg),
                            keyName = '';
                        if(matchs){
                            var footer = matchs[3],
                                foldername = matchs[1],
                                keyName = item.slice(0,matchs.index).replace(filepath,dest);
                            if(footer){
                                keyName += foldername+'/'+foldername+'-'+footer+options.destExt;
                            }else{
                                keyName += foldername+'/'+foldername+options.destExt;
                            }
                        }else{
                            grunt.log.writeln(item+'写入异常');
                            return;
                        }
                        fileMap[item] = keyName;
                        grunt.file.write(keyName,buildMap[item]);
                        grunt.log.writeln('file  '+keyName+'  created.');
                    }
                }
            })
        });
        grunt.underscoreBuild = {
            fileTree: fileTree,
            fileMap: fileMap
        };
        function build(fileTree){
            var resultMap = {};

            eachTree(fileTree);
            return resultMap;

            function eachTree(fileObj){
                if(fileObj.baseName === options.folderName){
                    readyBuild(fileObj);
                }else if(fileObj.hasChildFolder){
                    fileObj.folderList.forEach(function(item){
                        eachTree(fileObj[item]);
                    })
                }
            }

            function readyBuild(fileObj){
                if(fileObj.hasChildFolder){
                    fileObj.folderList.forEach(function(item){
                        buildItem(fileObj[item]);
                    });
                    if(fileObj.fileList){
                        buildItem(fileObj);
                    }
                }else{
                    buildItem(fileObj);
                }
            }

            function buildItem(fileObj){
                var resultStr = '{';
                fileObj.fileList.forEach(function(item){
                    var extName = paths.extname(item);
                    if(options.extname.indexOf(extName) === -1){
                        grunt.log.writeln(item+'  未参与编译');
                        return;
                    }
                    var baseName = paths.basename(item,extName),
                        tmpStr = fs.readFileSync(item,'utf-8');
                    if(!!tmpStr){
                        tmpStr = tmpStr.toString().replace(/\n|\r/g,'').replace(/(    )+/g,'    ');
                        tmpStr = utils.template(tmpStr);
                        resultStr += '"'+baseName+'": (function(){\n  try{var render = function(obj, _){\n    '+tmpStr+';};\n    return render;}catch(e){throw new Error("模板编译异常")}})(),';
                        grunt.log.writeln(item+'  编译成功');
                    }else{
                        grunt.log.writeln(item+'  编译失败');
                    }
                });
                resultStr = resultStr.length > 1 ? resultStr.slice(0,-1) : resultStr;
                resultStr += '}';
                resultStr = ';(function(){var tpl ='+resultStr+';var _.tpl = _.__tpl || {};_.extend(_.__tpl,tpl);_.getTpls = function(id){if(_.__tpl[id]){return function(data){return _.__tpl[id].call(this,data,window._);}}};})(window);';
                resultMap[fileObj.basePath] = resultStr;
            }
        }
    });

};
